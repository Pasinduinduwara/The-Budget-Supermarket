import pyodbc
from app.config import settings

def test_connection():
    print(f"Testing connection to: {settings.DATABASE_HOST}")
    print(f"Connection string: {settings.database_dsn}")
    try:
        conn = pyodbc.connect(settings.database_dsn)
        print("Successfully connected to the database!")
        cursor = conn.cursor()
        cursor.execute("SELECT @@VERSION")
        row = cursor.fetchone()
        print(f"MSSQL Version: {row[0]}")
        conn.close()
    except Exception as e:
        print(f"Connection failed: {e}")

if __name__ == "__main__":
    test_connection()
