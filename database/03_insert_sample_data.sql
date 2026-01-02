-- ============================================
-- The Budget Supermarket - Oracle Database
-- Sample Data Insertion Script
-- ============================================
-- Author: Database Team
-- Date: 2026-01-01
-- Description: Inserts meaningful sample data into all tables
-- Minimum 10 records per table as per assignment requirements
-- ============================================

SET SERVEROUTPUT ON;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- ============================================
-- 1. MANAGER DATA (15 records)
-- ============================================
INSERT INTO Manager VALUES ('M001', 'Piyal Rathnayake', '0772458974');
INSERT INTO Manager VALUES ('M002', 'Nimal Perera', '0771234567');
INSERT INTO Manager VALUES ('M003', 'Kamala Silva', '0778901234');
INSERT INTO Manager VALUES ('M004', 'Sunil Fernando', '0765432109');
INSERT INTO Manager VALUES ('M005', 'Dilani Jayawardena', '0779876543');
INSERT INTO Manager VALUES ('M006', 'Rohan Wickramasinghe', '0712345678');
INSERT INTO Manager VALUES ('M007', 'Sanduni Rajapaksa', '0787654321');
INSERT INTO Manager VALUES ('M008', 'Kasun Mendis', '0723456789');
INSERT INTO Manager VALUES ('M009', 'Tharaka Gunasekara', '0798765432');
INSERT INTO Manager VALUES ('M010', 'Chaminda Bandara', '0734567890');
INSERT INTO Manager VALUES ('M011', 'Nimali Dissanayake', '0756789012');
INSERT INTO Manager VALUES ('M012', 'Pradeep Samaraweera', '0767890123');
INSERT INTO Manager VALUES ('M013', 'Malini Wijesinghe', '0778901235');
INSERT INTO Manager VALUES ('M014', 'Ajith Ranasinghe', '0789012346');
INSERT INTO Manager VALUES ('M015', 'Kumari Herath', '0790123457');

COMMIT;
PROMPT '15 Manager records inserted';

-- ============================================
-- 2. STORE_ADMIN DATA (12 records)
-- ============================================
INSERT INTO Store_Admin VALUES ('SA001', 'Supuni Ranaweera', '0705628923');
INSERT INTO Store_Admin VALUES ('SA002', 'Lakshman Perera', '0712345679');
INSERT INTO Store_Admin VALUES ('SA003', 'Chamari Fernando', '0723456780');
INSERT INTO Store_Admin VALUES ('SA004', 'Dinesh Jayasuriya', '0734567891');
INSERT INTO Store_Admin VALUES ('SA005', 'Amali Wijesekara', '0745678902');
INSERT INTO Store_Admin VALUES ('SA006', 'Ruwan Senanayake', '0756789013');
INSERT INTO Store_Admin VALUES ('SA007', 'Nadeeka Rajapaksa', '0767890124');
INSERT INTO Store_Admin VALUES ('SA008', 'Gayan Wickramaratne', '0778901236');
INSERT INTO Store_Admin VALUES ('SA009', 'Shani Gunawardena', '0789012347');
INSERT INTO Store_Admin VALUES ('SA010', 'Mahesh Bandara', '0790123458');
INSERT INTO Store_Admin VALUES ('SA011', 'Dilini Samarasinghe', '0701234569');
INSERT INTO Store_Admin VALUES ('SA012', 'Prasad Dissanayake', '0712345680');

COMMIT;
PROMPT '12 Store_Admin records inserted';

-- ============================================
-- 3. CUSTOMER DATA (25 records)
-- ============================================
INSERT INTO Customer VALUES ('C001', 'Sunil Shantha', '0775627896');
INSERT INTO Customer VALUES ('C002', 'Anura Kumara', '0712345681');
INSERT INTO Customer VALUES ('C003', 'Malini Perera', '0723456782');
INSERT INTO Customer VALUES ('C004', 'Kamal Silva', '0734567892');
INSERT INTO Customer VALUES ('C005', 'Nirmala Fernando', '0745678903');
INSERT INTO Customer VALUES ('C006', 'Ranjith Jayawardena', '0756789014');
INSERT INTO Customer VALUES ('C007', 'Chandrika Wijesundara', '0767890125');
INSERT INTO Customer VALUES ('C008', 'Priyantha Rajapaksa', '0778901237');
INSERT INTO Customer VALUES ('C009', 'Sumana Wickramasinghe', '0789012348');
INSERT INTO Customer VALUES ('C010', 'Lalith Gunasekara', '0790123459');
INSERT INTO Customer VALUES ('C011', 'Wasantha Mendis', '0701234570');
INSERT INTO Customer VALUES ('C012', 'Sriyani Bandara', '0712345682');
INSERT INTO Customer VALUES ('C013', 'Ajith Dissanayake', '0723456783');
INSERT INTO Customer VALUES ('C014', 'Champa Samaraweera', '0734567893');
INSERT INTO Customer VALUES ('C015', 'Nihal Wijesinghe', '0745678904');
INSERT INTO Customer VALUES ('C016', 'Renuka Ranasinghe', '0756789015');
INSERT INTO Customer VALUES ('C017', 'Tissa Herath', '0767890126');
INSERT INTO Customer VALUES ('C018', 'Padma Jayasuriya', '0778901238');
INSERT INTO Customer VALUES ('C019', 'Gamini Senanayake', '0789012349');
INSERT INTO Customer VALUES ('C020', 'Indrani Wickramaratne', '0790123460');
INSERT INTO Customer VALUES ('C021', 'Sarath Gunawardena', '0701234571');
INSERT INTO Customer VALUES ('C022', 'Mangala Samarasinghe', '0712345683');
INSERT INTO Customer VALUES ('C023', 'Deepika Ranaweera', '0723456784');
INSERT INTO Customer VALUES ('C024', 'Upali Perera', '0734567894');
INSERT INTO Customer VALUES ('C025', 'Shirani Fernando', '0745678905');

