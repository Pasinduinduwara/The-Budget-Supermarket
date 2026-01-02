-- ============================================
-- The Budget Supermarket - Oracle Database
-- Additional Sample Data Insertion Script
-- ============================================
-- Author: Database Team
-- Date: 2026-01-01
-- Description: Adds more sample data to existing tables
-- Expands dataset for better testing and demonstration
-- ============================================

SET SERVEROUTPUT ON;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- ============================================
-- ADDITIONAL MANAGER DATA (10 more records)
-- ============================================
INSERT INTO Manager VALUES ('M016', 'Buddhika Wijeratne', '0701234567');
INSERT INTO Manager VALUES ('M017', 'Nilmini Karunaratne', '0712345689');
INSERT INTO Manager VALUES ('M018', 'Asanka Jayakody', '0723456790');
INSERT INTO Manager VALUES ('M019', 'Madhavi Seneviratne', '0734567801');
INSERT INTO Manager VALUES ('M020', 'Janaka Amarasinghe', '0745678912');
INSERT INTO Manager VALUES ('M021', 'Thilini Pathirana', '0756789023');
INSERT INTO Manager VALUES ('M022', 'Sampath Wijesooriya', '0767890134');
INSERT INTO Manager VALUES ('M023', 'Nishantha Bandara', '0778901245');
INSERT INTO Manager VALUES ('M024', 'Ayesha Perera', '0789012356');
INSERT INTO Manager VALUES ('M025', 'Ruwan Gamage', '0790123467');

COMMIT;
PROMPT '10 additional Manager records inserted';

-- ============================================
-- ADDITIONAL CUSTOMER DATA (25 more records)
-- ============================================
INSERT INTO Customer VALUES ('C026', 'Lakshitha Bandara', '0756789016');
INSERT INTO Customer VALUES ('C027', 'Sandali Perera', '0767890127');
INSERT INTO Customer VALUES ('C028', 'Charith Silva', '0778901239');
INSERT INTO Customer VALUES ('C029', 'Dilrukshi Fernando', '0789012350');
INSERT INTO Customer VALUES ('C030', 'Mahinda Rajapaksa', '0790123461');
INSERT INTO Customer VALUES ('C031', 'Yashodha Wijesinghe', '0701234572');
INSERT INTO Customer VALUES ('C032', 'Nuwan Kulasekara', '0712345684');
INSERT INTO Customer VALUES ('C033', 'Samanthi Jayawardena', '0723456785');
INSERT INTO Customer VALUES ('C034', 'Harsha Wickramaratne', '0734567895');
INSERT INTO Customer VALUES ('C035', 'Nadeesha Gunawardena', '0745678906');
INSERT INTO Customer VALUES ('C036', 'Asela Samaraweera', '0756789017');
INSERT INTO Customer VALUES ('C037', 'Chathurika Dissanayake', '0767890128');
INSERT INTO Customer VALUES ('C038', 'Dinesh Chandimal', '0778901240');
INSERT INTO Customer VALUES ('C039', 'Anusha Ranasinghe', '0789012351');
INSERT INTO Customer VALUES ('C040', 'Prasanna Herath', '0790123462');
INSERT INTO Customer VALUES ('C041', 'Shashika Jayasuriya', '0701234573');
INSERT INTO Customer VALUES ('C042', 'Thushara Senanayake', '0712345685');
INSERT INTO Customer VALUES ('C043', 'Kavinda Wickramasinghe', '0723456786');
INSERT INTO Customer VALUES ('C044', 'Madhushani Gunasekara', '0734567896');
INSERT INTO Customer VALUES ('C045', 'Lahiru Mendis', '0745678907');
INSERT INTO Customer VALUES ('C046', 'Oshadi Bandara', '0756789018');
INSERT INTO Customer VALUES ('C047', 'Dhanushka Dissanayake', '0767890129');
INSERT INTO Customer VALUES ('C048', 'Sachini Samaraweera', '0778901241');
INSERT INTO Customer VALUES ('C049', 'Isuru Wijesinghe', '0789012352');
INSERT INTO Customer VALUES ('C050', 'Hashini Ranasinghe', '0790123463');

COMMIT;
PROMPT '25 additional Customer records inserted';

-- ============================================
-- ADDITIONAL ITEMS (20 more records)
-- ============================================

-- More Beverages
INSERT INTO Item VALUES ('IT036', 'Pepsi 1.5L', 250.00, 130, 'Beverages', 'M001');
INSERT INTO Item VALUES ('IT037', 'Mango Juice 1L', 380.00, 65, 'Beverages', 'M001');
INSERT INTO Item VALUES ('IT038', 'Apple Juice 1L', 400.00, 55, 'Beverages', 'M001');
INSERT INTO Item VALUES ('IT039', 'Energy Drink 250ml', 280.00, 95, 'Beverages', 'M008');

