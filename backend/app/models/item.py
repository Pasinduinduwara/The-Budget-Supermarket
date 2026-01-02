"""
Pydantic models for Item entity.
Handles request/response validation for item-related operations.
"""

from pydantic import BaseModel, Field, field_validator
from typing import Optional
from decimal import Decimal


class ItemBase(BaseModel):
    """Base item model with common fields."""
    item_name: str = Field(..., min_length=1, max_length=40, description="Name of the item")
    price: Decimal = Field(..., ge=0, description="Unit price of the item")
    stock_qty: int = Field(default=0, ge=0, description="Current stock quantity")
    category: Optional[str] = Field(None, max_length=200, description="Item category")
    manager_id: str = Field(..., max_length=10, description="Manager ID who manages this item")
    
    @field_validator('price')
    @classmethod
    def validate_price(cls, v):
        """Ensure price has at most 2 decimal places."""
        if v.as_tuple().exponent < -2:
            raise ValueError('Price must have at most 2 decimal places')
        return v


class ItemCreate(ItemBase):
    """Model for creating a new item."""
    item_id: str = Field(..., max_length=10, description="Unique item identifier")


class ItemUpdate(BaseModel):
    """Model for updating an existing item (all fields optional)."""
    item_name: Optional[str] = Field(None, min_length=1, max_length=40)
    price: Optional[Decimal] = Field(None, ge=0)
    stock_qty: Optional[int] = Field(None, ge=0)
    category: Optional[str] = Field(None, max_length=200)
    manager_id: Optional[str] = Field(None, max_length=10)


class ItemResponse(ItemBase):
    """Model for item response."""
    item_id: str
    
    class Config:
        from_attributes = True


class ItemWithStock(ItemResponse):
    """Item model with stock status indicator."""
    is_low_stock: bool = Field(description="True if stock quantity is below 10")
    
    @classmethod
    def from_item(cls, item: dict):
        """Create ItemWithStock from item dictionary."""
        return cls(
            **item,
            is_low_stock=item['stock_qty'] < 10
        )