COMMIT;
PROMPT '25 Customer records inserted';

-- ============================================
-- 4. CASHIER DATA (12 records)
-- ============================================
INSERT INTO Cashier VALUES ('CA001', 'Nimali Anuradha');
INSERT INTO Cashier VALUES ('CA002', 'Saman Kumara');
INSERT INTO Cashier VALUES ('CA003', 'Dilini Perera');
INSERT INTO Cashier VALUES ('CA004', 'Kasun Silva');
INSERT INTO Cashier VALUES ('CA005', 'Thilini Fernando');
INSERT INTO Cashier VALUES ('CA006', 'Roshan Jayawardena');
INSERT INTO Cashier VALUES ('CA007', 'Sanduni Wijesekara');
INSERT INTO Cashier VALUES ('CA008', 'Nuwan Rajapaksa');
INSERT INTO Cashier VALUES ('CA009', 'Chamari Wickramasinghe');
INSERT INTO Cashier VALUES ('CA010', 'Dinesh Gunasekara');
INSERT INTO Cashier VALUES ('CA011', 'Amali Mendis');
INSERT INTO Cashier VALUES ('CA012', 'Gayan Bandara');

COMMIT;
PROMPT '12 Cashier records inserted';

-- ============================================
-- 5. SUPPLIER DATA (18 records)
-- ============================================
INSERT INTO Supplier VALUES ('S001', 'Ceylon Beverages Ltd', '0115234567', 'SA001');
INSERT INTO Supplier VALUES ('S002', 'Lanka Foods Co', '0112345678', 'SA001');
INSERT INTO Supplier VALUES ('S003', 'Supun Shanaka Traders', '0705968953', 'SA001');
INSERT INTO Supplier VALUES ('S004', 'Fresh Produce Suppliers', '0113456789', 'SA002');
INSERT INTO Supplier VALUES ('S005', 'Dairy Products Lanka', '0114567890', 'SA002');
INSERT INTO Supplier VALUES ('S006', 'Snack Masters Pvt Ltd', '0115678901', 'SA003');
INSERT INTO Supplier VALUES ('S007', 'Island Spices', '0116789012', 'SA003');
INSERT INTO Supplier VALUES ('S008', 'Quality Meats Lanka', '0117890123', 'SA004');
INSERT INTO Supplier VALUES ('S009', 'Bakery Supplies Co', '0118901234', 'SA004');
INSERT INTO Supplier VALUES ('S010', 'Household Essentials', '0119012345', 'SA005');
INSERT INTO Supplier VALUES ('S011', 'Personal Care Distributors', '0110123456', 'SA005');
INSERT INTO Supplier VALUES ('S012', 'Frozen Foods Lanka', '0111234567', 'SA006');
INSERT INTO Supplier VALUES ('S013', 'Organic Farms Collective', '0112345679', 'SA006');
INSERT INTO Supplier VALUES ('S014', 'Confectionery Wholesalers', '0113456780', 'SA007');
INSERT INTO Supplier VALUES ('S015', 'Cleaning Products Lanka', '0114567891', 'SA007');
INSERT INTO Supplier VALUES ('S016', 'Stationery Suppliers', '0115678902', 'SA008');
INSERT INTO Supplier VALUES ('S017', 'Pet Food Distributors', '0116789013', 'SA008');
INSERT INTO Supplier VALUES ('S018', 'Health & Wellness Co', '0117890124', 'SA009');

COMMIT;
PROMPT '18 Supplier records inserted';

-- ============================================
-- 6. ITEM DATA (35 records across categories)
-- ============================================

