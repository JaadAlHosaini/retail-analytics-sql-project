/* ==========================================
   RETAIL ANALYTICS PROJECT - INSERT DATA
   ========================================== */

USE retail_analytics;

-- Clear existing data (optional when re-running)
DELETE FROM Online_Orders;
DELETE FROM Sales;
DELETE FROM Employees;
DELETE FROM Products;
DELETE FROM Categories;
DELETE FROM Stores;
DELETE FROM Customers;

-- Categories
INSERT INTO Categories (category_name) VALUES
('Beauty'), 
('Fragrance'), 
('Fashion');

-- Stores
INSERT INTO Stores (store_name, city, country, store_type) VALUES
('Dubai Mall Flagship', 'Dubai', 'UAE', 'Flagship'),
('Riyadh Gallery', 'Riyadh', 'Saudi Arabia', 'Mall'),
('Pavilion KL', 'Kuala Lumpur', 'Malaysia', 'Mall');

-- Customers (your names)
INSERT INTO Customers (first_name, last_name, gender, age, city, country, join_date) VALUES
('Jaad', 'AlHosaini', 'M', 20, 'Kuala Lumpur', 'Malaysia', '2024-02-01'),
('Mohammed', 'Shahrani', 'M', 24, 'Riyadh', 'Saudi Arabia', '2023-12-15'),
('Sara', 'Al-Fayez', 'F', 22, 'Jeddah', 'Saudi Arabia', '2024-01-10');

-- Products
INSERT INTO Products (product_name, category_id, brand, price, cost, stock_quantity) VALUES
('Luxury Perfume 50ml', 2, 'ChalhoubBrand', 350.00, 150.00, 120),
('Hydrating Face Cream', 1, 'GlowSkin', 180.00, 70.00, 80),
('Designer Handbag', 3, 'Eleganza', 1200.00, 600.00, 25);

-- Sales (in-store)
-- 1: Jaad, 2: Mohammed, 3: Sara
-- stores: 1 = Dubai, 2 = Riyadh, 3 = KL
INSERT INTO Sales (customer_id, product_id, store_id, sale_date, quantity, total_amount) VALUES
(1, 1, 3, '2024-03-01', 1, 350.00),     -- Jaad bought perfume in KL
(2, 3, 2, '2024-03-02', 1, 1200.00),    -- Mohammed bought handbag in Riyadh
(3, 2, 1, '2024-03-03', 2, 360.00);     -- Sara bought 2 face creams in Dubai

-- Online Orders
INSERT INTO Online_Orders (customer_id, product_id, order_date, quantity, total_amount, delivery_city, status) VALUES
(1, 2, '2024-03-05', 1, 180.00, 'Kuala Lumpur', 'delivered'),   -- Jaad online order
(3, 1, '2024-03-06', 1, 350.00, 'Jeddah', 'pending');           -- Sara online order
