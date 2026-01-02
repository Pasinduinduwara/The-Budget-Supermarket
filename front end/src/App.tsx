import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import { FiHome, FiPackage, FiUsers, FiShoppingCart, FiTrendingUp, FiTruck } from 'react-icons/fi';
import Dashboard from './pages/Dashboard';
import Items from './pages/Items';
import Customers from './pages/Customers';
import Orders from './pages/Orders';
import Analytics from './pages/Analytics';
import './App.css';

function App() {
    return (
        <Router>
            <div className="app">
                {/* Sidebar Navigation */}
                <aside className="sidebar">
                    <div className="sidebar-header">
                        <h1 className="logo">Budget Supermarket</h1>
                        <p className="logo-subtitle">Management System</p>
                    </div>

                    <nav className="sidebar-nav">
                        <Link to="/" className="nav-link">
                            <FiHome /> Dashboard
                        </Link>
                        <Link to="/items" className="nav-link">
                            <FiPackage /> Items
                        </Link>
                        <Link to="/customers" className="nav-link">
                            <FiUsers /> Customers
                        </Link>
                        <Link to="/orders" className="nav-link">
                            <FiShoppingCart /> Orders
                        </Link>
                        <Link to="/analytics" className="nav-link">
                            <FiTrendingUp /> Analytics
                        </Link>
                    </nav>
                </aside>

                {/* Main Content */}
                <main className="main-content">
                    <Routes>
                        <Route path="/" element={<Dashboard />} />
                        <Route path="/items" element={<Items />} />
                        <Route path="/customers" element={<Customers />} />
                        <Route path="/orders" element={<Orders />} />
                        <Route path="/analytics" element={<Analytics />} />
                    </Routes>
                </main>
            </div>
        </Router>
    );
}

export default App;