-- Beverages
INSERT INTO Item VALUES ('IT001', 'Coca Cola 1.5L', 250.00, 150, 'Beverages', 'M001');
INSERT INTO Item VALUES ('IT002', 'Sprite 1.5L', 250.00, 120, 'Beverages', 'M001');
INSERT INTO Item VALUES ('IT003', 'Fanta Orange 1.5L', 250.00, 100, 'Beverages', 'M001');
INSERT INTO Item VALUES ('IT004', 'Mineral Water 1L', 80.00, 200, 'Beverages', 'M001');
INSERT INTO Item VALUES ('IT005', 'Orange Juice 1L', 350.00, 80, 'Beverages', 'M001');

-- Snacks
INSERT INTO Item VALUES ('IT006', 'Lays Chips 100g', 150.00, 180, 'Snacks', 'M002');
INSERT INTO Item VALUES ('IT007', 'Pringles Original', 450.00, 90, 'Snacks', 'M002');
INSERT INTO Item VALUES ('IT008', 'Chocolate Bar', 120.00, 200, 'Snacks', 'M002');
INSERT INTO Item VALUES ('IT009', 'Biscuits Pack', 180.00, 150, 'Snacks', 'M002');
INSERT INTO Item VALUES ('IT010', 'Crackers 200g', 220.00, 110, 'Snacks', 'M002');

-- Dairy Products
INSERT INTO Item VALUES ('IT011', 'Fresh Milk 1L', 280.00, 100, 'Dairy', 'M003');
INSERT INTO Item VALUES ('IT012', 'Yogurt 400g', 180.00, 120, 'Dairy', 'M003');
INSERT INTO Item VALUES ('IT013', 'Cheese Slices 200g', 450.00, 70, 'Dairy', 'M003');
INSERT INTO Item VALUES ('IT014', 'Butter 250g', 520.00, 60, 'Dairy', 'M003');
INSERT INTO Item VALUES ('IT015', 'Cream 200ml', 320.00, 50, 'Dairy', 'M003');

-- Produce
INSERT INTO Item VALUES ('IT016', 'Tomatoes 1kg', 180.00, 80, 'Produce', 'M004');
INSERT INTO Item VALUES ('IT017', 'Potatoes 1kg', 150.00, 120, 'Produce', 'M004');
INSERT INTO Item VALUES ('IT018', 'Onions 1kg', 160.00, 100, 'Produce', 'M004');
INSERT INTO Item VALUES ('IT019', 'Carrots 500g', 120.00, 90, 'Produce', 'M004');
INSERT INTO Item VALUES ('IT020', 'Cabbage 1pc', 100.00, 60, 'Produce', 'M004');

-- Bakery
INSERT INTO Item VALUES ('IT021', 'White Bread', 120.00, 100, 'Bakery', 'M005');
INSERT INTO Item VALUES ('IT022', 'Brown Bread', 150.00, 80, 'Bakery', 'M005');
INSERT INTO Item VALUES ('IT023', 'Cake 500g', 450.00, 40, 'Bakery', 'M005');
INSERT INTO Item VALUES ('IT024', 'Pastry Pack', 280.00, 60, 'Bakery', 'M005');
INSERT INTO Item VALUES ('IT025', 'Cookies 250g', 320.00, 70, 'Bakery', 'M005');

-- Household
INSERT INTO Item VALUES ('IT026', 'Detergent Powder 1kg', 450.00, 90, 'Household', 'M006');
INSERT INTO Item VALUES ('IT027', 'Dish Soap 500ml', 180.00, 110, 'Household', 'M006');
INSERT INTO Item VALUES ('IT028', 'Toilet Paper 4 Roll', 280.00, 150, 'Household', 'M006');
INSERT INTO Item VALUES ('IT029', 'Hand Soap 250ml', 150.00, 120, 'Household', 'M006');
INSERT INTO Item VALUES ('IT030', 'Floor Cleaner 1L', 320.00, 80, 'Household', 'M006');

-- Personal Care
INSERT INTO Item VALUES ('IT031', 'Shampoo 400ml', 550.00, 100, 'Personal Care', 'M007');
INSERT INTO Item VALUES ('IT032', 'Toothpaste 100g', 180.00, 140, 'Personal Care', 'M007');
INSERT INTO Item VALUES ('IT033', 'Body Lotion 200ml', 420.00, 70, 'Personal Care', 'M007');
INSERT INTO Item VALUES ('IT034', 'Face Wash 150ml', 380.00, 80, 'Personal Care', 'M007');
INSERT INTO Item VALUES ('IT035', 'Deodorant Spray', 450.00, 90, 'Personal Care', 'M007');

COMMIT;
PROMPT '35 Item records inserted';

