import { useEffect, useState } from 'react';
import { FiPackage, FiUsers, FiShoppingCart, FiDollarSign, FiAlertTriangle, FiTruck } from 'react-icons/fi';
import { analyticsService } from '../services';

interface DashboardStats {
    total_items: number;
    total_customers: number;
    total_orders: number;
    total_sales: number;
    low_stock_count: number;
    total_suppliers: number;
}

function Dashboard() {
    const [stats, setStats] = useState<DashboardStats | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        loadStats();
    }, []);

    const loadStats = async () => {
        try {
            const data = await analyticsService.getDashboardStats();
            setStats(data);
        } catch (error) {
            console.error('Failed to load stats:', error);
        } finally {
            setLoading(false);
        }
    };

    if (loading) {
        return (
            <div style={{ display: 'flex', justifyContent: 'center', padding: '4rem' }}>
                <div className="spinner"></div>
            </div>
        );
    }

    return (
        <div className="fade-in">
            <div className="page-header">
                <h1 className="page-title">Dashboard</h1>
                <p className="page-subtitle">Welcome to Budget Supermarket Management System</p>
            </div>

            <div className="stats-grid">
                <div className="stat-card">
                    <div className="stat-header">
                        <div>
                            <p className="stat-label">Total Items</p>
                            <h2 className="stat-value">{stats?.total_items || 0}</h2>
                        </div>
                        <div className="stat-icon primary">
                            <FiPackage />
                        </div>
                    </div>
                </div>

                <div className="stat-card">
                    <div className="stat-header">
                        <div>
                            <p className="stat-label">Total Customers</p>
                            <h2 className="stat-value">{stats?.total_customers || 0}</h2>
                        </div>
                        <div className="stat-icon success">
                            <FiUsers />
                        </div>
                    </div>
                </div>

                <div className="stat-card">
                    <div className="stat-header">
                        <div>
                            <p className="stat-label">Total Orders</p>
                            <h2 className="stat-value">{stats?.total_orders || 0}</h2>
                        </div>
                        <div className="stat-icon primary">
                            <FiShoppingCart />
                        </div>
                    </div>
                </div>

                <div className="stat-card">
                    <div className="stat-header">
                        <div>
                            <p className="stat-label">Total Sales</p>
                            <h2 className="stat-value">Rs. {stats?.total_sales?.toLocaleString() || 0}</h2>
                        </div>
                        <div className="stat-icon success">
                            <FiDollarSign />
                        </div>
                    </div>
                </div>

                <div className="stat-card">
                    <div className="stat-header">
                        <div>
                            <p className="stat-label">Low Stock Items</p>
                            <h2 className="stat-value">{stats?.low_stock_count || 0}</h2>
                        </div>
                        <div className="stat-icon warning">
                            <FiAlertTriangle />
                        </div>
                    </div>
                </div>

                <div className="stat-card">
                    <div className="stat-header">
                        <div>
                            <p className="stat-label">Total Suppliers</p>
                            <h2 className="stat-value">{stats?.total_suppliers || 0}</h2>
                        </div>
                        <div className="stat-icon primary">
                            <FiTruck />
                        </div>
                    </div>
                </div>
            </div>

            <div className="card">
                <div className="card-header">
                    <h3 className="card-title">Quick Actions</h3>
                </div>
                <div style={{ display: 'flex', gap: '1rem', flexWrap: 'wrap' }}>
                    <button className="btn btn-primary">Create Order</button>
                    <button className="btn btn-secondary">Add Item</button>
                    <button className="btn btn-outline">Register Customer</button>
                </div>
            </div>
        </div>
    );
}

export default Dashboard;
