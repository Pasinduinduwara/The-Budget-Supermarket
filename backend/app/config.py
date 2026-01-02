"""
Configuration module for The Budget Supermarket API.
Handles environment variables and application settings.
"""

from pydantic_settings import BaseSettings, SettingsConfigDict
from typing import List, Optional


class Settings(BaseSettings):
    """Application settings loaded from environment variables."""
    
    # Database Configuration
    DATABASE_HOST: str = "localhost"
    DATABASE_PORT: int = 1521
    DATABASE_NAME: str = "master"  # Default to master if not specified
    DATABASE_USER: str = "sa"
    DATABASE_PASSWORD: str = "Password123"
    DATABASE_DRIVER: str = "ODBC Driver 17 for SQL Server"
    
    # JWT Configuration
    JWT_SECRET_KEY: str = "your-secret-key"
    JWT_ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 30
    
    # CORS Configuration
    CORS_ORIGINS: str = "http://localhost:3000"
    
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
    
    model_config = SettingsConfigDict(
        env_file=".env",
        case_sensitive=True,
        extra="ignore"
    )


# Global settings instance
settings = Settings()
