"""
Configuration module for The Budget Supermarket API.
Handles environment variables and application settings.
"""

from pydantic_settings import BaseSettings
from typing import List


class Settings(BaseSettings):
    """Application settings loaded from environment variables."""
    
    # Database Configuration
    DATABASE_HOST: str
    DATABASE_PORT: int
    DATABASE_NAME: str
    DATABASE_USER: str
    DATABASE_PASSWORD: str
    DATABASE_DRIVER: str = "ODBC Driver 17 for SQL Server"
    
    # JWT Configuration
    JWT_SECRET_KEY: str
    JWT_ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 30
    
    # CORS Configuration
    CORS_ORIGINS: str
    
    # Application Configuration
    APP_NAME: str = "Budget Supermarket API"
    APP_VERSION: str = "1.0.0"
    DEBUG: bool = False
    
    @property
    def cors_origins_list(self) -> List[str]:
        """Convert CORS_ORIGINS string to list."""
        return [origin.strip() for origin in self.CORS_ORIGINS.split(",")]
    
    @property
    def database_dsn(self) -> str:
        """Generate MSSQL connection string."""
        return (
            f"DRIVER={{{self.DATABASE_DRIVER}}};"
            f"SERVER={self.DATABASE_HOST},{self.DATABASE_PORT};"
            f"DATABASE={self.DATABASE_NAME};"
            f"UID={self.DATABASE_USER};"
            f"PWD={self.DATABASE_PASSWORD}"
        )
    
    class Config:
        env_file = ".env"
        case_sensitive = True


# Global settings instance
settings = Settings()
