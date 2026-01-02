# Budget Supermarket - Frontend

## Overview
Premium React TypeScript frontend for The Budget Supermarket management system.

## Features
- ✅ React 18 with TypeScript
- ✅ Vite for fast development
- ✅ React Router for navigation
- ✅ Axios for API communication
- ✅ Recharts for data visualization
- ✅ Premium UI/UX with glassmorphism
- ✅ Fully responsive design
- ✅ Dark mode interface

## Tech Stack
- **Framework:** React 18.2.0
- **Build Tool:** Vite 5.0.8
- **Language:** TypeScript 5.3.3
- **Routing:** React Router DOM 6.21.0
- **HTTP Client:** Axios 1.6.2
- **Charts:** Recharts 2.10.3
- **Icons:** React Icons 5.0.1

## Installation

### Prerequisites
- Node.js 18+ and npm
- Backend API running on http://localhost:8000

### Steps

1. **Install dependencies:**
```bash
cd "front end"
npm install
```

2. **Configure environment:**
```bash
# .env file is already configured
# Update if backend URL is different
```

3. **Run development server:**
```bash
npm run dev
```

The application will open at http://localhost:3000

## Project Structure
```
front end/
├── public/
├── src/
│   ├── pages/              # Page components
│   │   ├── Dashboard.tsx
│   │   ├── Items.tsx
│   │   ├── Customers.tsx
│   │   ├── Orders.tsx
│   │   └── Analytics.tsx
│   ├── services/           # API services
│   │   ├── api.ts
│   │   └── index.ts
│   ├── App.tsx             # Main app component
│   ├── App.css             # App-specific styles
│   ├── index.css           # Global styles & design system
│   └── main.tsx            # Entry point
├── package.json
├── tsconfig.json
├── vite.config.ts
└── README.md
```

## Design System

### Color Palette
- **Primary:** Deep blue gradient (#1e3a8a → #3b82f6)
- **Secondary:** Emerald green (#059669)
- **Accent:** Amber (#f59e0b)
- **Background:** Dark slate (#0f172a)

### Components
- **Cards:** Glassmorphism with backdrop blur
- **Buttons:** Gradient backgrounds with hover animations
- **Inputs:** Dark theme with focus states
- **Tables:** Responsive with hover effects
- **Badges:** Color-coded status indicators

### Typography
- **Font:** Inter (Google Fonts)
- **Sizes:** Responsive scale from 0.75rem to 2.25rem
- **Weights:** 300-800

## Pages

### Dashboard
- Real-time statistics cards
- Total items, customers, orders, sales
- Low stock alerts
- Quick action buttons

### Items
- Item list with filtering
- Category-based filtering
- Low stock indicators
- CRUD operations

### Customers
- Customer management
- Order history per customer
- Registration and updates

### Orders
- Order creation wizard
- Item selection
- Real-time total calculation
- Receipt generation

### Analytics
- Sales trend charts
- Customer segmentation (RFM)
- Market basket analysis
- Inventory insights
- Supplier performance

## API Integration

All API calls are handled through the service layer in `src/services/`:

```typescript
import { itemService, customerService, orderService, analyticsService } from './services';

// Example usage
const items = await itemService.getAll();
const stats = await analyticsService.getDashboardStats();
```

## Development

### Available Scripts

```bash
# Development server with hot reload
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

### Code Style
- Use TypeScript for type safety
- Follow React best practices
- Use functional components with hooks
- Implement proper error handling
- Add loading states for async operations

## Responsive Design

The application is fully responsive:
- **Desktop:** Full sidebar navigation
- **Tablet:** Compact sidebar
- **Mobile:** Collapsible sidebar

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Troubleshooting

### API Connection Issues
1. Ensure backend is running on http://localhost:8000
2. Check CORS settings in backend
3. Verify `.env` file configuration

### Build Issues
```bash
# Clear node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

## Future Enhancements
- [ ] Complete all page implementations
- [ ] Add authentication
- [ ] Implement real-time updates
- [ ] Add data export functionality
- [ ] Implement advanced filtering
- [ ] Add print receipt functionality

## License
Educational project for Advanced Database Management System coursework.
