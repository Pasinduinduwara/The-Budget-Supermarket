"""
Orders API Router.
"""

from fastapi import APIRouter, HTTPException, Depends
from typing import List
from app.models.order import OrderCreate, OrderResponse, OrderWithDetails, ReceiptCreate, ReceiptResponse
from app.database import DatabaseConnection, get_db
import pyodbc
import logging
from datetime import date
from decimal import Decimal

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/orders", tags=["Orders"])


@router.get("/", response_model=List[OrderResponse])
async def get_orders(db: DatabaseConnection = Depends(get_db)):
    """Get all orders."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute("""
                SELECT o.order_id, o.order_date, o.customer_id, c.name as customer_name,
                       o.cashier_id, ca.name as cashier_name
                FROM Orders o
                LEFT JOIN Customer c ON o.customer_id = c.customer_id
                JOIN Cashier ca ON o.cashier_id = ca.cashier_id
                ORDER BY o.order_date DESC
            """)
            columns = [col[0].lower() for col in cursor.description]
            orders = [dict(zip(columns, row)) for row in cursor.fetchall()]
            return orders
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/{order_id}", response_model=OrderWithDetails)
async def get_order(order_id: str, db: DatabaseConnection = Depends(get_db)):
    """Get order details with items."""
    try:
        with db.get_cursor() as cursor:
            # Get order info
            cursor.execute("""
                SELECT o.order_id, o.order_date, o.customer_id, c.name as customer_name,
                       o.cashier_id, ca.name as cashier_name
                FROM Orders o
                LEFT JOIN Customer c ON o.customer_id = c.customer_id
                JOIN Cashier ca ON o.cashier_id = ca.cashier_id
                WHERE o.order_id = ?
            """, (order_id,))
            row = cursor.fetchone()
            if not row:
                raise HTTPException(status_code=404, detail=f"Order {order_id} not found")
            
            columns = [col[0].lower() for col in cursor.description]
            order = dict(zip(columns, row))
            
            # Get order items
            cursor.execute("""
                SELECT od.item_id, i.item_name, i.price, od.quantity,
                       (i.price * od.quantity) as subtotal
                FROM Order_Details od
                JOIN Item i ON od.item_id = i.item_id
                WHERE od.order_id = ?
            """, (order_id,))
            columns = [col[0].lower() for col in cursor.description]
            items = [dict(zip(columns, row)) for row in cursor.fetchall()]
            
            order['items'] = items
            order['total_amount'] = sum(item['subtotal'] for item in items)
            
            return order
    except HTTPException:
        raise
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.post("/", response_model=OrderResponse, status_code=201)
async def create_order(order: OrderCreate, db: DatabaseConnection = Depends(get_db)):
    """Create a new order."""
    try:
        with db.get_cursor() as cursor:
            # Generate order ID
            cursor.execute("SELECT ISNULL(MAX(CAST(SUBSTRING(order_id, 3, 10) AS INT)), 0) + 1 FROM Orders WHERE order_id LIKE 'OR%'")
            next_num = cursor.fetchone()[0]
            order_id = f"OR{next_num}"
            
            # Verify cashier exists
            cursor.execute("SELECT name FROM Cashier WHERE cashier_id = ?", (order.cashier_id,))
            cashier = cursor.fetchone()
            if not cashier:
                raise HTTPException(status_code=400, detail=f"Cashier {order.cashier_id} not found")
            
            # Verify customer if provided
            customer_name = None
            if order.customer_id:
                cursor.execute("SELECT name FROM Customer WHERE customer_id = ?", (order.customer_id,))
                customer = cursor.fetchone()
                if not customer:
                    raise HTTPException(status_code=400, detail=f"Customer {order.customer_id} not found")
                customer_name = customer[0]
            
            # Insert order using Stored Procedure (Section 3 Requirement)
            cursor.execute("EXEC sp_PlaceOrder ?, ?, ?", (order_id, order.customer_id, order.cashier_id))
            
            # Insert order details
            for item in order.items:
                # Verify item exists and has sufficient stock
                cursor.execute("SELECT stock_qty FROM Item WHERE item_id = ?", (item.item_id,))
                stock = cursor.fetchone()
                if not stock:
                    raise HTTPException(status_code=400, detail=f"Item {item.item_id} not found")
                if stock[0] < item.quantity:
                    raise HTTPException(status_code=400, detail=f"Insufficient stock for item {item.item_id}")
                
                cursor.execute("""
                    INSERT INTO Order_Details (order_id, item_id, quantity)
                    VALUES (?, ?, ?)
                """, (order_id, item.item_id, item.quantity))
                
                # Update stock
                cursor.execute("""
                    UPDATE Item SET stock_qty = stock_qty - ?
                    WHERE item_id = ?
                """, (item.quantity, item.item_id))
            
            return {
                'order_id': order_id,
                'order_date': date.today(),
                'customer_id': order.customer_id,
                'customer_name': customer_name,
                'cashier_id': order.cashier_id,
                'cashier_name': cashier[0]
            }
    except HTTPException:
        raise
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.post("/{order_id}/complete", response_model=ReceiptResponse)
async def complete_order(order_id: str, receipt: ReceiptCreate, db: DatabaseConnection = Depends(get_db)):
    """Complete order and generate receipt."""
    try:
        with db.get_cursor() as cursor:
            # Verify order exists
            cursor.execute("SELECT cashier_id FROM Orders WHERE order_id = ?", (order_id,))
            order_row = cursor.fetchone()
            if not order_row:
                raise HTTPException(status_code=404, detail=f"Order {order_id} not found")
            
            cashier_id = order_row[0]
            
            # Calculate total
            cursor.execute("""
                SELECT SUM(i.price * od.quantity) as total
                FROM Order_Details od
                JOIN Item i ON od.item_id = i.item_id
                WHERE od.order_id = ?
            """, (order_id,))
            total = cursor.fetchone()[0] or Decimal('0')
            
            # Generate receipt ID
            cursor.execute("SELECT ISNULL(MAX(receipt_id), 0) + 1 FROM Receipt")
            receipt_id = cursor.fetchone()[0]
            
            # Insert receipt
            cursor.execute("""
                INSERT INTO Receipt (receipt_id, payment_method, total_amount, order_id, cashier_id)
                VALUES (?, ?, ?, ?, ?)
            """, (receipt_id, receipt.payment_method, float(total), order_id, cashier_id))
            
            return {
                'receipt_id': receipt_id,
                'payment_method': receipt.payment_method,
                'total_amount': total,
                'order_id': order_id,
                'cashier_id': cashier_id
            }
    except HTTPException:
        raise
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")