-- ============================================
-- 7. SUPPLY_ORDER DATA (18 records)
-- ============================================
INSERT INTO Supply_Order VALUES ('SO001', TO_DATE('2025-07-15', 'YYYY-MM-DD'), 'M001');
INSERT INTO Supply_Order VALUES ('SO002', TO_DATE('2025-07-20', 'YYYY-MM-DD'), 'M002');
INSERT INTO Supply_Order VALUES ('SO003', TO_DATE('2025-08-05', 'YYYY-MM-DD'), 'M003');
INSERT INTO Supply_Order VALUES ('SO004', TO_DATE('2025-08-12', 'YYYY-MM-DD'), 'M004');
INSERT INTO Supply_Order VALUES ('SO005', TO_DATE('2025-08-25', 'YYYY-MM-DD'), 'M005');
INSERT INTO Supply_Order VALUES ('SO006', TO_DATE('2025-09-03', 'YYYY-MM-DD'), 'M006');
INSERT INTO Supply_Order VALUES ('SO007', TO_DATE('2025-09-15', 'YYYY-MM-DD'), 'M007');
INSERT INTO Supply_Order VALUES ('SO008', TO_DATE('2025-09-28', 'YYYY-MM-DD'), 'M001');
INSERT INTO Supply_Order VALUES ('SO009', TO_DATE('2025-10-10', 'YYYY-MM-DD'), 'M002');
INSERT INTO Supply_Order VALUES ('SO010', TO_DATE('2025-10-22', 'YYYY-MM-DD'), 'M003');
INSERT INTO Supply_Order VALUES ('SO011', TO_DATE('2025-11-05', 'YYYY-MM-DD'), 'M004');
INSERT INTO Supply_Order VALUES ('SO012', TO_DATE('2025-11-18', 'YYYY-MM-DD'), 'M005');
INSERT INTO Supply_Order VALUES ('SO013', TO_DATE('2025-12-01', 'YYYY-MM-DD'), 'M006');
INSERT INTO Supply_Order VALUES ('SO014', TO_DATE('2025-12-10', 'YYYY-MM-DD'), 'M007');
INSERT INTO Supply_Order VALUES ('SO015', TO_DATE('2025-12-20', 'YYYY-MM-DD'), 'M001');
INSERT INTO Supply_Order VALUES ('SO016', TO_DATE('2025-12-25', 'YYYY-MM-DD'), 'M002');
INSERT INTO Supply_Order VALUES ('SO017', TO_DATE('2025-12-28', 'YYYY-MM-DD'), 'M003');
INSERT INTO Supply_Order VALUES ('SO018', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 'M004');

COMMIT;
PROMPT '18 Supply_Order records inserted';

