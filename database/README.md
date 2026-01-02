# The Budget Supermarket - Oracle Database Implementation

## Overview
This directory contains the complete Oracle database implementation for The Budget Supermarket system, including all SQL scripts for database creation, table definitions, and sample data population.

## Database Structure

### Tables (11 Total)
1. **Manager** - Manages items and supply orders
2. **Store_Admin** - Manages suppliers
3. **Customer** - Registered customers
4. **Cashier** - Processes orders and receipts
5. **Supplier** - External vendors (managed by Store_Admin)
6. **Item** - Products in inventory (managed by Manager)
7. **Supply_Order** - Supply orders (checked by Manager)
8. **Supply** - Junction table linking Supplier, Item, and Supply_Order
9. **Orders** - Customer purchase transactions
10. **Order_Details** - Line items for orders (many-to-many between Orders and Items)
11. **Receipt** - Payment records for completed orders

## SQL Scripts

### 01_create_database.sql
- Creates tablespace for the application
- Creates user/schema: `budget_supermarket`
- Grants necessary privileges
- **Password:** `BudgetSuper2026`

### 02_create_tables.sql
- Creates all 11 tables in dependency order
- Implements primary keys, foreign keys, and check constraints
- Creates indexes for performance optimization
- Adds table and column comments for documentation

### 03_insert_sample_data.sql
- Inserts meaningful sample data into all tables
- **Total Records:** 298
  - 15 Managers
  - 12 Store Admins
  - 25 Customers
  - 12 Cashiers
  - 18 Suppliers
  - 35 Items (across 7 categories)
  - 18 Supply Orders
  - 40 Supply records
  - 30 Orders
  - 65 Order Details
  - 30 Receipts

### 04_verification_queries.sql

## Execution Instructions

### Prerequisites
- Oracle Database 11g or higher installed
- SQL*Plus or Oracle SQL Developer
- System privileges to create users and tablespaces

### Step 1: Connect as System Administrator
```sql
sqlplus sys as sysdba
-- Enter your system password
```

### Step 2: Execute Database Creation Script
```sql
@01_create_database.sql
```

### Step 3: Connect as Budget Supermarket User
```sql
CONNECT budget_supermarket/BudgetSuper2026
```

### Step 4: Create Tables
```sql
@02_create_tables.sql
```

### Step 5: Insert Sample Data
```sql
@03_insert_sample_data.sql
```

### Step 6: Verify Installation
```sql
-- Check all tables
SELECT table_name FROM user_tables ORDER BY table_name;

-- Check record counts
SELECT 'Manager' AS Table_Name, COUNT(*) AS Record_Count FROM Manager
UNION ALL
SELECT 'Store_Admin', COUNT(*) FROM Store_Admin
UNION ALL
SELECT 'Customer', COUNT(*) FROM Customer
UNION ALL
SELECT 'Cashier', COUNT(*) FROM Cashier
UNION ALL
SELECT 'Supplier', COUNT(*) FROM Supplier
UNION ALL
SELECT 'Item', COUNT(*) FROM Item
UNION ALL
SELECT 'Supply_Order', COUNT(*) FROM Supply_Order
UNION ALL
SELECT 'Supply', COUNT(*) FROM Supply
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*) FROM Order_Details
UNION ALL
SELECT 'Receipt', COUNT(*) FROM Receipt;
```

## Database Features

### Constraints Implemented
- **Primary Keys:** All tables have primary keys
- **Foreign Keys:** Proper referential integrity with CASCADE and SET NULL actions
- **Check Constraints:**
  - Contact info must be exactly 10 digits
  - Prices and quantities must be non-negative
  - Dates cannot be in the future
  - Payment methods restricted to: Cash, Card, Digital Wallet

### Indexes Created
- Primary key indexes (automatic)
- Foreign key indexes for performance
- Category index on Item table
- Date indexes for temporal queries
- Composite index on Supply table

### Business Rules Enforced
1. Real-time inventory updates (via triggers - to be implemented)
2. Low stock threshold: < 10 units
3. Walk-in customers allowed (NULL Customer_id in Orders)
4. One receipt per order
5. Multiple items per order supported
6. Supplier-Store Admin relationship maintained
7. Manager oversight of items and supply orders

## Data Categories

### Item Categories
- **Beverages:** Soft drinks, juices, water
- **Snacks:** Chips, chocolates, biscuits
- **Dairy:** Milk, yogurt, cheese, butter
- **Produce:** Vegetables (tomatoes, potatoes, onions, etc.)
- **Bakery:** Bread, cakes, pastries, cookies
- **Household:** Cleaning products, toilet paper, soaps
- **Personal Care:** Shampoo, toothpaste, lotions, deodorants

## Next Steps

### Section 3: Advanced Database Objects (To Be Implemented)
1. **Triggers:**
   - Inventory update trigger on order completion
   - Low stock alert trigger
   - Supply order auto-update trigger

2. **User-Defined Functions:**
   - Calculate order total function
   - Check stock availability function
   - Customer purchase history function

3. **Views:**
   - Low stock items view
   - Customer order history view
   - Supplier performance view
   - Sales summary view

4. **Stored Procedures:**
   - Process order procedure
   - Restock items procedure
   - Generate sales report procedure
   - Customer loyalty calculation procedure

### Section 4: Business Intelligence/Data Mining
Potential implementations:
- Sales trend analysis
- Customer segmentation (RFM analysis)
- Market basket analysis
- Inventory optimization
- Supplier performance analytics

## Connection Details

- **User:** budget_supermarket
- **Password:** BudgetSuper2026
- **Tablespace:** budget_supermarket_data
- **Schema:** budget_supermarket

## Troubleshooting

### Common Issues

**Issue:** Insufficient privileges
```sql
-- Connect as SYS and grant additional privileges
GRANT ALL PRIVILEGES TO budget_supermarket;
```

**Issue:** Tablespace already exists
```sql
-- Drop existing tablespace if needed
DROP TABLESPACE budget_supermarket_data INCLUDING CONTENTS AND DATAFILES;
```

**Issue:** User already exists
```sql
-- Drop existing user if needed
DROP USER budget_supermarket CASCADE;
```

**Issue:** Foreign key constraint violation
- Ensure you run scripts in order (01 → 02 → 03)
- Sample data script inserts in dependency order

## Database Backup

To create a backup for submission:
```bash
# Using Data Pump Export
expdp budget_supermarket/BudgetSuper2026 DIRECTORY=dump_dir DUMPFILE=budget_supermarket.dmp LOGFILE=export.log

# Or using traditional export
exp budget_supermarket/BudgetSuper2026 FILE=budget_supermarket.dmp LOG=export.log
```

## Documentation

For complete documentation including:
- ER/EER diagrams
- Relational mapping
- Data normalization steps
- Data dictionary

Refer to the main coursework documentation.

---

**Created:** 2026-01-01  
**Database Version:** Oracle 11g+  
**Assignment:** Advanced Database Management System - Final Coursework
