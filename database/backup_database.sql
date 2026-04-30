-- ============================================
-- The Budget Supermarket - MSSQL Database Backup Script
-- ============================================
-- Author: Database Team
-- Date: 2026-01-03
-- Description: Creates a full backup of the Budget Supermarket database
-- ============================================

-- Backup Command for MSSQL Server
-- Execute this in MSSQL Server Management Studio or via sqlcmd

-- NOTE: Replace 'C:\Backup\' with your desired backup directory
-- Make sure the directory exists and SQL Server has write permissions

BACKUP DATABASE [budget_supermarket]
TO DISK = N'C:\Backup\budget_supermarket_backup.bak'
WITH
    NAME = N'Budget Supermarket Full Backup',
    DESCRIPTION = N'Complete backup of Budget Supermarket database including all tables, data, and advanced objects',
    NOFORMAT,
    NOINIT,
    NAME = N'budget_supermarket-Full Database Backup',
    SKIP,
    NOREWIND,
    NOUNLOAD,
    STATS = 10,
    CHECKSUM;

GO

-- Alternative: Backup with compression (if SQL Server 2008 R2 SP1 or later)
-- BACKUP DATABASE [budget_supermarket]
-- TO DISK = N'C:\Backup\budget_supermarket_backup_compressed.bak'
-- WITH
--     COMPRESSION,
--     NAME = N'Budget Supermarket Compressed Backup',
--     DESCRIPTION = N'Compressed backup of Budget Supermarket database',
--     STATS = 10;

-- Verification: Check backup file was created
-- RESTORE VERIFYONLY FROM DISK = N'C:\Backup\budget_supermarket_backup.bak';

-- ============================================
-- INSTRUCTIONS FOR CREATING BACKUP:
-- ============================================
--
-- Method 1: Using SQL Server Management Studio (SSMS)
-- 1. Open SSMS and connect to your MSSQL Server
-- 2. Right-click on "budget_supermarket" database
-- 3. Go to Tasks > Back Up...
-- 4. Select "Full" backup type
-- 5. Choose backup destination (create folder if needed)
-- 6. Name the file: budget_supermarket_backup.bak
-- 7. Click OK to create backup
--
-- Method 2: Using SQL Script
-- 1. Open SSMS and connect to your server
-- 2. Open this script file
-- 3. Modify the backup path if needed
-- 4. Execute the script
--
-- Method 3: Using Command Line (sqlcmd)
-- sqlcmd -S server_name -U username -P password -Q "BACKUP DATABASE [budget_supermarket] TO DISK = N'C:\Backup\budget_supermarket_backup.bak'"
--
-- ============================================
-- SUBMISSION REQUIREMENTS:
-- ============================================
-- - Include the .bak file in your submission package
-- - File should be named: budget_supermarket_backup.bak
-- - Ensure it contains all tables, data, and advanced objects
-- - Test restoration to verify backup integrity