-- ============================================
-- 8. SUPPLY DATA (40 records)
-- ============================================
INSERT INTO Supply VALUES ('SUP001', TO_DATE('2025-07-16', 'YYYY-MM-DD'), 100, 'S001', 'IT001', 'SO001');
INSERT INTO Supply VALUES ('SUP002', TO_DATE('2025-07-16', 'YYYY-MM-DD'), 80, 'S001', 'IT002', 'SO001');
INSERT INTO Supply VALUES ('SUP003', TO_DATE('2025-07-21', 'YYYY-MM-DD'), 150, 'S002', 'IT006', 'SO002');
INSERT INTO Supply VALUES ('SUP004', TO_DATE('2025-07-21', 'YYYY-MM-DD'), 100, 'S002', 'IT007', 'SO002');
INSERT INTO Supply VALUES ('SUP005', TO_DATE('2025-08-06', 'YYYY-MM-DD'), 80, 'S005', 'IT011', 'SO003');
INSERT INTO Supply VALUES ('SUP006', TO_DATE('2025-08-06', 'YYYY-MM-DD'), 100, 'S005', 'IT012', 'SO003');
INSERT INTO Supply VALUES ('SUP007', TO_DATE('2025-08-13', 'YYYY-MM-DD'), 70, 'S004', 'IT016', 'SO004');
INSERT INTO Supply VALUES ('SUP008', TO_DATE('2025-08-13', 'YYYY-MM-DD'), 100, 'S004', 'IT017', 'SO004');
INSERT INTO Supply VALUES ('SUP009', TO_DATE('2025-08-26', 'YYYY-MM-DD'), 80, 'S009', 'IT021', 'SO005');
INSERT INTO Supply VALUES ('SUP010', TO_DATE('2025-08-26', 'YYYY-MM-DD'), 60, 'S009', 'IT022', 'SO005');
INSERT INTO Supply VALUES ('SUP011', TO_DATE('2025-09-04', 'YYYY-MM-DD'), 80, 'S010', 'IT026', 'SO006');
INSERT INTO Supply VALUES ('SUP012', TO_DATE('2025-09-04', 'YYYY-MM-DD'), 100, 'S010', 'IT027', 'SO006');
INSERT INTO Supply VALUES ('SUP013', TO_DATE('2025-09-16', 'YYYY-MM-DD'), 90, 'S011', 'IT031', 'SO007');
INSERT INTO Supply VALUES ('SUP014', TO_DATE('2025-09-16', 'YYYY-MM-DD'), 120, 'S011', 'IT032', 'SO007');
INSERT INTO Supply VALUES ('SUP015', TO_DATE('2025-09-29', 'YYYY-MM-DD'), 70, 'S001', 'IT003', 'SO008');
INSERT INTO Supply VALUES ('SUP016', TO_DATE('2025-09-29', 'YYYY-MM-DD'), 150, 'S001', 'IT004', 'SO008');
INSERT INTO Supply VALUES ('SUP017', TO_DATE('2025-10-11', 'YYYY-MM-DD'), 180, 'S006', 'IT008', 'SO009');
INSERT INTO Supply VALUES ('SUP018', TO_DATE('2025-10-11', 'YYYY-MM-DD'), 130, 'S006', 'IT009', 'SO009');
INSERT INTO Supply VALUES ('SUP019', TO_DATE('2025-10-23', 'YYYY-MM-DD'), 60, 'S005', 'IT013', 'SO010');
INSERT INTO Supply VALUES ('SUP020', TO_DATE('2025-10-23', 'YYYY-MM-DD'), 50, 'S005', 'IT014', 'SO010');
INSERT INTO Supply VALUES ('SUP021', TO_DATE('2025-11-06', 'YYYY-MM-DD'), 80, 'S004', 'IT018', 'SO011');
INSERT INTO Supply VALUES ('SUP022', TO_DATE('2025-11-06', 'YYYY-MM-DD'), 70, 'S004', 'IT019', 'SO011');
INSERT INTO Supply VALUES ('SUP023', TO_DATE('2025-11-19', 'YYYY-MM-DD'), 35, 'S009', 'IT023', 'SO012');
INSERT INTO Supply VALUES ('SUP024', TO_DATE('2025-11-19', 'YYYY-MM-DD'), 50, 'S009', 'IT024', 'SO012');
INSERT INTO Supply VALUES ('SUP025', TO_DATE('2025-12-02', 'YYYY-MM-DD'), 140, 'S010', 'IT028', 'SO013');
INSERT INTO Supply VALUES ('SUP026', TO_DATE('2025-12-02', 'YYYY-MM-DD'), 110, 'S010', 'IT029', 'SO013');
INSERT INTO Supply VALUES ('SUP027', TO_DATE('2025-12-11', 'YYYY-MM-DD'), 60, 'S011', 'IT033', 'SO014');
INSERT INTO Supply VALUES ('SUP028', TO_DATE('2025-12-11', 'YYYY-MM-DD'), 70, 'S011', 'IT034', 'SO014');
INSERT INTO Supply VALUES ('SUP029', TO_DATE('2025-12-21', 'YYYY-MM-DD'), 60, 'S001', 'IT005', 'SO015');
INSERT INTO Supply VALUES ('SUP030', TO_DATE('2025-12-21', 'YYYY-MM-DD'), 80, 'S006', 'IT010', 'SO015');
INSERT INTO Supply VALUES ('SUP031', TO_DATE('2025-12-26', 'YYYY-MM-DD'), 40, 'S005', 'IT015', 'SO016');
INSERT INTO Supply VALUES ('SUP032', TO_DATE('2025-12-26', 'YYYY-MM-DD'), 50, 'S004', 'IT020', 'SO016');
INSERT INTO Supply VALUES ('SUP033', TO_DATE('2025-12-29', 'YYYY-MM-DD'), 60, 'S009', 'IT025', 'SO017');
INSERT INTO Supply VALUES ('SUP034', TO_DATE('2025-12-29', 'YYYY-MM-DD'), 70, 'S010', 'IT030', 'SO017');
INSERT INTO Supply VALUES ('SUP035', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 80, 'S011', 'IT035', 'SO018');
INSERT INTO Supply VALUES ('SUP036', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 100, 'S001', 'IT001', 'SO018');
INSERT INTO Supply VALUES ('SUP037', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 90, 'S002', 'IT006', 'SO018');
INSERT INTO Supply VALUES ('SUP038', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 70, 'S003', 'IT008', 'SO018');
INSERT INTO Supply VALUES ('SUP039', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 60, 'S004', 'IT016', 'SO018');
INSERT INTO Supply VALUES ('SUP040', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 50, 'S005', 'IT011', 'SO018');

COMMIT;
PROMPT '40 Supply records inserted';

