/* ======================================================
   RETAIL ANALYTICS PROJECT - ANALYSIS QUERIES
   Database: retail_analytics
   ------------------------------------------------------
   How to use:
   - Run: USE retail_analytics;
   - Highlight ONE query at a time and press Execute 
   ====================================================== */

USE retail_analytics;


/* ======================================================
   SECTION 0: QUICK CHECKS
   ====================================================== */

-- 0.1 List all tables in the database
SHOW TABLES;

-- 0.2 Preview some data
SELECT * FROM Customers;
SELECT * FROM Stores;
SELECT * FROM Products;
SELECT * FROM Sales;
SELECT * FROM Online_Orders;


/* ======================================================
   SECTION 1: REVENUE ANALYSIS
   ====================================================== */

-- 1.1 Total revenue from in-store sales
SELECT 
    SUM(total_amount) AS total_store_revenue
FROM Sales;

-- 1.2 Total revenue from online orders
SELECT 
    SUM(total_amount) AS total_online_revenue
FROM Online_Orders;

-- 1.3 Combined total revenue (store + online)
SELECT 
    COALESCE((SELECT SUM(total_amount) FROM Sales), 0) +
    COALESCE((SELECT SUM(total_amount) FROM Online_Orders), 0) AS total_revenue_all_channels;

-- 1.4 Revenue by store
SELECT 
    s.store_name,
    SUM(sa.total_amount) AS store_revenue
FROM Sales sa
JOIN Stores s ON sa.store_id = s.store_id
GROUP BY s.store_id, s.store_name
ORDER BY store_revenue DESC;

-- 1.5 Monthly revenue trend (in-store)
SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS `year_month`,
    SUM(total_amount) AS monthly_revenue
FROM Sales
GROUP BY `year_month`
ORDER BY `year_month`;


/* ======================================================
   SECTION 2: CUSTOMER ANALYSIS
   ====================================================== */

-- 2.1 In-store spending by customer
SELECT 
    cu.customer_id,
    cu.first_name,
    cu.last_name,
    SUM(sa.total_amount) AS store_spent
FROM Sales sa
JOIN Customers cu ON sa.customer_id = cu.customer_id
GROUP BY cu.customer_id, cu.first_name, cu.last_name
ORDER BY store_spent DESC;

-- 2.2 Total spending by customer (store + online)
SELECT 
    cu.customer_id,
    cu.first_name,
    cu.last_name,
    COALESCE(SUM(sa.total_amount), 0) 
      + COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM Customers cu
LEFT JOIN Sales sa ON cu.customer_id = sa.customer_id
LEFT JOIN Online_Orders o ON cu.customer_id = o.customer_id
GROUP BY cu.customer_id, cu.first_name, cu.last_name
ORDER BY total_spent DESC;

-- 2.3 Customers who have never made an online order
SELECT 
    cu.customer_id,
    cu.first_name,
    cu.last_name
FROM Customers cu
LEFT JOIN Online_Orders o ON cu.customer_id = o.customer_id
WHERE o.order_id IS NULL;


/* ======================================================
   SECTION 3: PRODUCT & CATEGORY ANALYSIS
   ====================================================== */

-- 3.1 Revenue and units sold by product
SELECT 
    p.product_id,
    p.product_name,
    SUM(sa.quantity) AS units_sold,
    SUM(sa.total_amount) AS product_revenue
FROM Sales sa
JOIN Products p ON sa.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY product_revenue DESC;

-- 3.2 Revenue by category
SELECT 
    c.category_name,
    SUM(sa.total_amount) AS category_revenue
FROM Sales sa
JOIN Products p ON sa.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY category_revenue DESC;

-- 3.3 Low stock alerts (less than 30)
SELECT 
    product_id,
    product_name,
    stock_quantity
FROM Products
WHERE stock_quantity < 30
ORDER BY stock_quantity ASC;


/* ======================================================
   SECTION 4: ONLINE CHANNEL ANALYSIS
   ====================================================== */

-- 4.1 Orders by status
SELECT 
    status,
    COUNT(*) AS num_orders,
    SUM(total_amount) AS revenue
FROM Online_Orders
GROUP BY status;

-- 4.2 Online revenue by delivery city
SELECT 
    delivery_city,
    SUM(total_amount) AS city_online_revenue,
    COUNT(*) AS num_orders
FROM Online_Orders
GROUP BY delivery_city
ORDER BY city_online_revenue DESC;
