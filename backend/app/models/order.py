"""
Pydantic models for Order and Order Details entities.
"""

from pydantic import BaseModel, Field
from typing import Optional, List
from datetime import date
from decimal import Decimal


class OrderDetailCreate(BaseModel):
    """Model for order detail item."""
    item_id: str = Field(..., max_length=10, description="Item ID")
    quantity: int = Field(..., gt=0, description="Quantity ordered")


class OrderDetailResponse(OrderDetailCreate):
    """Model for order detail response."""
    item_name: Optional[str] = None
    price: Optional[Decimal] = None
    subtotal: Optional[Decimal] = None


class OrderCreate(BaseModel):
    """Model for creating a new order."""
    customer_id: Optional[str] = Field(None, max_length=10, description="Customer ID (null for walk-in)")
    cashier_id: str = Field(..., max_length=10, description="Cashier ID")
    items: List[OrderDetailCreate] = Field(..., min_length=1, description="List of items in order")


class OrderResponse(BaseModel):
    """Model for order response."""
    order_id: str
    order_date: date
    customer_id: Optional[str]
    customer_name: Optional[str]
    cashier_id: str
    cashier_name: Optional[str]
    total_amount: Optional[Decimal] = None
    
    class Config:
        from_attributes = True


class OrderWithDetails(OrderResponse):
    """Model for order with detail items."""
    items: List[OrderDetailResponse] = []


class ReceiptCreate(BaseModel):
    """Model for creating a receipt."""
    payment_method: str = Field(..., description="Payment method: Cash, Card, or Digital Wallet")
    
    @property
    def is_valid_payment_method(self) -> bool:
        """Check if payment method is valid."""
        return self.payment_method in ['Cash', 'Card', 'Digital Wallet']


class ReceiptResponse(BaseModel):
    """Model for receipt response."""
    receipt_id: int
    payment_method: str
    total_amount: Decimal
    order_id: str
    cashier_id: str
    
    class Config:
        from_attributes = True
