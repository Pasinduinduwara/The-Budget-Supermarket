"""
Analytics API Router - Business Intelligence and Data Mining.
Integrated with Advanced SQL Objects (Views, Functions, Procedures).
"""

from fastapi import APIRouter, HTTPException, Depends, Query
from typing import List
from app.models.analytics import (
    DashboardStats, SalesTrendResponse, SalesTrendData,
    TopProductsResponse, TopProduct, CustomerSegmentationResponse,
    CustomerSegment, MarketBasketResponse, MarketBasketItem,
    InventoryInsightsResponse, InventoryInsight,
    SupplierPerformanceResponse, SupplierPerformance
)
from app.database import DatabaseConnection, get_db
import pyodbc
import logging
from datetime import date, timedelta
from decimal import Decimal

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/analytics", tags=["Analytics"])


@router.get("/dashboard-stats", response_model=DashboardStats)
async def get_dashboard_stats(db: DatabaseConnection = Depends(get_db)):
    """Get overall dashboard statistics using SQL processing."""
    try:
        with db.get_cursor() as cursor:
            stats = {}
            
            cursor.execute("SELECT COUNT(*) FROM Item")
            stats['total_items'] = cursor.fetchone()[0]
            
            cursor.execute("SELECT COUNT(*) FROM Customer")
            stats['total_customers'] = cursor.fetchone()[0]
            
            cursor.execute("SELECT COUNT(*) FROM Orders")
            stats['total_orders'] = cursor.fetchone()[0]
            
            # Using BI View
            cursor.execute("SELECT ISNULL(SUM(Total_Revenue), 0) FROM vw_CategorySalesPerformance")
            stats['total_sales'] = cursor.fetchone()[0]
            
            # Using Operational View
            cursor.execute("SELECT COUNT(*) FROM vw_InventoryHealth WHERE Health_Status = 'CRITICAL'")
            stats['low_stock_count'] = cursor.fetchone()[0]
            
            cursor.execute("SELECT COUNT(*) FROM Supplier")
            stats['total_suppliers'] = cursor.fetchone()[0]
            
            return stats
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/sales-trends", response_model=SalesTrendResponse)
async def get_sales_trends(
    days: int = Query(30, description="Number of days to analyze"),
    db: DatabaseConnection = Depends(get_db)
):
    """Get sales trend analysis."""
    try:
        with db.get_cursor() as cursor:
            end_date = date.today()
            start_date = end_date - timedelta(days=days)
            
            cursor.execute("""
                SELECT o.order_date, 
                       ISNULL(SUM(r.total_amount), 0) as total_sales,
                       COUNT(DISTINCT o.order_id) as order_count
                FROM Orders o
                LEFT JOIN Receipt r ON o.order_id = r.order_id
                WHERE o.order_date BETWEEN ? AND ?
                GROUP BY o.order_date
                ORDER BY o.order_date
            """, (start_date, end_date))
            
            trends = []
            for row in cursor.fetchall():
                trends.append({
                    'date': row[0],
                    'total_sales': row[1],
                    'order_count': row[2]
                })
            
            total_sales = sum(t['total_sales'] for t in trends)
            avg_daily_sales = total_sales / days if days > 0 else 0
            
            return {
                'trends': trends,
                'total_sales': total_sales,
                'average_daily_sales': avg_daily_sales,
                'period_start': start_date,
                'period_end': end_date
            }
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/top-products", response_model=TopProductsResponse)
async def get_top_products(
    limit: int = Query(10, description="Number of top products to return"),
    db: DatabaseConnection = Depends(get_db)
):
    """Get top-selling products."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute(f"""
                SELECT TOP (?) i.item_id, i.item_name, i.category,
                       SUM(od.quantity) as total_sold,
                       SUM(od.quantity * i.price) as total_revenue
                FROM Item i
                JOIN Order_Details od ON i.item_id = od.item_id
                GROUP BY i.item_id, i.item_name, i.category
                ORDER BY total_sold DESC
            """, (limit,))
            
            products = []
            for row in cursor.fetchall():
                products.append({
                    'item_id': row[0],
                    'item_name': row[1],
                    'category': row[2],
                    'total_sold': row[3],
                    'total_revenue': row[4]
                })
            
            return {'products': products, 'limit': limit}
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/customer-segmentation", response_model=CustomerSegmentationResponse)
async def get_customer_segmentation(db: DatabaseConnection = Depends(get_db)):
    """
    Customer segmentation using SQL Function (fn_GetCustomerTier).
    Demonstrates Business Intelligence handled at the DB level.
    """
    try:
        with db.get_cursor() as cursor:
            cursor.execute("""
                SELECT c.customer_id, c.name,
                       DATEDIFF(day, MAX(o.order_date), GETDATE()) as recency_days,
                       COUNT(DISTINCT o.order_id) as frequency,
                       ISNULL(SUM(r.total_amount), 0) as monetary_value,
                       dbo.fn_GetCustomerTier(c.customer_id) as segment
                FROM Customer c
                LEFT JOIN Orders o ON c.customer_id = o.customer_id
                LEFT JOIN Receipt r ON o.order_id = r.order_id
                GROUP BY c.customer_id, c.name
                HAVING COUNT(DISTINCT o.order_id) > 0
            """)
            
            segments = []
            segment_distribution = {'Platinum': 0, 'Gold': 0, 'Silver': 0, 'Bronze': 0}
            
            for row in cursor.fetchall():
                segment = row[5]
                segment_distribution[segment] = segment_distribution.get(segment, 0) + 1
                
                segments.append({
                    'customer_id': row[0],
                    'customer_name': row[1],
                    'recency_days': row[2],
                    'frequency': row[3],
                    'monetary_value': row[4],
                    'rfm_score': 0, # Not used in SQL version
                    'segment': segment
                })
            
            return {
                'segments': segments,
                'segment_distribution': {
                    'VIP': segment_distribution.get('Platinum', 0),
                    'Regular': segment_distribution.get('Gold', 0),
                    'At-Risk': segment_distribution.get('Silver', 0),
                    'Lost': segment_distribution.get('Bronze', 0)
                }
            }
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/market-basket", response_model=MarketBasketResponse)
async def get_market_basket_analysis(
    min_support: int = Query(2, description="Minimum number of times items appear together"),
    db: DatabaseConnection = Depends(get_db)
):
    """
    Market basket analysis - find frequently bought together items.
    """
    try:
        with db.get_cursor() as cursor:
            cursor.execute("""
                SELECT od1.item_id as item1_id, i1.item_name as item1_name,
                       od2.item_id as item2_id, i2.item_name as item2_name,
                       COUNT(*) as frequency
                FROM Order_Details od1
                JOIN Order_Details od2 ON od1.order_id = od2.order_id AND od1.item_id < od2.item_id
                JOIN Item i1 ON od1.item_id = i1.item_id
                JOIN Item i2 ON od2.item_id = i2.item_id
                GROUP BY od1.item_id, i1.item_name, od2.item_id, i2.item_name
                HAVING COUNT(*) >= ?
                ORDER BY frequency DESC
            """, (min_support,))
            
            associations = []
            for row in cursor.fetchall():
                frequency = row[4]
                confidence = min(1.0, frequency / 10.0)
                lift = confidence * 1.2
                
                associations.append({
                    'item1_id': row[0],
                    'item1_name': row[1],
                    'item2_id': row[2],
                    'item2_name': row[3],
                    'frequency': frequency,
                    'confidence': round(confidence, 2),
                    'lift': round(lift, 2)
                })
            
            return {
                'associations': associations,
                'min_support': min_support
            }
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/inventory-insights", response_model=InventoryInsightsResponse)
async def get_inventory_insights(db: DatabaseConnection = Depends(get_db)):
    """
    Inventory optimization using SQL View (vw_InventoryHealth).
    Demonstrates Advanced Database Logic for BI.
    """
    try:
        with db.get_cursor() as cursor:
            cursor.execute("SELECT Item_id, Item_Name, Category, Stock_Qty, Health_Status FROM vw_InventoryHealth")
            rows = cursor.fetchall()
            
            insights = []
            total_value = Decimal('0')
            
            for row in rows:
                item_id, item_name, category, stock_qty, health_status = row
                
                cursor.execute("SELECT Price FROM Item WHERE Item_id = ?", (item_id,))
                price = cursor.fetchone()[0]
                
                inventory_value = Decimal(str(stock_qty)) * Decimal(str(price))
                total_value += inventory_value
                
                suggested_order_qty = 50 if health_status == 'CRITICAL' else 20 if health_status == 'LOW' else 0
                
                insights.append({
                    'item_id': item_id,
                    'item_name': item_name,
                    'category': category,
                    'current_stock': stock_qty,
                    'abc_class': 'A' if inventory_value > 5000 else 'B' if inventory_value > 2000 else 'C',
                    'reorder_point': 10,
                    'suggested_order_qty': suggested_order_qty,
                    'stockout_risk': 'High' if health_status == 'CRITICAL' else 'Medium' if health_status == 'LOW' else 'Low'
                })
            
            return {
                'insights': insights,
                'total_inventory_value': total_value
            }
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/supplier-performance", response_model=SupplierPerformanceResponse)
async def get_supplier_performance(db: DatabaseConnection = Depends(get_db)):
    """
    Supplier performance analysis using Stored Procedure (sp_GetSupplierReport).
    """
    try:
        with db.get_cursor() as cursor:
            cursor.execute("EXEC sp_GetSupplierReport")
            
            suppliers = []
            rank = 1
            
            for row in cursor.fetchall():
                name, frequency, quantity, value = row
                
                on_time_rate = 0.95
                performance_score = (frequency * 0.4 + float(quantity) * 0.0001 + on_time_rate * 100 * 0.6)
                
                suppliers.append({
                    'supplier_id': 'SUPP' + str(rank), # Generic ID for UI
                    'supplier_name': name,
                    'total_supplies': frequency,
                    'total_quantity': int(quantity),
                    'on_time_rate': on_time_rate,
                    'performance_score': round(performance_score, 2),
                    'rank': rank
                })
                rank += 1
            
            return {'suppliers': suppliers}
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")
