"""
Pydantic models for Analytics and Business Intelligence responses.
"""

from pydantic import BaseModel, Field
from typing import List, Dict, Any
from datetime import date
from decimal import Decimal


class DashboardStats(BaseModel):
    """Model for dashboard statistics."""
    total_items: int
    total_customers: int
    total_orders: int
    total_sales: Decimal
    low_stock_count: int
    total_suppliers: int


class SalesTrendData(BaseModel):
    """Model for sales trend data point."""
    date: date
    total_sales: Decimal
    order_count: int


class SalesTrendResponse(BaseModel):
    """Model for sales trend analysis response."""
    trends: List[SalesTrendData]
    total_sales: Decimal
    average_daily_sales: Decimal
    period_start: date
    period_end: date


class TopProduct(BaseModel):
    """Model for top-selling product."""
    item_id: str
    item_name: str
    category: str
    total_sold: int
    total_revenue: Decimal


class TopProductsResponse(BaseModel):
    """Model for top products response."""
    products: List[TopProduct]
    limit: int


class CustomerSegment(BaseModel):
    """Model for customer segmentation (RFM)."""
    customer_id: str
    customer_name: str
    recency_days: int
    frequency: int
    monetary_value: Decimal
    rfm_score: int
    segment: str  # VIP, Regular, At-Risk, Lost


class CustomerSegmentationResponse(BaseModel):
    """Model for customer segmentation response."""
    segments: List[CustomerSegment]
    segment_distribution: Dict[str, int]


class MarketBasketItem(BaseModel):
    """Model for market basket analysis item pair."""
    item1_id: str
    item1_name: str
    item2_id: str
    item2_name: str
    frequency: int
    confidence: float
    lift: float


class MarketBasketResponse(BaseModel):
    """Model for market basket analysis response."""
    associations: List[MarketBasketItem]
    min_support: int


class InventoryInsight(BaseModel):
    """Model for inventory optimization insight."""
    item_id: str
    item_name: str
    category: str
    current_stock: int
    abc_class: str  # A, B, or C
    reorder_point: int
    suggested_order_qty: int
    stockout_risk: str  # Low, Medium, High


class InventoryInsightsResponse(BaseModel):
    """Model for inventory insights response."""
    insights: List[InventoryInsight]
    total_inventory_value: Decimal


class SupplierPerformance(BaseModel):
    """Model for supplier performance metrics."""
    supplier_id: str
    supplier_name: str
    total_supplies: int
    total_quantity: int
    on_time_rate: float
    performance_score: float
    rank: int


class SupplierPerformanceResponse(BaseModel):
    """Model for supplier performance response."""
    suppliers: List[SupplierPerformance]