-- More Snacks
INSERT INTO Item VALUES ('IT040', 'Popcorn 200g', 180.00, 110, 'Snacks', 'M002');
INSERT INTO Item VALUES ('IT041', 'Nuts Mix 150g', 320.00, 75, 'Snacks', 'M002');
INSERT INTO Item VALUES ('IT042', 'Wafer Biscuits', 160.00, 140, 'Snacks', 'M009');
INSERT INTO Item VALUES ('IT043', 'Candy Pack 250g', 200.00, 125, 'Snacks', 'M009');

-- More Dairy
INSERT INTO Item VALUES ('IT044', 'Ice Cream 1L', 650.00, 45, 'Dairy', 'M003');
INSERT INTO Item VALUES ('IT045', 'Curd 400g', 150.00, 85, 'Dairy', 'M003');
INSERT INTO Item VALUES ('IT046', 'Milk Powder 400g', 850.00, 60, 'Dairy', 'M010');

-- More Produce
INSERT INTO Item VALUES ('IT047', 'Cucumber 1kg', 140.00, 70, 'Produce', 'M004');
INSERT INTO Item VALUES ('IT048', 'Beans 500g', 180.00, 55, 'Produce', 'M004');
INSERT INTO Item VALUES ('IT049', 'Pumpkin 1kg', 120.00, 50, 'Produce', 'M011');

-- More Household
INSERT INTO Item VALUES ('IT050', 'Glass Cleaner 500ml', 280.00, 65, 'Household', 'M006');
INSERT INTO Item VALUES ('IT051', 'Fabric Softener 1L', 420.00, 55, 'Household', 'M012');

-- More Personal Care
INSERT INTO Item VALUES ('IT052', 'Conditioner 400ml', 580.00, 70, 'Personal Care', 'M007');
INSERT INTO Item VALUES ('IT053', 'Hand Cream 100ml', 320.00, 60, 'Personal Care', 'M007');
INSERT INTO Item VALUES ('IT054', 'Sunscreen 100ml', 750.00, 40, 'Personal Care', 'M013');
INSERT INTO Item VALUES ('IT055', 'Perfume 50ml', 1200.00, 30, 'Personal Care', 'M013');

COMMIT;
PROMPT '20 additional Item records inserted';

