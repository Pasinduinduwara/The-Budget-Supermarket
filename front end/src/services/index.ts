import api from './api';

export interface Item {
    item_id: string;
    item_name: string;
    price: number;
    stock_qty: number;
    category: string;
    manager_id: string;
}

export const itemService = {
    getAll: async (category?: string, lowStockOnly?: boolean) => {
        const params = new URLSearchParams();
        if (category) params.append('category', category);
        if (lowStockOnly) params.append('low_stock_only', 'true');
        const response = await api.get(`/items?${params}`);
        return response.data;
    },

    getById: async (id: string) => {
        const response = await api.get(`/items/${id}`);
        return response.data;
    },

    create: async (item: Partial<Item>) => {
        const response = await api.post('/items', item);
        return response.data;
    },

    update: async (id: string, item: Partial<Item>) => {
        const response = await api.put(`/items/${id}`, item);
        return response.data;
    },

    delete: async (id: string) => {
        await api.delete(`/items/${id}`);
    },

    getCategories: async () => {
        const response = await api.get('/items/categories');
        return response.data;
    },

    getLowStock: async () => {
        const response = await api.get('/items/low-stock');
        return response.data;
    },
};

export const customerService = {
    getAll: async () => {
        const response = await api.get('/customers');
        return response.data;
    },

    getById: async (id: string) => {
        const response = await api.get(`/customers/${id}`);
        return response.data;
    },

    create: async (customer: any) => {
        const response = await api.post('/customers', customer);
        return response.data;
    },

    update: async (id: string, customer: any) => {
        const response = await api.put(`/customers/${id}`, customer);
        return response.data;
    },

    delete: async (id: string) => {
        await api.delete(`/customers/${id}`);
    },
};

export const orderService = {
    getAll: async () => {
        const response = await api.get('/orders');
        return response.data;
    },

    getById: async (id: string) => {
        const response = await api.get(`/orders/${id}`);
        return response.data;
    },

    create: async (order: any) => {
        const response = await api.post('/orders', order);
        return response.data;
    },

    complete: async (id: string, paymentMethod: string) => {
        const response = await api.post(`/orders/${id}/complete`, { payment_method: paymentMethod });
        return response.data;
    },
};

export const analyticsService = {
    getDashboardStats: async () => {
        const response = await api.get('/analytics/dashboard-stats');
        return response.data;
    },

    getSalesTrends: async (days: number = 30) => {
        const response = await api.get(`/analytics/sales-trends?days=${days}`);
        return response.data;
    },

    getTopProducts: async (limit: number = 10) => {
        const response = await api.get(`/analytics/top-products?limit=${limit}`);
        return response.data;
    },

    getCustomerSegmentation: async () => {
        const response = await api.get('/analytics/customer-segmentation');
        return response.data;
    },

    getMarketBasket: async (minSupport: number = 2) => {
        const response = await api.get(`/analytics/market-basket?min_support=${minSupport}`);
        return response.data;
    },

    getInventoryInsights: async () => {
        const response = await api.get('/analytics/inventory-insights');
        return response.data;
    },

    getSupplierPerformance: async () => {
        const response = await api.get('/analytics/supplier-performance');
        return response.data;
    },
};
