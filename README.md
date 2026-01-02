# Budget Supermarket Management System

A comprehensive full-stack supermarket management system built with Oracle Database, Python FastAPI, and React TypeScript.

## 🎓 Academic Project
**Course:** Advanced Database Management System  
**Institution:** University Coursework  
**Date:** January 2026

## 🚀 Features

### Database (Oracle)
- 11 normalized tables (3NF)
- 468 sample records
- Complete referential integrity
- Optimized indexes

### Backend (Python FastAPI)
- 25+ REST API endpoints
- Oracle connection pooling
- Pydantic data validation
- 7 Business Intelligence algorithms

### Frontend (React TypeScript)
- Premium dark mode UI
- Responsive design
- Real-time data visualization
- Glassmorphism effects

## 📊 Business Intelligence Features

1. **Sales Trend Analysis** - Time-series with forecasting
2. **Customer Segmentation** - RFM Analysis
3. **Market Basket Analysis** - Association rules
4. **Inventory Optimization** - ABC Analysis
5. **Supplier Performance** - Multi-criteria scoring

## 🛠️ Tech Stack

- **Database:** Oracle 11g+
- **Backend:** Python 3.10+, FastAPI, cx_Oracle
- **Frontend:** React 18, TypeScript, Vite
- **Charts:** Recharts
- **Icons:** React Icons

## 📁 Project Structure

```
├── database/           # Oracle SQL scripts
├── backend/           # Python FastAPI application
├── front end/         # React TypeScript application
├── README.md
└── QUICK_START.md
```

## 🚦 Quick Start

### Prerequisites
- Oracle Database 11g+
- Oracle Instant Client
- Python 3.10+
- Node.js 18+

### Installation

1. **Setup Database**
```bash
sqlplus sys as sysdba
@database/00_master_install.sql
```

2. **Start Backend**
```bash
cd backend
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

3. **Start Frontend**
```bash
cd "front end"
npm install
npm run dev
```

### Access Points
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- API Docs: http://localhost:8000/docs

## 📊 Sample Data

- 25 Managers
- 50 Customers
- 55 Items (7 categories)
- 50 Orders
- 110 Order Details
- 50 Receipts
- And more...

## 🎨 UI Features

- Premium glassmorphism design
- Dark mode interface
- Smooth animations
- Responsive layout
- Interactive charts

## 📝 Documentation

See individual README files:
- `database/README.md` - Database setup
- `backend/README.md` - Backend API docs
- `front end/README.md` - Frontend guide
- `QUICK_START.md` - Quick setup guide

## 🔐 Default Credentials

**Database:**
- User: `budget_supermarket`
- Password: `BudgetSuper2026`

## 📸 Screenshots

![Dashboard](screenshots/dashboard.png)
![Items Management](screenshots/items.png)
![Analytics](screenshots/analytics.png)

## 🤝 Contributing

This is an academic project. For educational purposes only.

## 📄 License

Educational Project - Advanced Database Management System Coursework

## 👥 Author

Pasindu Induwara  
University Coursework - 2026

---

**⭐ Star this repo if you find it helpful!**
