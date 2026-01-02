@echo off
echo ==========================================
echo Starting The Budget Supermarket Application
echo ==========================================

:: Start Backend
start cmd /k "cd backend && python -m pip install --only-binary=:all: fastapi pydantic pydantic-settings uvicorn[standard] pyodbc --user && python -m uvicorn app.main:app --reload --port 8000"

:: Start Frontend
start cmd /k "cd "front end" && npm run dev"

echo ==========================================
echo Servers are starting in separate windows.
echo Backend: http://localhost:8000/docs
echo Frontend: http://localhost:5173
echo ==========================================
pause