-- ============================================
-- ADDITIONAL ORDERS (20 more records)
-- ============================================
INSERT INTO Orders VALUES ('OR031', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 'C024', 'CA001');
INSERT INTO Orders VALUES ('OR032', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C025', 'CA002');
INSERT INTO Orders VALUES ('OR033', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C026', 'CA003');
INSERT INTO Orders VALUES ('OR034', TO_DATE('2026-01-01', 'YYYY-MM-DD'), NULL, 'CA004');
INSERT INTO Orders VALUES ('OR035', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C027', 'CA005');
INSERT INTO Orders VALUES ('OR036', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C028', 'CA001');
INSERT INTO Orders VALUES ('OR037', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C029', 'CA006');
INSERT INTO Orders VALUES ('OR038', TO_DATE('2026-01-01', 'YYYY-MM-DD'), NULL, 'CA002');
INSERT INTO Orders VALUES ('OR039', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C030', 'CA007');
INSERT INTO Orders VALUES ('OR040', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C031', 'CA003');
INSERT INTO Orders VALUES ('OR041', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C032', 'CA008');
INSERT INTO Orders VALUES ('OR042', TO_DATE('2026-01-01', 'YYYY-MM-DD'), NULL, 'CA004');
INSERT INTO Orders VALUES ('OR043', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C033', 'CA009');
INSERT INTO Orders VALUES ('OR044', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C034', 'CA005');
INSERT INTO Orders VALUES ('OR045', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C035', 'CA010');
INSERT INTO Orders VALUES ('OR046', TO_DATE('2026-01-01', 'YYYY-MM-DD'), NULL, 'CA001');
INSERT INTO Orders VALUES ('OR047', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C036', 'CA011');
INSERT INTO Orders VALUES ('OR048', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C037', 'CA006');
INSERT INTO Orders VALUES ('OR049', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C038', 'CA012');
INSERT INTO Orders VALUES ('OR050', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'C039', 'CA002');

COMMIT;
PROMPT '20 additional Orders records inserted';

-- ============================================
-- ADDITIONAL ORDER_DETAILS (45 more records)
-- ============================================
-- Order 31
INSERT INTO Order_Details VALUES ('OR031', 'IT036', 2);
INSERT INTO Order_Details VALUES ('OR031', 'IT040', 3);

-- Order 32
INSERT INTO Order_Details VALUES ('OR032', 'IT037', 1);
INSERT INTO Order_Details VALUES ('OR032', 'IT044', 2);
INSERT INTO Order_Details VALUES ('OR032', 'IT001', 1);

-- Order 33
INSERT INTO Order_Details VALUES ('OR033', 'IT038', 1);
INSERT INTO Order_Details VALUES ('OR033', 'IT041', 2);

-- Order 34
INSERT INTO Order_Details VALUES ('OR034', 'IT039', 3);
INSERT INTO Order_Details VALUES ('OR034', 'IT042', 2);

-- Order 35
INSERT INTO Order_Details VALUES ('OR035', 'IT043', 4);
INSERT INTO Order_Details VALUES ('OR035', 'IT045', 1);

-- Order 36
INSERT INTO Order_Details VALUES ('OR036', 'IT046', 1);
INSERT INTO Order_Details VALUES ('OR036', 'IT047', 2);
INSERT INTO Order_Details VALUES ('OR036', 'IT006', 1);

-- Order 37
INSERT INTO Order_Details VALUES ('OR037', 'IT048', 2);
INSERT INTO Order_Details VALUES ('OR037', 'IT049', 1);

-- Order 38
INSERT INTO Order_Details VALUES ('OR038', 'IT050', 1);
INSERT INTO Order_Details VALUES ('OR038', 'IT051', 1);

-- Order 39
INSERT INTO Order_Details VALUES ('OR039', 'IT052', 1);
INSERT INTO Order_Details VALUES ('OR039', 'IT053', 2);
INSERT INTO Order_Details VALUES ('OR039', 'IT011', 1);

-- Order 40
INSERT INTO Order_Details VALUES ('OR040', 'IT054', 1);
INSERT INTO Order_Details VALUES ('OR040', 'IT055', 1);

-- Order 41
INSERT INTO Order_Details VALUES ('OR041', 'IT036', 3);
INSERT INTO Order_Details VALUES ('OR041', 'IT021', 2);

-- Order 42
INSERT INTO Order_Details VALUES ('OR042', 'IT037', 2);
INSERT INTO Order_Details VALUES ('OR042', 'IT040', 1);

-- Order 43
INSERT INTO Order_Details VALUES ('OR043', 'IT038', 1);
INSERT INTO Order_Details VALUES ('OR043', 'IT041', 3);

-- Order 44
INSERT INTO Order_Details VALUES ('OR044', 'IT039', 2);
INSERT INTO Order_Details VALUES ('OR044', 'IT042', 2);

-- Order 45
INSERT INTO Order_Details VALUES ('OR045', 'IT043', 1);
INSERT INTO Order_Details VALUES ('OR045', 'IT044', 1);

-- Order 46
INSERT INTO Order_Details VALUES ('OR046', 'IT045', 3);
INSERT INTO Order_Details VALUES ('OR046', 'IT046', 1);

-- Order 47
INSERT INTO Order_Details VALUES ('OR047', 'IT047', 2);
INSERT INTO Order_Details VALUES ('OR047', 'IT048', 2);

-- Order 48
INSERT INTO Order_Details VALUES ('OR048', 'IT049', 1);
INSERT INTO Order_Details VALUES ('OR048', 'IT050', 1);

-- Order 49
INSERT INTO Order_Details VALUES ('OR049', 'IT051', 1);
INSERT INTO Order_Details VALUES ('OR049', 'IT052', 1);
INSERT INTO Order_Details VALUES ('OR049', 'IT016', 2);

-- Order 50
INSERT INTO Order_Details VALUES ('OR050', 'IT053', 2);
INSERT INTO Order_Details VALUES ('OR050', 'IT054', 1);

COMMIT;
PROMPT '45 additional Order_Details records inserted';

-- ============================================
-- ADDITIONAL RECEIPTS (20 more records)
-- ============================================
INSERT INTO Receipt VALUES (31, 'Cash', 1140.00, 'OR031', 'CA001');
INSERT INTO Receipt VALUES (32, 'Card', 1680.00, 'OR032', 'CA002');
INSERT INTO Receipt VALUES (33, 'Digital Wallet', 1040.00, 'OR033', 'CA003');
INSERT INTO Receipt VALUES (34, 'Cash', 1160.00, 'OR034', 'CA004');
INSERT INTO Receipt VALUES (35, 'Card', 950.00, 'OR035', 'CA005');
INSERT INTO Receipt VALUES (36, 'Digital Wallet', 1570.00, 'OR036', 'CA001');
INSERT INTO Receipt VALUES (37, 'Cash', 480.00, 'OR037', 'CA006');
INSERT INTO Receipt VALUES (38, 'Card', 700.00, 'OR038', 'CA002');
INSERT INTO Receipt VALUES (39, 'Digital Wallet', 1500.00, 'OR039', 'CA007');
INSERT INTO Receipt VALUES (40, 'Cash', 1950.00, 'OR040', 'CA003');
INSERT INTO Receipt VALUES (41, 'Card', 990.00, 'OR041', 'CA008');
INSERT INTO Receipt VALUES (42, 'Digital Wallet', 980.00, 'OR042', 'CA004');
INSERT INTO Receipt VALUES (43, 'Cash', 1360.00, 'OR043', 'CA009');
INSERT INTO Receipt VALUES (44, 'Card', 880.00, 'OR044', 'CA005');
INSERT INTO Receipt VALUES (45, 'Digital Wallet', 850.00, 'OR045', 'CA010');
INSERT INTO Receipt VALUES (46, 'Cash', 1300.00, 'OR046', 'CA001');
INSERT INTO Receipt VALUES (47, 'Card', 640.00, 'OR047', 'CA011');
INSERT INTO Receipt VALUES (48, 'Digital Wallet', 400.00, 'OR048', 'CA006');
INSERT INTO Receipt VALUES (49, 'Cash', 1200.00, 'OR049', 'CA012');
INSERT INTO Receipt VALUES (50, 'Card', 1390.00, 'OR050', 'CA002');

COMMIT;
PROMPT '20 additional Receipt records inserted';

-- ============================================
-- ADDITIONAL SUPPLY ORDERS (10 more records)
-- ============================================
INSERT INTO Supply_Order VALUES ('SO019', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M008');
INSERT INTO Supply_Order VALUES ('SO020', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M009');
INSERT INTO Supply_Order VALUES ('SO021', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M010');
INSERT INTO Supply_Order VALUES ('SO022', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M011');
INSERT INTO Supply_Order VALUES ('SO023', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M012');
INSERT INTO Supply_Order VALUES ('SO024', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M013');
INSERT INTO Supply_Order VALUES ('SO025', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M001');
INSERT INTO Supply_Order VALUES ('SO026', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M002');
INSERT INTO Supply_Order VALUES ('SO027', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M003');
INSERT INTO Supply_Order VALUES ('SO028', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'M004');

COMMIT;
PROMPT '10 additional Supply_Order records inserted';

-- ============================================
-- ADDITIONAL SUPPLY DATA (20 more records)
-- ============================================
INSERT INTO Supply VALUES ('SUP041', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 100, 'S001', 'IT036', 'SO019');
INSERT INTO Supply VALUES ('SUP042', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 50, 'S001', 'IT037', 'SO019');
INSERT INTO Supply VALUES ('SUP043', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 45, 'S001', 'IT038', 'SO020');
INSERT INTO Supply VALUES ('SUP044', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 80, 'S001', 'IT039', 'SO020');
INSERT INTO Supply VALUES ('SUP045', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 100, 'S002', 'IT040', 'SO021');
INSERT INTO Supply VALUES ('SUP046', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 60, 'S002', 'IT041', 'SO021');
INSERT INTO Supply VALUES ('SUP047', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 120, 'S002', 'IT042', 'SO022');
INSERT INTO Supply VALUES ('SUP048', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 110, 'S002', 'IT043', 'SO022');
INSERT INTO Supply VALUES ('SUP049', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 40, 'S005', 'IT044', 'SO023');
INSERT INTO Supply VALUES ('SUP050', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 75, 'S005', 'IT045', 'SO023');
INSERT INTO Supply VALUES ('SUP051', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 50, 'S005', 'IT046', 'SO024');
INSERT INTO Supply VALUES ('SUP052', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 60, 'S004', 'IT047', 'SO024');
INSERT INTO Supply VALUES ('SUP053', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 45, 'S004', 'IT048', 'SO025');
INSERT INTO Supply VALUES ('SUP054', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 40, 'S004', 'IT049', 'SO025');
INSERT INTO Supply VALUES ('SUP055', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 55, 'S010', 'IT050', 'SO026');
INSERT INTO Supply VALUES ('SUP056', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 45, 'S010', 'IT051', 'SO026');
INSERT INTO Supply VALUES ('SUP057', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 60, 'S011', 'IT052', 'SO027');
INSERT INTO Supply VALUES ('SUP058', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 50, 'S011', 'IT053', 'SO027');
INSERT INTO Supply VALUES ('SUP059', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 35, 'S011', 'IT054', 'SO028');
INSERT INTO Supply VALUES ('SUP060', TO_DATE('2026-01-01', 'YYYY-MM-DD'), 25, 'S011', 'IT055', 'SO028');

COMMIT;
PROMPT '20 additional Supply records inserted';

-- ============================================
-- FINAL DATA VERIFICATION
-- ============================================

PROMPT '';
PROMPT '==============================================';
PROMPT 'ADDITIONAL DATA INSERTION SUMMARY';
PROMPT '==============================================';

SELECT 'Manager' AS Table_Name, COUNT(*) AS Total_Records FROM Manager
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
PROMPT 'Additional sample data inserted successfully!';
PROMPT 'New total records: 468';
PROMPT 'Previous total: 298';
PROMPT 'Added: 170 new records';
