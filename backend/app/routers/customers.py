"""
Customers API Router.
"""

from fastapi import APIRouter, HTTPException, Depends
from typing import List
from app.models.customer import CustomerCreate, CustomerUpdate, CustomerResponse
from app.database import DatabaseConnection, get_db
import pyodbc
import logging

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/customers", tags=["Customers"])


@router.get("/", response_model=List[CustomerResponse])
async def get_customers(db: DatabaseConnection = Depends(get_db)):
    """Get all customers."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute("SELECT customer_id, name, contact_info FROM Customer ORDER BY name")
            columns = [col[0].lower() for col in cursor.description]
            customers = [dict(zip(columns, row)) for row in cursor.fetchall()]
            return customers
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/{customer_id}", response_model=CustomerResponse)
async def get_customer(customer_id: str, db: DatabaseConnection = Depends(get_db)):
    """Get a specific customer by ID."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute(
                "SELECT customer_id, name, contact_info FROM Customer WHERE customer_id = ?",
                (customer_id,)
            )
            row = cursor.fetchone()
            if not row:
                raise HTTPException(status_code=404, detail=f"Customer {customer_id} not found")
            columns = [col[0].lower() for col in cursor.description]
            return dict(zip(columns, row))
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.post("/", response_model=CustomerResponse, status_code=201)
async def create_customer(customer: CustomerCreate, db: DatabaseConnection = Depends(get_db)):
    """Create a new customer."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute("SELECT 1 FROM Customer WHERE customer_id = ?", (customer.customer_id,))
            if cursor.fetchone():
                raise HTTPException(status_code=400, detail=f"Customer {customer.customer_id} already exists")
            
            cursor.execute("""
                INSERT INTO Customer (customer_id, name, contact_info)
                VALUES (?, ?, ?)
            """, (customer.customer_id, customer.name, customer.contact_info))
            
            return customer.model_dump()
    except HTTPException:
        raise
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.put("/{customer_id}", response_model=CustomerResponse)
async def update_customer(customer_id: str, customer: CustomerUpdate, db: DatabaseConnection = Depends(get_db)):
    """Update an existing customer."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute("SELECT 1 FROM Customer WHERE customer_id = ?", (customer_id,))
            if not cursor.fetchone():
                raise HTTPException(status_code=404, detail=f"Customer {customer_id} not found")
            
            update_fields = []
            params = []
            
            if customer.name is not None:
                update_fields.append("name = ?")
                params.append(customer.name)
            if customer.contact_info is not None:
                update_fields.append("contact_info = ?")
                params.append(customer.contact_info)
            
            if not update_fields:
                raise HTTPException(status_code=400, detail="No fields to update")
            
            params.append(customer_id)
            query = f"UPDATE Customer SET {', '.join(update_fields)} WHERE customer_id = ?"
            cursor.execute(query, params)
            
            cursor.execute(
                "SELECT customer_id, name, contact_info FROM Customer WHERE customer_id = ?",
                (customer_id,)
            )
            row = cursor.fetchone()
            columns = [col[0].lower() for col in cursor.description]
            return dict(zip(columns, row))
    except HTTPException:
        raise
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.delete("/{customer_id}", status_code=204)
async def delete_customer(customer_id: str, db: DatabaseConnection = Depends(get_db)):
    """Delete a customer."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute("SELECT 1 FROM Customer WHERE customer_id = ?", (customer_id,))
            if not cursor.fetchone():
                raise HTTPException(status_code=404, detail=f"Customer {customer_id} not found")
            
            cursor.execute("DELETE FROM Customer WHERE customer_id = ?", (customer_id,))
            return None
    except HTTPException:
        raise
    except pyodbc.Error as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")
