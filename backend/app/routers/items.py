"""
Items API Router.
Handles all item-related endpoints.
"""

from fastapi import APIRouter, HTTPException, Depends, Query
from typing import List, Optional
from app.models.item import ItemCreate, ItemUpdate, ItemResponse, ItemWithStock
from app.database import DatabaseConnection, get_db
import pyodbc
import logging

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/items", tags=["Items"])


@router.get("/", response_model=List[ItemResponse])
async def get_items(
    category: Optional[str] = Query(None, description="Filter by category"),
    low_stock_only: bool = Query(False, description="Show only low stock items"),
    db: DatabaseConnection = Depends(get_db)
):
    """
    Get all items with optional filtering.
    
    - **category**: Filter items by category
    - **low_stock_only**: If true, only return items with stock < 10
    """
    try:
        with db.get_cursor() as cursor:
            query = "SELECT item_id, item_name, price, stock_qty, category, manager_id FROM Item WHERE 1=1"
            params = []
            
            if category:
                query += " AND category = ?"
                params.append(category)
            
            if low_stock_only:
                query += " AND stock_qty < 10"
            
            query += " ORDER BY item_name"
            
            cursor.execute(query, params)
            columns = [col[0].lower() for col in cursor.description]
            items = [dict(zip(columns, row)) for row in cursor.fetchall()]
            
            return items
    except pyodbc.Error as e:
        logger.error(f"Database error in get_items: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/categories", response_model=List[str])
async def get_categories(db: DatabaseConnection = Depends(get_db)):
    """Get all unique item categories."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute("SELECT DISTINCT category FROM Item WHERE category IS NOT NULL ORDER BY category")
            categories = [row[0] for row in cursor.fetchall()]
            return categories
    except pyodbc.Error as e:
        logger.error(f"Database error in get_categories: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/low-stock", response_model=List[ItemWithStock])
async def get_low_stock_items(db: DatabaseConnection = Depends(get_db)):
    """Get all items with stock quantity below 10."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute("""
                SELECT item_id, item_name, price, stock_qty, category, manager_id 
                FROM Item 
                WHERE stock_qty < 10 
                ORDER BY stock_qty ASC
            """)
            columns = [col[0].lower() for col in cursor.description]
            items = [dict(zip(columns, row)) for row in cursor.fetchall()]
            
            return [ItemWithStock.from_item(item) for item in items]
    except pyodbc.Error as e:
        logger.error(f"Database error in get_low_stock_items: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.get("/{item_id}", response_model=ItemResponse)
async def get_item(item_id: str, db: DatabaseConnection = Depends(get_db)):
    """Get a specific item by ID."""
    try:
        with db.get_cursor() as cursor:
            cursor.execute(
                "SELECT item_id, item_name, price, stock_qty, category, manager_id FROM Item WHERE item_id = ?",
                (item_id,)
            )
            row = cursor.fetchone()
            
            if not row:
                raise HTTPException(status_code=404, detail=f"Item {item_id} not found")
            
            columns = [col[0].lower() for col in cursor.description]
            item = dict(zip(columns, row))
            
            return item
    except pyodbc.Error as e:
        logger.error(f"Database error in get_item: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.post("/", response_model=ItemResponse, status_code=201)
async def create_item(item: ItemCreate, db: DatabaseConnection = Depends(get_db)):
    """Create a new item."""
    try:
        with db.get_cursor() as cursor:
            # Check if item_id already exists
            cursor.execute("SELECT 1 FROM Item WHERE item_id = ?", (item.item_id,))
            if cursor.fetchone():
                raise HTTPException(status_code=400, detail=f"Item {item.item_id} already exists")
            
            # Check if manager exists
            cursor.execute("SELECT 1 FROM Manager WHERE manager_id = ?", (item.manager_id,))
            if not cursor.fetchone():
                raise HTTPException(status_code=400, detail=f"Manager {item.manager_id} not found")
            
            # Insert item
            cursor.execute("""
                INSERT INTO Item (item_id, item_name, price, stock_qty, category, manager_id)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (
                item.item_id,
                item.item_name,
                float(item.price),
                item.stock_qty,
                item.category,
                item.manager_id
            ))
            
            return item.model_dump()
    except HTTPException:
        raise
    except pyodbc.Error as e:
        logger.error(f"Database error in create_item: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.put("/{item_id}", response_model=ItemResponse)
async def update_item(item_id: str, item: ItemUpdate, db: DatabaseConnection = Depends(get_db)):
    """Update an existing item."""
    try:
        with db.get_cursor() as cursor:
            # Check if item exists
            cursor.execute("SELECT 1 FROM Item WHERE item_id = ?", (item_id,))
            if not cursor.fetchone():
                raise HTTPException(status_code=404, detail=f"Item {item_id} not found")
            
            # Build update query dynamically based on provided fields
            update_fields = []
            params = []
            
            if item.item_name is not None:
                update_fields.append("item_name = ?")
                params.append(item.item_name)
            if item.price is not None:
                update_fields.append("price = ?")
                params.append(float(item.price))
            if item.stock_qty is not None:
                update_fields.append("stock_qty = ?")
                params.append(item.stock_qty)
            if item.category is not None:
                update_fields.append("category = ?")
                params.append(item.category)
            if item.manager_id is not None:
                update_fields.append("manager_id = ?")
                params.append(item.manager_id)
            
            if not update_fields:
                raise HTTPException(status_code=400, detail="No fields to update")
            
            params.append(item_id)
            query = f"UPDATE Item SET {', '.join(update_fields)} WHERE item_id = ?"
            cursor.execute(query, params)
            
            # Fetch updated item
            cursor.execute(
                "SELECT item_id, item_name, price, stock_qty, category, manager_id FROM Item WHERE item_id = ?",
                (item_id,)
            )
            row = cursor.fetchone()
            columns = [col[0].lower() for col in cursor.description]
            updated_item = dict(zip(columns, row))
            
            return updated_item
    except HTTPException:
        raise
    except pyodbc.Error as e:
        logger.error(f"Database error in update_item: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")


@router.delete("/{item_id}", status_code=204)
async def delete_item(item_id: str, db: DatabaseConnection = Depends(get_db)):
    """Delete an item."""
    try:
        with db.get_cursor() as cursor:
            # Check if item exists
            cursor.execute("SELECT 1 FROM Item WHERE item_id = ?", (item_id,))
            if not cursor.fetchone():
                raise HTTPException(status_code=404, detail=f"Item {item_id} not found")
            
            # Delete item
            cursor.execute("DELETE FROM Item WHERE item_id = ?", (item_id,))
            
            return None
    except HTTPException:
        raise
    except pyodbc.Error as e:
        logger.error(f"Database error in delete_item: {e}")
        raise HTTPException(status_code=500, detail="Database error occurred")
