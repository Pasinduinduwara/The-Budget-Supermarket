@echo off
set "PYTHON_PATH=C:\Users\Pasindu Induwara\AppData\Local\Programs\Python\Python311\python.exe"
set "VENV_DIR=venv_stable"

echo Checking for Python at: "%PYTHON_PATH%"
if not exist "%PYTHON_PATH%" (
    echo [ERROR] Python not found at "%PYTHON_PATH%"
    exit /b 1
)

if not exist "%VENV_DIR%" (
    echo Creating virtual environment...
    "%PYTHON_PATH%" -m venv "%VENV_DIR%"
)

if not exist "%VENV_DIR%\Scripts\python.exe" (
    echo [ERROR] Virtual environment creation failed.
    exit /b 1
)

echo Installing requirements...
"%VENV_DIR%\Scripts\python.exe" -m pip install -r requirements.txt

echo Starting Backend...
"%VENV_DIR%\Scripts\uvicorn.exe" app.main:app --reload --port 8000