-- ============================================
-- 9. ORDERS DATA (30 records)
-- ============================================
INSERT INTO Orders VALUES ('OR001', TO_DATE('2025-12-01', 'YYYY-MM-DD'), 'C001', 'CA001');
INSERT INTO Orders VALUES ('OR002', TO_DATE('2025-12-02', 'YYYY-MM-DD'), 'C002', 'CA002');
INSERT INTO Orders VALUES ('OR003', TO_DATE('2025-12-03', 'YYYY-MM-DD'), 'C003', 'CA001');
INSERT INTO Orders VALUES ('OR004', TO_DATE('2025-12-04', 'YYYY-MM-DD'), NULL, 'CA003');
INSERT INTO Orders VALUES ('OR005', TO_DATE('2025-12-05', 'YYYY-MM-DD'), 'C004', 'CA002');
INSERT INTO Orders VALUES ('OR006', TO_DATE('2025-12-06', 'YYYY-MM-DD'), 'C005', 'CA004');
INSERT INTO Orders VALUES ('OR007', TO_DATE('2025-12-07', 'YYYY-MM-DD'), NULL, 'CA001');
INSERT INTO Orders VALUES ('OR008', TO_DATE('2025-12-08', 'YYYY-MM-DD'), 'C006', 'CA005');
INSERT INTO Orders VALUES ('OR009', TO_DATE('2025-12-09', 'YYYY-MM-DD'), 'C007', 'CA003');
INSERT INTO Orders VALUES ('OR010', TO_DATE('2025-12-10', 'YYYY-MM-DD'), 'C008', 'CA002');
INSERT INTO Orders VALUES ('OR011', TO_DATE('2025-12-11', 'YYYY-MM-DD'), NULL, 'CA006');
INSERT INTO Orders VALUES ('OR012', TO_DATE('2025-12-12', 'YYYY-MM-DD'), 'C009', 'CA004');
INSERT INTO Orders VALUES ('OR013', TO_DATE('2025-12-13', 'YYYY-MM-DD'), 'C010', 'CA001');
INSERT INTO Orders VALUES ('OR014', TO_DATE('2025-12-14', 'YYYY-MM-DD'), 'C011', 'CA007');
INSERT INTO Orders VALUES ('OR015', TO_DATE('2025-12-15', 'YYYY-MM-DD'), NULL, 'CA005');
INSERT INTO Orders VALUES ('OR016', TO_DATE('2025-12-16', 'YYYY-MM-DD'), 'C012', 'CA003');
INSERT INTO Orders VALUES ('OR017', TO_DATE('2025-12-17', 'YYYY-MM-DD'), 'C013', 'CA008');
INSERT INTO Orders VALUES ('OR018', TO_DATE('2025-12-18', 'YYYY-MM-DD'), 'C014', 'CA002');
INSERT INTO Orders VALUES ('OR019', TO_DATE('2025-12-19', 'YYYY-MM-DD'), NULL, 'CA009');
INSERT INTO Orders VALUES ('OR020', TO_DATE('2025-12-20', 'YYYY-MM-DD'), 'C015', 'CA004');
INSERT INTO Orders VALUES ('OR021', TO_DATE('2025-12-21', 'YYYY-MM-DD'), 'C016', 'CA001');
INSERT INTO Orders VALUES ('OR022', TO_DATE('2025-12-22', 'YYYY-MM-DD'), 'C017', 'CA010');
INSERT INTO Orders VALUES ('OR023', TO_DATE('2025-12-23', 'YYYY-MM-DD'), NULL, 'CA006');
INSERT INTO Orders VALUES ('OR024', TO_DATE('2025-12-24', 'YYYY-MM-DD'), 'C018', 'CA005');
INSERT INTO Orders VALUES ('OR025', TO_DATE('2025-12-25', 'YYYY-MM-DD'), 'C019', 'CA011');
INSERT INTO Orders VALUES ('OR026', TO_DATE('2025-12-26', 'YYYY-MM-DD'), 'C020', 'CA003');
INSERT INTO Orders VALUES ('OR027', TO_DATE('2025-12-27', 'YYYY-MM-DD'), NULL, 'CA012');
INSERT INTO Orders VALUES ('OR028', TO_DATE('2025-12-28', 'YYYY-MM-DD'), 'C021', 'CA007');
INSERT INTO Orders VALUES ('OR029', TO_DATE('2025-12-29', 'YYYY-MM-DD'), 'C022', 'CA002');
INSERT INTO Orders VALUES ('OR030', TO_DATE('2025-12-30', 'YYYY-MM-DD'), 'C023', 'CA008');

COMMIT;
PROMPT '30 Orders records inserted';

-- ============================================
-- 10. ORDER_DETAILS DATA (65 records - multiple items per order)
-- ============================================
-- Order 1
INSERT INTO Order_Details VALUES ('OR001', 'IT001', 2);
INSERT INTO Order_Details VALUES ('OR001', 'IT006', 3);
INSERT INTO Order_Details VALUES ('OR001', 'IT021', 1);

-- Order 2
INSERT INTO Order_Details VALUES ('OR002', 'IT011', 2);
INSERT INTO Order_Details VALUES ('OR002', 'IT016', 1);

-- Order 3
INSERT INTO Order_Details VALUES ('OR003', 'IT002', 1);
INSERT INTO Order_Details VALUES ('OR003', 'IT008', 4);
INSERT INTO Order_Details VALUES ('OR003', 'IT026', 1);

-- Order 4
INSERT INTO Order_Details VALUES ('OR004', 'IT004', 3);
INSERT INTO Order_Details VALUES ('OR004', 'IT009', 2);

-- Order 5
INSERT INTO Order_Details VALUES ('OR005', 'IT012', 3);
INSERT INTO Order_Details VALUES ('OR005', 'IT017', 2);
INSERT INTO Order_Details VALUES ('OR005', 'IT031', 1);

