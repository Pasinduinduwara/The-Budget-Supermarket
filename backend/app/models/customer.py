"""
Pydantic models for Customer entity.
"""

from pydantic import BaseModel, Field, field_validator
from typing import Optional
import re


class CustomerBase(BaseModel):
    """Base customer model."""
    name: str = Field(..., min_length=1, max_length=150, description="Customer name")
    contact_info: str = Field(..., min_length=10, max_length=10, description="Phone number (10 digits)")
    
    @field_validator('contact_info')
    @classmethod
    def validate_contact(cls, v):
        """Validate contact info is exactly 10 digits."""
        if not re.match(r'^\d{10}$', v):
            raise ValueError('Contact info must be exactly 10 digits')
        return v


class CustomerCreate(CustomerBase):
    """Model for creating a new customer."""
    customer_id: str = Field(..., max_length=10, description="Unique customer identifier")


class CustomerUpdate(BaseModel):
    """Model for updating customer."""
    name: Optional[str] = Field(None, min_length=1, max_length=150)
    contact_info: Optional[str] = Field(None, min_length=10, max_length=10)


class CustomerResponse(CustomerBase):
    """Model for customer response."""
    customer_id: str
    
    class Config:
        from_attributes = True
