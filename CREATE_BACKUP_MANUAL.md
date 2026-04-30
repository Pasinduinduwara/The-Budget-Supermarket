# Manual Database Backup Creation Guide

## ⚠️ IMPORTANT: Backup Cannot Be Created Automatically

The backup file (.bak) must be created manually because:
- SQL Server tools (sqlcmd) are not available in this environment
- Database backup requires direct SQL Server access
- Backup creation needs administrative privileges

## 🔧 STEP-BY-STEP BACKUP CREATION

### Method 1: SQL Server Management Studio (RECOMMENDED)

1. **Open SQL Server Management Studio (SSMS)**
   - Launch SSMS from Start Menu
   - Connect to your SQL Server instance

2. **Locate Your Database**
   - Find "budget_supermarket" in Object Explorer
   - Right-click on the database name

3. **Initiate Backup**
   - Go to **Tasks → Back Up...**
   - Backup type: **Full** (default)
   - Destination: Click **Add...**
   - Browse to your project folder
   - Set filename: `budget_supermarket_backup.bak`
   - Click **OK** on all dialogs

4. **Verify Backup**
   - Check that the .bak file is created
   - File size should be several MB

### Method 2: Using PowerShell with SQL Module

```powershell
# Import SQL Server module
Import-Module SqlServer

# Create backup
Backup-SqlDatabase -ServerInstance "localhost" -DatabaseName "budget_supermarket" -BackupFile "C:\Users\Pasindu Induwara\Desktop\ADBMS\The budget - Supermarket application\backup\budget_supermarket_backup.bak"
```

### Method 3: Using T-SQL Query

1. **Open SSMS**
2. **New Query Window**
3. **Execute this SQL:**

```sql
-- Create backup directory if needed (run once)
EXEC xp_cmdshell 'mkdir "C:\Users\Pasindu Induwara\Desktop\ADBMS\The budget - Supermarket application\backup"';

-- Create backup
BACKUP DATABASE [budget_supermarket]
TO DISK = N'C:\Users\Pasindu Induwara\Desktop\ADBMS\The budget - Supermarket application\backup\budget_supermarket_backup.bak'
WITH
    NAME = N'Budget Supermarket Full Backup',
    DESCRIPTION = N'Complete backup for assignment submission',
    STATS = 10,
    CHECKSUM;
GO
```

## 📍 EXPECTED BACKUP LOCATION

**File Path:** `C:\Users\Pasindu Induwara\Desktop\ADBMS\The budget - Supermarket application\backup\budget_supermarket_backup.bak`

**Expected Size:** 5-20 MB (depending on data volume)

## ✅ VERIFICATION STEPS

1. **Check file exists** in the backup folder
2. **Verify file size** is reasonable (not 0 KB)
3. **Optional: Test restore** on a test database

## 🚨 TROUBLESHOOTING

### If backup fails:
1. **Check SQL Server is running**
2. **Verify database name** is exactly "budget_supermarket"
3. **Ensure sufficient disk space**
4. **Run SSMS as Administrator**
5. **Check folder permissions**

### Common Error Messages:
- "Cannot open backup device" → Check file path and permissions
- "Database does not exist" → Verify database name spelling
- "Access denied" → Run as Administrator

## 📋 SUBMISSION REQUIREMENTS

- ✅ File must be named: `budget_supermarket_backup.bak`
- ✅ Must contain all tables and data
- ✅ Must include advanced objects (triggers, functions, etc.)
- ✅ Include in final submission package

## 🎯 NEXT STEPS AFTER BACKUP

1. ✅ Create the .bak file using one of the methods above
2. ✅ Verify the file exists and has reasonable size
3. ✅ Add to your assignment submission folder
4. ✅ Update TODO list as completed

---

**⚠️ CRITICAL:** This .bak file is REQUIRED for assignment submission. Without it, your submission will be incomplete.