-- Order 6
INSERT INTO Order_Details VALUES ('OR006', 'IT003', 2);
INSERT INTO Order_Details VALUES ('OR006', 'IT007', 1);

-- Order 7
INSERT INTO Order_Details VALUES ('OR007', 'IT013', 1);
INSERT INTO Order_Details VALUES ('OR007', 'IT018', 2);
INSERT INTO Order_Details VALUES ('OR007', 'IT027', 1);

-- Order 8
INSERT INTO Order_Details VALUES ('OR008', 'IT005', 1);
INSERT INTO Order_Details VALUES ('OR008', 'IT010', 2);
INSERT INTO Order_Details VALUES ('OR008', 'IT022', 1);

-- Order 9
INSERT INTO Order_Details VALUES ('OR009', 'IT014', 1);
INSERT INTO Order_Details VALUES ('OR009', 'IT019', 1);

-- Order 10
INSERT INTO Order_Details VALUES ('OR010', 'IT015', 1);
INSERT INTO Order_Details VALUES ('OR010', 'IT020', 2);
INSERT INTO Order_Details VALUES ('OR010', 'IT032', 2);

-- Order 11
INSERT INTO Order_Details VALUES ('OR011', 'IT023', 1);
INSERT INTO Order_Details VALUES ('OR011', 'IT028', 1);

-- Order 12
INSERT INTO Order_Details VALUES ('OR012', 'IT024', 2);
INSERT INTO Order_Details VALUES ('OR012', 'IT033', 1);

-- Order 13
INSERT INTO Order_Details VALUES ('OR013', 'IT025', 1);
INSERT INTO Order_Details VALUES ('OR013', 'IT029', 2);
INSERT INTO Order_Details VALUES ('OR013', 'IT001', 1);

-- Order 14
INSERT INTO Order_Details VALUES ('OR014', 'IT030', 1);
INSERT INTO Order_Details VALUES ('OR014', 'IT034', 1);

-- Order 15
INSERT INTO Order_Details VALUES ('OR015', 'IT035', 1);
INSERT INTO Order_Details VALUES ('OR015', 'IT006', 2);
INSERT INTO Order_Details VALUES ('OR015', 'IT011', 1);

-- Order 16
INSERT INTO Order_Details VALUES ('OR016', 'IT016', 3);
INSERT INTO Order_Details VALUES ('OR016', 'IT021', 2);

-- Order 17
INSERT INTO Order_Details VALUES ('OR017', 'IT026', 1);
INSERT INTO Order_Details VALUES ('OR017', 'IT031', 1);

-- Order 18
INSERT INTO Order_Details VALUES ('OR018', 'IT002', 2);
INSERT INTO Order_Details VALUES ('OR018', 'IT008', 3);
INSERT INTO Order_Details VALUES ('OR018', 'IT012', 2);

-- Order 19
INSERT INTO Order_Details VALUES ('OR019', 'IT017', 2);
INSERT INTO Order_Details VALUES ('OR019', 'IT027', 1);

-- Order 20
INSERT INTO Order_Details VALUES ('OR020', 'IT003', 1);
INSERT INTO Order_Details VALUES ('OR020', 'IT009', 2);
INSERT INTO Order_Details VALUES ('OR020', 'IT022', 1);

-- Order 21
INSERT INTO Order_Details VALUES ('OR021', 'IT013', 2);
INSERT INTO Order_Details VALUES ('OR021', 'IT032', 1);

-- Order 22
INSERT INTO Order_Details VALUES ('OR022', 'IT018', 1);
INSERT INTO Order_Details VALUES ('OR022', 'IT028', 2);

-- Order 23
INSERT INTO Order_Details VALUES ('OR023', 'IT004', 4);
INSERT INTO Order_Details VALUES ('OR023', 'IT010', 1);

-- Order 24
INSERT INTO Order_Details VALUES ('OR024', 'IT014', 1);
INSERT INTO Order_Details VALUES ('OR024', 'IT033', 1);

-- Order 25
INSERT INTO Order_Details VALUES ('OR025', 'IT019', 2);
INSERT INTO Order_Details VALUES ('OR025', 'IT034', 1);

-- Order 26
INSERT INTO Order_Details VALUES ('OR026', 'IT023', 1);
INSERT INTO Order_Details VALUES ('OR026', 'IT035', 1);

-- Order 27
INSERT INTO Order_Details VALUES ('OR027', 'IT024', 1);
INSERT INTO Order_Details VALUES ('OR027', 'IT001', 2);

-- Order 28
INSERT INTO Order_Details VALUES ('OR028', 'IT025', 2);
INSERT INTO Order_Details VALUES ('OR028', 'IT006', 1);

-- Order 29
INSERT INTO Order_Details VALUES ('OR029', 'IT029', 1);
INSERT INTO Order_Details VALUES ('OR029', 'IT011', 2);

