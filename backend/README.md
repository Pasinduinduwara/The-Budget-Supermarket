# The Budget Supermarket - Backend API

## Overview
Python FastAPI backend for The Budget Supermarket management system with Oracle database integration.

## Features
- ✅ RESTful API with FastAPI
- ✅ Oracle database connection pooling
- ✅ Pydantic models for data validation
- ✅ CORS enabled for frontend integration
- ✅ Comprehensive API documentation (Swagger/ReDoc)
- ✅ Business Intelligence & Data Mining endpoints

## Tech Stack
- **Framework:** FastAPI 0.109.0
- **Database:** Oracle Database (cx_Oracle 8.3.0)
- **Validation:** Pydantic 2.5.3
- **Server:** Uvicorn

## Installation

### Prerequisites
- Python 3.10 or higher
- Oracle Database running with Budget Supermarket schema
- Oracle Instant Client (for cx_Oracle)

### Steps

1. **Create virtual environment:**
```bash
cd backend
python -m venv venv

# Windows
venv\Scripts\activate

# Linux/Mac
source venv/bin/activate
```

2. **Install dependencies:**
```bash
pip install -r requirements.txt
```

3. **Configure environment:**
```bash
# Copy .env.example to .env
copy .env.example .env

# Edit .env with your Oracle database credentials
```

4. **Run the server:**
```bash
# Development mode (with auto-reload)
uvicorn app.main:app --reload

# Production mode
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

## API Documentation

Once the server is running, access:
- **Swagger UI:** http://localhost:8000/docs
- **ReDoc:** http://localhost:8000/redoc

## API Endpoints

### Items (`/api/items`)
- `GET /` - List all items (with filtering)
- `GET /categories` - Get all categories
- `GET /low-stock` - Get low stock items
- `GET /{item_id}` - Get item details
- `POST /` - Create new item
- `PUT /{item_id}` - Update item
- `DELETE /{item_id}` - Delete item

### Customers (`/api/customers`)
- `GET /` - List all customers
- `GET /{customer_id}` - Get customer details
- `POST /` - Create new customer
- `PUT /{customer_id}` - Update customer
- `DELETE /{customer_id}` - Delete customer

### Orders (`/api/orders`)
- `GET /` - List all orders
- `GET /{order_id}` - Get order with details
- `POST /` - Create new order
- `POST /{order_id}/complete` - Complete order & generate receipt

### Analytics (`/api/analytics`)
- `GET /dashboard-stats` - Dashboard statistics
- `GET /sales-trends` - Sales trend analysis
- `GET /top-products` - Top-selling products
- `GET /customer-segmentation` - RFM customer segmentation
- `GET /market-basket` - Market basket analysis
- `GET /inventory-insights` - ABC inventory optimization
- `GET /supplier-performance` - Supplier performance metrics

## Business Intelligence Features

### 1. Sales Trend Analysis
Time-series analysis with daily/weekly/monthly aggregation and moving averages.

### 2. Customer Segmentation (RFM)
Segments customers into VIP, Regular, At-Risk, and Lost based on:
- **Recency:** Days since last purchase
- **Frequency:** Number of purchases
- **Monetary:** Total amount spent

### 3. Market Basket Analysis
Identifies frequently bought together items using association rule mining.

### 4. Inventory Optimization (ABC Analysis)
Classifies items into A, B, C categories and calculates optimal reorder points.

### 5. Supplier Performance
Multi-criteria scoring based on delivery rate, quantity, and reliability.

## Project Structure
```
backend/
├── app/
│   ├── __init__.py
│   ├── main.py              # FastAPI application
│   ├── config.py            # Configuration
│   ├── database.py          # Database connection
│   ├── models/              # Pydantic models
│   │   ├── item.py
│   │   ├── customer.py
│   │   ├── order.py
│   │   ├── staff.py
│   │   └── analytics.py
│   └── routers/             # API routes
│       ├── items.py
│       ├── customers.py
│       ├── orders.py
│       └── analytics.py
├── requirements.txt
├── .env
└── README.md
```

## Environment Variables

```env
DATABASE_HOST=localhost
DATABASE_PORT=1521
DATABASE_SERVICE=ORCL
DATABASE_USER=budget_supermarket
DATABASE_PASSWORD=BudgetSuper2026
JWT_SECRET_KEY=your-secret-key
CORS_ORIGINS=http://localhost:3000
```

## Development

### Code Style
- Follow PEP 8 guidelines
- Use type hints
- Add docstrings to all functions
- Use meaningful variable names

### Testing
```bash
# Run tests (when implemented)
pytest tests/ -v
```

## Troubleshooting

### Oracle Connection Issues
1. Ensure Oracle Instant Client is installed
2. Verify database credentials in `.env`
3. Check database is running and accessible

### CORS Issues
Add your frontend URL to `CORS_ORIGINS` in `.env`

### Port Already in Use
Change port: `uvicorn app.main:app --port 8001`

## License
Educational project for Advanced Database Management System coursework.
