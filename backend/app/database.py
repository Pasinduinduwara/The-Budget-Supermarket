"""
Database connection module for Microsoft SQL Server.
Provides connection management and context managers for safe database operations.
"""

import pyodbc
from contextlib import contextmanager
from typing import Generator, Any
from app.config import settings
import logging

logger = logging.getLogger(__name__)


class DatabaseConnection:
    """MSSQL database connection manager."""
    
    def __init__(self):
        """Initialize database connection settings."""
        self.connection_string = settings.database_dsn
        logger.info("Database connection manager initialized")
    
    @contextmanager
    def get_connection(self) -> Generator[pyodbc.Connection, None, None]:
        """
        Context manager for database connections.
        
        Yields:
            pyodbc.Connection: Database connection
        """
        connection = None
        try:
            connection = pyodbc.connect(self.connection_string)
            yield connection
        except pyodbc.Error as e:
            logger.error(f"Database connection error: {e}")
            if connection:
                connection.rollback()
            raise
        finally:
            if connection:
                connection.close()
    
    @contextmanager
    def get_cursor(self) -> Generator[pyodbc.Cursor, None, None]:
        """
        Context manager for database cursor with automatic commit/rollback.
        
        Yields:
            pyodbc.Cursor: Database cursor
        """
        connection = None
        cursor = None
        try:
            connection = pyodbc.connect(self.connection_string)
            cursor = connection.cursor()
            yield cursor
            connection.commit()
        except pyodbc.Error as e:
            logger.error(f"Database error: {e}")
            if connection:
                connection.rollback()
            raise
        finally:
            if cursor:
                cursor.close()
            if connection:
                connection.close()


# Global database instance
db = DatabaseConnection()


def get_db():
    """
    Dependency injection function for FastAPI routes.
    
    Returns:
        DatabaseConnection: Database connection instance
    """
    return db
