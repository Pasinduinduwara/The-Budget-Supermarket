-- ============================================
-- The Budget Supermarket - Oracle Database
-- Database Creation Script
-- ============================================
-- Author: Database Team
-- Date: 2026-01-01
-- Description: Creates the main database and schema for The Budget Supermarket system
-- ============================================

-- Note: In Oracle, we don't create a "database" like in SQL Server
-- Instead, we create a user/schema that will own all the tables

-- Create tablespace for the application (optional but recommended)
CREATE TABLESPACE budget_supermarket_data
DATAFILE 'budget_supermarket_data01.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED
LOGGING
ONLINE
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
SEGMENT SPACE MANAGEMENT AUTO;

-- Create user/schema
CREATE USER budget_supermarket IDENTIFIED BY BudgetSuper2026
DEFAULT TABLESPACE budget_supermarket_data
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON budget_supermarket_data;

-- Grant necessary privileges
GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE TRIGGER TO budget_supermarket;
GRANT CREATE SESSION TO budget_supermarket;
GRANT CREATE TABLE TO budget_supermarket;
GRANT CREATE SEQUENCE TO budget_supermarket;
GRANT CREATE PROCEDURE TO budget_supermarket;

-- Connect as the new user for subsequent operations
-- CONNECT budget_supermarket/BudgetSuper2026;

COMMIT;