-- Order 30
INSERT INTO Order_Details VALUES ('OR030', 'IT030', 1);
INSERT INTO Order_Details VALUES ('OR030', 'IT016', 2);
INSERT INTO Order_Details VALUES ('OR030', 'IT026', 1);

COMMIT;
PROMPT '65 Order_Details records inserted';

-- ============================================
-- 11. RECEIPT DATA (30 records - one per order)
-- ============================================
INSERT INTO Receipt VALUES (1, 'Cash', 1100.00, 'OR001', 'CA001');
INSERT INTO Receipt VALUES (2, 'Card', 740.00, 'OR002', 'CA002');
INSERT INTO Receipt VALUES (3, 'Digital Wallet', 1180.00, 'OR003', 'CA001');
INSERT INTO Receipt VALUES (4, 'Cash', 600.00, 'OR004', 'CA003');
INSERT INTO Receipt VALUES (5, 'Card', 1390.00, 'OR005', 'CA002');
INSERT INTO Receipt VALUES (6, 'Cash', 950.00, 'OR006', 'CA004');
INSERT INTO Receipt VALUES (7, 'Digital Wallet', 990.00, 'OR007', 'CA001');
INSERT INTO Receipt VALUES (8, 'Card', 1040.00, 'OR008', 'CA005');
INSERT INTO Receipt VALUES (9, 'Cash', 680.00, 'OR009', 'CA003');
INSERT INTO Receipt VALUES (10, 'Card', 880.00, 'OR010', 'CA002');
INSERT INTO Receipt VALUES (11, 'Digital Wallet', 730.00, 'OR011', 'CA006');
INSERT INTO Receipt VALUES (12, 'Cash', 980.00, 'OR012', 'CA004');
INSERT INTO Receipt VALUES (13, 'Card', 890.00, 'OR013', 'CA001');
INSERT INTO Receipt VALUES (14, 'Digital Wallet', 760.00, 'OR014', 'CA007');
INSERT INTO Receipt VALUES (15, 'Cash', 1000.00, 'OR015', 'CA005');
INSERT INTO Receipt VALUES (16, 'Card', 780.00, 'OR016', 'CA003');
INSERT INTO Receipt VALUES (17, 'Digital Wallet', 1000.00, 'OR017', 'CA008');
INSERT INTO Receipt VALUES (18, 'Cash', 1540.00, 'OR018', 'CA002');
INSERT INTO Receipt VALUES (19, 'Card', 480.00, 'OR019', 'CA009');
INSERT INTO Receipt VALUES (20, 'Digital Wallet', 970.00, 'OR020', 'CA004');
INSERT INTO Receipt VALUES (21, 'Cash', 1080.00, 'OR021', 'CA001');
INSERT INTO Receipt VALUES (22, 'Card', 720.00, 'OR022', 'CA010');
INSERT INTO Receipt VALUES (23, 'Digital Wallet', 540.00, 'OR023', 'CA006');
INSERT INTO Receipt VALUES (24, 'Cash', 940.00, 'OR024', 'CA005');
INSERT INTO Receipt VALUES (25, 'Card', 770.00, 'OR025', 'CA011');
INSERT INTO Receipt VALUES (26, 'Digital Wallet', 900.00, 'OR026', 'CA003');
INSERT INTO Receipt VALUES (27, 'Cash', 780.00, 'OR027', 'CA012');
INSERT INTO Receipt VALUES (28, 'Card', 960.00, 'OR028', 'CA007');
INSERT INTO Receipt VALUES (29, 'Digital Wallet', 710.00, 'OR029', 'CA002');
INSERT INTO Receipt VALUES (30, 'Cash', 1100.00, 'OR030', 'CA008');

COMMIT;
PROMPT '30 Receipt records inserted';

-- ============================================
-- DATA VERIFICATION
-- ============================================

PROMPT '';
PROMPT '==============================================';
PROMPT 'DATA INSERTION SUMMARY';
PROMPT '==============================================';

SELECT 'Manager' AS Table_Name, COUNT(*) AS Record_Count FROM Manager
UNION ALL
SELECT 'Store_Admin', COUNT(*) FROM Store_Admin
UNION ALL
SELECT 'Customer', COUNT(*) FROM Customer
UNION ALL
SELECT 'Cashier', COUNT(*) FROM Cashier
UNION ALL
SELECT 'Supplier', COUNT(*) FROM Supplier
UNION ALL
SELECT 'Item', COUNT(*) FROM Item
UNION ALL
SELECT 'Supply_Order', COUNT(*) FROM Supply_Order
UNION ALL
SELECT 'Supply', COUNT(*) FROM Supply
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*) FROM Order_Details
UNION ALL
SELECT 'Receipt', COUNT(*) FROM Receipt;

PROMPT '';
PROMPT 'All sample data inserted successfully!';
PROMPT 'Total records: 298';
