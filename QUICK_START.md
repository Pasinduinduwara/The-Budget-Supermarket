# Quick Start Guide - The Budget Supermarket Application

## Current Status
✅ **Frontend:** Running on http://localhost:3000  
⚠️ **Backend:** Requires Oracle Instant Client installation  
⚠️ **Database:** Requires Oracle Database running

---

## Prerequisites

### 1. Oracle Database
- Oracle Database 11g or higher must be installed and running
- Default port: 1521
- Service name: ORCL

### 2. Oracle Instant Client (Required for Backend)
**This is currently missing and needs to be installed!**

#### Download & Install Oracle Instant Client:

1. **Download from Oracle:**
   - Visit: https://www.oracle.com/database/technologies/instant-client/downloads.html
   - Download "Instant Client Basic" for Windows x64
   - Version: 21.x or 19.x recommended

2. **Extract and Configure:**
   ```
   - Extract to: C:\oracle\instantclient_21_x
   - Add to PATH environment variable:
     C:\oracle\instantclient_21_x
   ```

3. **Verify Installation:**
   ```powershell
   # Open new PowerShell and run:
   sqlplus /nolog
   # Should show SQL*Plus prompt
   ```

### 3. Python & Node.js
✅ Python 3.14.1 - Installed  
✅ Node.js 20.19.3 - Installed

---

## Step-by-Step Startup

### Step 1: Setup Oracle Database

```powershell
# Connect to Oracle as SYS
sqlplus sys as sysdba

# Run the master installation script
@C:\Users\Pasindu Induwara\Desktop\The budget - Supermarket application\database\00_master_install.sql
```

This will:
- Create the budget_supermarket user
- Create all 11 tables
- Insert 298 sample records

### Step 2: Start Backend API

**After installing Oracle Instant Client:**

```powershell
cd "C:\Users\Pasindu Induwara\Desktop\The budget - Supermarket application\backend"

# Activate virtual environment
.\venv\Scripts\Activate.ps1

# Install dependencies (will work after Oracle Client is installed)
pip install -r requirements.txt

# Start the server
python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

Backend will be available at:
- API: http://localhost:8000
- Swagger Docs: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

### Step 3: Start Frontend

**Currently Running!** ✅

```powershell
cd "C:\Users\Pasindu Induwara\Desktop\The budget - Supermarket application\front end"

# Install dependencies (already done)
npm install

# Start development server (already running)
npm run dev
```

Frontend is available at: http://localhost:3000

---

## Current Running Services

| Service | Status | URL |
|---------|--------|-----|
| Frontend | ✅ Running | http://localhost:3000 |
| Backend | ⚠️ Needs Oracle Client | http://localhost:8000 |
| Database | ⚠️ Not verified | localhost:1521 |

---

## Troubleshooting

### Backend: "No module named cx_Oracle"

**Cause:** Oracle Instant Client not installed

**Solution:**
1. Download Oracle Instant Client (see Prerequisites above)
2. Extract to C:\oracle\instantclient_21_x
3. Add to PATH environment variable
4. Restart PowerShell
5. Run: `pip install cx_Oracle`

### Database Connection Failed

**Check:**
1. Oracle Database is running
2. Listener is active: `lsnrctl status`
3. Service name is correct (ORCL)
4. Credentials in backend/.env are correct:
   ```
   DATABASE_USER=budget_supermarket
   DATABASE_PASSWORD=BudgetSuper2026
   ```

### Frontend Can't Connect to Backend

**Check:**
1. Backend is running on port 8000
2. No CORS errors in browser console
3. Proxy configuration in vite.config.ts is correct

---

## Testing the Application

Once all services are running:

1. **Open Frontend:** http://localhost:3000
2. **Check Dashboard:** Should show statistics (requires backend + database)
3. **Test API:** http://localhost:8000/docs
4. **Verify Data:** Check if items, customers, orders are loading

---

## Quick Commands Reference

```powershell
# Check if Oracle is running
lsnrctl status

# Check if ports are in use
netstat -ano | findstr :8000
netstat -ano | findstr :3000

# Stop backend (if running)
# Press Ctrl+C in the backend terminal

# Stop frontend (if running)
# Press Ctrl+C in the frontend terminal
```

---

## Next Steps

1. ✅ Frontend is running - you can view the UI
2. ⚠️ Install Oracle Instant Client
3. ⚠️ Setup Oracle Database (run database scripts)
4. ⚠️ Start backend server
5. ✅ Test the complete application

---

## Support

If you encounter issues:
1. Check the README.md files in each directory
2. Verify all prerequisites are installed
3. Check error messages in terminal
4. Ensure Oracle Database is running and accessible

**Created:** 2026-01-01  
**Status:** Frontend Running, Backend Pending Oracle Client
