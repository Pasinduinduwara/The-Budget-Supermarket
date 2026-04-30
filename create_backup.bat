@echo off
REM ============================================
REM The Budget Supermarket - Database Backup Script
REM ============================================
REM This batch file creates a full backup of the MSSQL database
REM Run this as Administrator if needed
REM ============================================

echo ============================================
echo The Budget Supermarket - Database Backup
echo ============================================

REM Set variables
set DB_NAME=budget_supermarket
set BACKUP_DIR=%~dp0backup
set BACKUP_FILE=%BACKUP_DIR%\%DB_NAME%_backup.bak

REM Create backup directory if it doesn't exist
if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
    echo Created backup directory: %BACKUP_DIR%
)

echo.
echo Creating database backup...
echo Database: %DB_NAME%
echo Backup file: %BACKUP_FILE%
echo.

REM SQLCMD command to backup database
REM Note: Update server name, username, and password as needed
sqlcmd -S localhost -U budget_supermarket -P BudgetSuper2026 -Q "BACKUP DATABASE [%DB_NAME%] TO DISK = N'%BACKUP_FILE%' WITH NAME = N'Budget Supermarket Full Backup', DESCRIPTION = N'Complete backup of Budget Supermarket database including all tables, data, and advanced objects', NOFORMAT, NOINIT, NAME = N'%DB_NAME%-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10, CHECKSUM;"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ============================================
    echo SUCCESS: Database backup created successfully!
    echo ============================================
    echo Backup file: %BACKUP_FILE%
    echo.
    echo File size:
    dir "%BACKUP_FILE%" | findstr /C:"%DB_NAME%_backup.bak"
    echo.
    echo Next steps:
    echo 1. Verify the backup file exists in the backup folder
    echo 2. Test restoration to ensure backup integrity
    echo 3. Include this .bak file in your assignment submission
) else (
    echo.
    echo ============================================
    echo ERROR: Failed to create database backup!
    echo ============================================
    echo.
    echo Possible solutions:
    echo 1. Ensure MSSQL Server is running
    echo 2. Verify database name: %DB_NAME%
    echo 3. Check login credentials
    echo 4. Run this script as Administrator
    echo 5. Check that the backup directory is writable
    echo.
    echo Error code: %ERRORLEVEL%
)

echo.
pause
