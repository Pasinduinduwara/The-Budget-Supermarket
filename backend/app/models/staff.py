"""
Pydantic models for Manager, Cashier, Store Admin, and Supplier entities.
"""

from pydantic import BaseModel, Field, field_validator
from typing import Optional
import re


# ============================================
# Manager Models
# ============================================

class ManagerBase(BaseModel):
    """Base manager model."""
    name: str = Field(..., min_length=1, max_length=150)
    contact_info: str = Field(..., min_length=10, max_length=10)
    
    @field_validator('contact_info')
    @classmethod
    def validate_contact(cls, v):
        if not re.match(r'^\d{10}$', v):
            raise ValueError('Contact info must be exactly 10 digits')
        return v


class ManagerCreate(ManagerBase):
    manager_id: str = Field(..., max_length=10)


class ManagerResponse(ManagerBase):
    manager_id: str
    
    class Config:
        from_attributes = True


# ============================================
# Cashier Models
# ============================================

class CashierBase(BaseModel):
    """Base cashier model."""
    name: str = Field(..., min_length=1, max_length=150)


class CashierCreate(CashierBase):
    cashier_id: str = Field(..., max_length=10)


class CashierResponse(CashierBase):
    cashier_id: str
    
    class Config:
        from_attributes = True


# ============================================
# Store Admin Models
# ============================================

class StoreAdminBase(BaseModel):
    """Base store admin model."""
    name: str = Field(..., min_length=1, max_length=150)
    contact_info: str = Field(..., min_length=10, max_length=10)
    
    @field_validator('contact_info')
    @classmethod
    def validate_contact(cls, v):
        if not re.match(r'^\d{10}$', v):
            raise ValueError('Contact info must be exactly 10 digits')
        return v


class StoreAdminCreate(StoreAdminBase):
    storeadmin_id: str = Field(..., max_length=10)


class StoreAdminResponse(StoreAdminBase):
    storeadmin_id: str
    
    class Config:
        from_attributes = True


# ============================================
# Supplier Models
# ============================================

class SupplierBase(BaseModel):
    """Base supplier model."""
    name: str = Field(..., min_length=1, max_length=150)
    contact_info: str = Field(..., min_length=10, max_length=10)
    storeadmin_id: str = Field(..., max_length=10)
    
    @field_validator('contact_info')
    @classmethod
    def validate_contact(cls, v):
        if not re.match(r'^\d{10}$', v):
            raise ValueError('Contact info must be exactly 10 digits')
        return v


class SupplierCreate(SupplierBase):
    supplier_id: str = Field(..., max_length=10)


class SupplierUpdate(BaseModel):
    """Model for updating supplier."""
    name: Optional[str] = Field(None, min_length=1, max_length=150)
    contact_info: Optional[str] = Field(None, min_length=10, max_length=10)
    storeadmin_id: Optional[str] = Field(None, max_length=10)


class SupplierResponse(SupplierBase):
    supplier_id: str
    
    class Config:
        from_attributes = True
