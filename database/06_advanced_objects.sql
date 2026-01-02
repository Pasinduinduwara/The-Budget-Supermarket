-- ============================================
-- The Budget Supermarket - MSSQL Database
-- Advanced Objects Script (Section 3)
-- ============================================
-- Author: Database Team
-- Date: 2026-01-02
-- Description: Triggers, Functions, Views, and Stored Procedures
-- ============================================

-- 0. Audit Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'AuditLog')
BEGIN
    CREATE TABLE AuditLog (
        Log_id INT IDENTITY PRIMARY KEY,
        Table_Name VARCHAR(50),
        Record_id VARCHAR(50),
        Action VARCHAR(50),
        Old_Value NVARCHAR(MAX),
        New_Value NVARCHAR(MAX),
        Changed_By VARCHAR(50) DEFAULT SYSTEM_USER,
        Changed_At DATETIME DEFAULT GETDATE()
    );
END
GO

-- ============================================
-- 3.1 TRIGGERS
-- ============================================

-- TRG 1: Audit Item Price Changes
CREATE OR ALTER TRIGGER trg_ItemPriceAudit
ON Item
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(Price)
    BEGIN
        INSERT INTO AuditLog (Table_Name, Record_id, Action, Old_Value, New_Value)
        SELECT 
            'Item', 
            d.Item_id, 
            'UPDATE_PRICE', 
            CAST(d.Price AS VARCHAR(50)), 
            CAST(i.Price AS VARCHAR(50))
        FROM deleted d
        JOIN inserted i ON d.Item_id = i.Item_id;
    END
END
GO

-- TRG 2: Automatically update stock when an order detail is inserted (Stock-Out)
CREATE OR ALTER TRIGGER trg_UpdateStockOnOrder
ON Order_Details
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Item
    SET Stock_Qty = i.Stock_Qty - ins.Quantity
    FROM Item i
    JOIN inserted ins ON i.Item_id = ins.Item_id;
END
GO

-- TRG 3: Automatically update stock when a supply is received (Stock-In)
CREATE OR ALTER TRIGGER trg_UpdateStockOnSupply
ON Supply
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Item
    SET Stock_Qty = i.Stock_Qty + ins.Quantity
    FROM Item i
    JOIN inserted ins ON i.Item_id = ins.Item_id;
END
GO

-- ============================================
-- 3.2 FUNCTIONS
-- ============================================

-- FN 1: Calculate Total Amount for an Order
CREATE OR ALTER FUNCTION fn_CalculateTotalOrder (@OrderId VARCHAR(10))
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);
    SELECT @Total = SUM(i.Price * od.Quantity)
    FROM Order_Details od
    JOIN Item i ON od.item_id = i.item_id
    WHERE od.order_id = @OrderId;
    RETURN ISNULL(@Total, 0);
END
GO

-- FN 2: Get Customer Spending Tier (BI Logic)
CREATE OR ALTER FUNCTION fn_GetCustomerTier (@CustomerId VARCHAR(10))
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @TotalSpent DECIMAL(18,2);
    DECLARE @Tier VARCHAR(20);

    SELECT @TotalSpent = SUM(Total_Amount)
    FROM Receipt r
    JOIN Orders o ON r.order_id = o.order_id
    WHERE o.customer_id = @CustomerId;

    SET @TotalSpent = ISNULL(@TotalSpent, 0);

    IF @TotalSpent > 10000 SET @Tier = 'Platinum';
    ELSE IF @TotalSpent > 5000 SET @Tier = 'Gold';
    ELSE IF @TotalSpent > 1000 SET @Tier = 'Silver';
    ELSE SET @Tier = 'Bronze';

    RETURN @Tier;
END
GO

-- ============================================
-- 3.3 VIEWS
-- ============================================

-- VW 1: Sales Analysis by Category (Business Intelligence)
CREATE OR ALTER VIEW vw_CategorySalesPerformance
AS
SELECT 
    i.Category,
    COUNT(DISTINCT od.order_id) as Order_Count,
    SUM(od.Quantity) as Total_Units_Sold,
    SUM(od.Quantity * i.Price) as Total_Revenue
FROM Item i
LEFT JOIN Order_Details od ON i.item_id = od.item_id
GROUP BY i.Category;
GO

-- VW 2: Low Stock Warning System (Operational Intelligence)
CREATE OR ALTER VIEW vw_InventoryHealth
AS
SELECT 
    i.Item_id,
    i.Item_Name,
    i.Stock_Qty,
    i.Category,
    CASE 
        WHEN i.Stock_Qty = 0 THEN 'OUT OF STOCK'
        WHEN i.Stock_Qty < 10 THEN 'CRITICAL'
        WHEN i.Stock_Qty < 30 THEN 'LOW'
        ELSE 'HEALTHY'
    END as Health_Status,
    m.Name as Managing_Manager
FROM Item i
LEFT JOIN Manager m ON i.manager_id = m.manager_id;
GO

-- ============================================
-- 3.4 STORED PROCEDURES
-- ============================================

-- SP 1: Secure Order Creation Transaction
CREATE OR ALTER PROCEDURE sp_PlaceOrder
    @OrderId VARCHAR(10),
    @CustomerId VARCHAR(10),
    @CashierId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
            INSERT INTO Orders (Order_id, Order_date, Customer_id, Cashier_id)
            VALUES (@OrderId, GETDATE(), @CustomerId, @CashierId);
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO

-- SP 2: Generate Supplier Performance Report
CREATE OR ALTER PROCEDURE sp_GetSupplierReport
AS
BEGIN
    SELECT 
        s.Name as Supplier_Name,
        COUNT(sup.supply_id) as Supply_Frequency,
        SUM(sup.Quantity) as Total_Quantity_Supplied,
        ISNULL(SUM(sup.Quantity * i.Price), 0) as Approximate_Value
    FROM Supplier s
    LEFT JOIN Supply sup ON s.supplier_id = sup.supplier_id
    LEFT JOIN Item i ON sup.item_id = i.item_id
    GROUP BY s.Name
    ORDER BY Supply_Frequency DESC;
END
GO
