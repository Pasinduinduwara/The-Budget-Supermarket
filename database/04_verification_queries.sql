-- ============================================
-- The Budget Supermarket - Oracle Database
-- Verification Queries
-- ============================================
-- Author: Database Team
-- Date: 2026-01-01
-- Description: Useful queries to verify database installation and explore data
-- ============================================

-- Connect as budget_supermarket user first
-- CONNECT budget_supermarket/BudgetSuper2026;

SET LINESIZE 200
SET PAGESIZE 100
COLUMN table_name FORMAT A20
COLUMN record_count FORMAT 999,999

-- ============================================
-- 1. VERIFY ALL TABLES EXIST
-- ============================================
PROMPT '==============================================';
PROMPT '1. All Tables in Database';
PROMPT '==============================================';

SELECT table_name, num_rows 
FROM user_tables 
ORDER BY table_name;

PROMPT '';

-- ============================================
-- 2. RECORD COUNT SUMMARY
-- ============================================
PROMPT '==============================================';
PROMPT '2. Record Count Summary';
PROMPT '==============================================';

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
SELECT 'Receipt', COUNT(*) FROM Receipt
ORDER BY Table_Name;

PROMPT '';

-- ============================================
-- 3. CONSTRAINT SUMMARY
-- ============================================
PROMPT '==============================================';
PROMPT '3. Constraint Summary';
PROMPT '==============================================';

SELECT constraint_type, COUNT(*) as count
FROM user_constraints
GROUP BY constraint_type
ORDER BY constraint_type;

PROMPT '';

-- ============================================
-- 4. FOREIGN KEY RELATIONSHIPS
-- ============================================
PROMPT '==============================================';
PROMPT '4. Foreign Key Relationships';
PROMPT '==============================================';

SELECT 
    a.table_name AS child_table,
    a.constraint_name,
    b.table_name AS parent_table
FROM user_constraints a
JOIN user_constraints b ON a.r_constraint_name = b.constraint_name
WHERE a.constraint_type = 'R'
ORDER BY a.table_name;

PROMPT '';

-- ============================================
-- 5. SAMPLE DATA PREVIEW
-- ============================================
PROMPT '==============================================';
PROMPT '5. Sample Data Preview (First 5 records)';
PROMPT '==============================================';

PROMPT '';
PROMPT 'Managers:';
SELECT * FROM Manager WHERE ROWNUM <= 5;

PROMPT '';
PROMPT 'Items by Category:';
SELECT Category, COUNT(*) as Item_Count, AVG(Price) as Avg_Price
FROM Item
GROUP BY Category
ORDER BY Category;

PROMPT '';
PROMPT 'Recent Orders:';
SELECT o.Order_id, o.Order_date, c.Name as Customer_Name, ca.Name as Cashier_Name
FROM Orders o
LEFT JOIN Customer c ON o.Customer_id = c.Customer_id
JOIN Cashier ca ON o.Cashier_id = ca.Cashier_id
WHERE ROWNUM <= 10
ORDER BY o.Order_date DESC;

PROMPT '';

-- ============================================
-- 6. INVENTORY STATUS
-- ============================================
PROMPT '==============================================';
PROMPT '6. Inventory Status';
PROMPT '==============================================';

PROMPT '';
PROMPT 'Low Stock Items (Stock < 10):';
SELECT Item_id, Item_Name, Stock_Qty, Category
FROM Item
WHERE Stock_Qty < 10
ORDER BY Stock_Qty;

PROMPT '';
PROMPT 'Stock Summary by Category:';
SELECT Category, 
       COUNT(*) as Total_Items,
       SUM(Stock_Qty) as Total_Stock,
       AVG(Stock_Qty) as Avg_Stock
FROM Item
GROUP BY Category
ORDER BY Category;

PROMPT '';

-- ============================================
-- 7. SALES SUMMARY
-- ============================================
PROMPT '==============================================';
PROMPT '7. Sales Summary';
PROMPT '==============================================';

PROMPT '';
PROMPT 'Total Sales by Payment Method:';
SELECT Payment_method, 
       COUNT(*) as Transaction_Count,
       SUM(Total_Amount) as Total_Sales,
       AVG(Total_Amount) as Avg_Transaction
FROM Receipt
GROUP BY Payment_method
ORDER BY Total_Sales DESC;

PROMPT '';
PROMPT 'Top 10 Customers by Order Count:';
SELECT c.Customer_id, c.Name, COUNT(o.Order_id) as Order_Count
FROM Customer c
JOIN Orders o ON c.Customer_id = o.Customer_id
GROUP BY c.Customer_id, c.Name
ORDER BY Order_Count DESC
FETCH FIRST 10 ROWS ONLY;

PROMPT '';

-- ============================================
-- 8. SUPPLIER PERFORMANCE
-- ============================================
PROMPT '==============================================';
PROMPT '8. Supplier Performance';
PROMPT '==============================================';

SELECT s.Supplier_id, s.Name, 
       COUNT(sup.Supply_id) as Total_Supplies,
       SUM(sup.Quantity) as Total_Quantity
FROM Supplier s
LEFT JOIN Supply sup ON s.Supplier_id = sup.Supplier_id
GROUP BY s.Supplier_id, s.Name
ORDER BY Total_Supplies DESC;

PROMPT '';

-- ============================================
-- 9. POPULAR ITEMS
-- ============================================
PROMPT '==============================================';
PROMPT '9. Top 10 Most Ordered Items';
PROMPT '==============================================';

SELECT i.Item_id, i.Item_Name, i.Category,
       SUM(od.Quantity) as Total_Sold,
       COUNT(DISTINCT od.Order_id) as Order_Count
FROM Item i
JOIN Order_Details od ON i.Item_id = od.Item_id
GROUP BY i.Item_id, i.Item_Name, i.Category
ORDER BY Total_Sold DESC
FETCH FIRST 10 ROWS ONLY;

PROMPT '';

-- ============================================
-- 10. CASHIER PERFORMANCE
-- ============================================
PROMPT '==============================================';
PROMPT '10. Cashier Performance';
PROMPT '==============================================';

SELECT c.Cashier_id, c.Name,
       COUNT(o.Order_id) as Orders_Processed,
       SUM(r.Total_Amount) as Total_Sales
FROM Cashier c
LEFT JOIN Orders o ON c.Cashier_id = o.Cashier_id
LEFT JOIN Receipt r ON o.Order_id = r.Order_id
GROUP BY c.Cashier_id, c.Name
ORDER BY Total_Sales DESC;

PROMPT '';
PROMPT '==============================================';
PROMPT 'Verification Complete!';
PROMPT '==============================================';
