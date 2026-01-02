-- ============================================
-- The Budget Supermarket - Oracle Database
-- Master Execution Script
-- ============================================
-- Author: Database Team
-- Date: 2026-01-01
-- Description: Master script to execute all database creation steps in order
-- Run this script as SYS or SYSTEM user
-- ============================================

PROMPT '==============================================';
PROMPT 'The Budget Supermarket Database Installation';
PROMPT '==============================================';
PROMPT '';

-- Step 1: Create Database/Schema
PROMPT 'Step 1/3: Creating database schema and user...';
@@01_create_database.sql
PROMPT 'Step 1 completed successfully!';
PROMPT '';

-- Step 2: Connect as budget_supermarket user and create tables
PROMPT 'Step 2/3: Creating tables...';
PROMPT 'Connecting as budget_supermarket user...';
CONNECT budget_supermarket/BudgetSuper2026;
@@02_create_tables.sql
PROMPT 'Step 2 completed successfully!';
PROMPT '';

-- Step 3: Insert sample data
PROMPT 'Step 3/3: Inserting sample data...';
@@03_insert_sample_data.sql
PROMPT 'Step 3 completed successfully!';
PROMPT '';

-- Step 4: Create advanced objects (Triggers, Functions, Views, Procedures)
PROMPT 'Step 4/4: Creating advanced database objects...';
@@06_advanced_objects.sql
PROMPT 'Step 4 completed successfully!';
PROMPT '';

-- Final verification
PROMPT '==============================================';
PROMPT 'INSTALLATION COMPLETE!';
PROMPT '==============================================';
PROMPT '';
PROMPT 'Database Summary:';
PROMPT '- User/Schema: budget_supermarket';
PROMPT '- Password: BudgetSuper2026';
PROMPT '- Total Tables: 12 (including AuditLog)';
PROMPT '- Total Records: 298';
PROMPT '- Advanced Objects: Triggers(2), Functions(2), Views(2), Procedures(2)';
PROMPT '';
PROMPT 'Next Steps:';
PROMPT '1. Review the data using SQL queries';
PROMPT '2. Generate database diagram';
PROMPT '3. Verify advanced objects functionality';
PROMPT '4. Capture screenshots for documentation';
PROMPT '';
PROMPT 'To connect to the database:';
PROMPT 'CONNECT budget_supermarket/BudgetSuper2026';
PROMPT '';
PROMPT '==============================================';
