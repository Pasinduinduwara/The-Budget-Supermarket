-- ============================================
-- The Budget Supermarket - MSSQL Database
-- Table Creation Script
-- ============================================
-- Author: Database Team
-- Date: 2026-01-01
-- Description: Creates all tables for The Budget Supermarket system
-- Tables are created in dependency order (parent tables first)
-- ============================================

-- ============================================
-- INDEPENDENT TABLES (No Foreign Keys)
-- ============================================

-- 1. Manager Table
CREATE TABLE Manager (
    Manager_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Contact_info VARCHAR(10) NOT NULL,
    CONSTRAINT chk_manager_contact CHECK (LEN(Contact_info) = 10)
);

-- 2. Store_Admin Table
CREATE TABLE Store_Admin (
    Storeadmin_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Contact_info VARCHAR(10) NOT NULL,
    CONSTRAINT chk_storeadmin_contact CHECK (LEN(Contact_info) = 10)
);

-- 3. Customer Table
CREATE TABLE Customer (
    Customer_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Contact_info VARCHAR(10) NOT NULL,
    CONSTRAINT chk_customer_contact CHECK (LEN(Contact_info) = 10)
);

-- 4. Cashier Table
CREATE TABLE Cashier (
    Cashier_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    CONSTRAINT chk_cashier_name CHECK (LEN(Name) > 0)
);

-- ============================================
-- FIRST-LEVEL DEPENDENT TABLES
-- ============================================

-- 5. Supplier Table
CREATE TABLE Supplier (
    Supplier_id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Contact_info VARCHAR(10) NOT NULL,
    Storeadmin_id VARCHAR(10) NOT NULL,
    CONSTRAINT fk_supplier_storeadmin 
        FOREIGN KEY (Storeadmin_id) 
        REFERENCES Store_Admin(Storeadmin_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_supplier_contact CHECK (LEN(Contact_info) = 10)
);

-- Create index on foreign key
CREATE INDEX idx_supplier_storeadmin ON Supplier(Storeadmin_id);

-- 6. Item Table
CREATE TABLE Item (
    Item_id VARCHAR(10) PRIMARY KEY,
    Item_Name VARCHAR(40) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock_Qty INT DEFAULT 0 NOT NULL,
    Category VARCHAR(200),
    Manager_id VARCHAR(10),
    CONSTRAINT fk_item_manager 
        FOREIGN KEY (Manager_id) 
        REFERENCES Manager(Manager_id)
        ON DELETE SET NULL,
    CONSTRAINT chk_item_price CHECK (Price >= 0),
    CONSTRAINT chk_item_stock CHECK (Stock_Qty >= 0)
);

-- Create indexes on foreign key and category
CREATE INDEX idx_item_manager ON Item(Manager_id);
CREATE INDEX idx_item_category ON Item(Category);

-- ============================================
-- SECOND-LEVEL DEPENDENT TABLES
-- ============================================

-- 7. Supply_Order Table
CREATE TABLE Supply_Order (
    Supplyorder_id VARCHAR(10) PRIMARY KEY,
    Order_Date DATETIME NOT NULL,
    Manager_id VARCHAR(10) NOT NULL,
    CONSTRAINT fk_supplyorder_manager 
        FOREIGN KEY (Manager_id) 
        REFERENCES Manager(Manager_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_supplyorder_date CHECK (Order_Date <= GETDATE())
);

-- Create indexes
CREATE INDEX idx_supplyorder_manager ON Supply_Order(Manager_id);
CREATE INDEX idx_supplyorder_date ON Supply_Order(Order_Date);

-- 8. Supply (Junction table linking Supplier, Item, and Supply_Order)
CREATE TABLE Supply (
    Supply_id VARCHAR(10) PRIMARY KEY,
    Supply_Date DATETIME NOT NULL,
    Quantity INT NOT NULL,
    Supplier_id VARCHAR(10) NOT NULL,
    Item_id VARCHAR(10) NOT NULL,
    Supplyorder_id VARCHAR(10) NOT NULL,
    CONSTRAINT fk_supply_supplier 
        FOREIGN KEY (Supplier_id) 
        REFERENCES Supplier(Supplier_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_supply_item 
        FOREIGN KEY (Item_id) 
        REFERENCES Item(Item_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_supply_supplyorder 
        FOREIGN KEY (Supplyorder_id) 
        REFERENCES Supply_Order(Supplyorder_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_supply_quantity CHECK (Quantity > 0),
    CONSTRAINT chk_supply_date CHECK (Supply_Date <= GETDATE())
);

-- Create indexes
CREATE INDEX idx_supply_supplier ON Supply(Supplier_id);
CREATE INDEX idx_supply_item ON Supply(Item_id);
CREATE INDEX idx_supply_supplyorder ON Supply(Supplyorder_id);
CREATE INDEX idx_supply_composite ON Supply(Supplier_id, Item_id);

-- 9. Orders Table
CREATE TABLE Orders (
    Order_id VARCHAR(10) PRIMARY KEY,
    Order_date DATETIME NOT NULL,
    Customer_id VARCHAR(10),
    Cashier_id VARCHAR(10) NOT NULL,
    CONSTRAINT fk_order_customer 
        FOREIGN KEY (Customer_id) 
        REFERENCES Customer(Customer_id)
        ON DELETE SET NULL,
    CONSTRAINT fk_order_cashier 
        FOREIGN KEY (Cashier_id) 
        REFERENCES Cashier(Cashier_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_order_date CHECK (Order_date <= GETDATE())
);

-- Create indexes
CREATE INDEX idx_order_customer ON Orders(Customer_id);
CREATE INDEX idx_order_cashier ON Orders(Cashier_id);
CREATE INDEX idx_order_date ON Orders(Order_date);

-- ============================================
-- THIRD-LEVEL DEPENDENT TABLES
-- ============================================

-- 10. Order_Details Table
CREATE TABLE Order_Details (
    Order_id VARCHAR(10) NOT NULL,
    Item_id VARCHAR(10) NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT pk_orderdetails PRIMARY KEY (Order_id, Item_id),
    CONSTRAINT fk_orderdetails_order 
        FOREIGN KEY (Order_id) 
        REFERENCES Orders(Order_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_orderdetails_item 
        FOREIGN KEY (Item_id) 
        REFERENCES Item(Item_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_orderdetails_quantity CHECK (Quantity > 0)
);

-- Create index on Item_id
CREATE INDEX idx_orderdetails_item ON Order_Details(Item_id);

-- 11. Receipt Table
CREATE TABLE Receipt (
    Receipt_id INT PRIMARY KEY,
    Payment_method VARCHAR(45) NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL,
    Order_id VARCHAR(10) NOT NULL, -- Fixed from VARCHAR(20) to match Orders
    Cashier_id VARCHAR(10) NOT NULL,
    CONSTRAINT fk_receipt_order 
        FOREIGN KEY (Order_id) 
        REFERENCES Orders(Order_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_receipt_cashier 
        FOREIGN KEY (Cashier_id) 
        REFERENCES Cashier(Cashier_id)
        ON DELETE CASCADE,
    CONSTRAINT chk_receipt_amount CHECK (Total_Amount >= 0),
    CONSTRAINT chk_payment_method CHECK (Payment_method IN ('Cash', 'Card', 'Digital Wallet'))
);

-- Create indexes
CREATE INDEX idx_receipt_order ON Receipt(Order_id);
CREATE INDEX idx_receipt_cashier ON Receipt(Cashier_id);
