/* ==========================================
   RETAIL ANALYTICS PROJECT - CREATE TABLES
   ========================================== */

-- Create database (run once)
CREATE DATABASE IF NOT EXISTS retail_analytics;

-- Use this database
USE retail_analytics;

-- Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    gender        VARCHAR(10),
    age           INT,
    city          VARCHAR(100),
    country       VARCHAR(100),
    join_date     DATE
);

-- Stores table
CREATE TABLE IF NOT EXISTS Stores (
    store_id      INT PRIMARY KEY AUTO_INCREMENT,
    store_name    VARCHAR(100),
    city          VARCHAR(100),
    country       VARCHAR(100),
    store_type    VARCHAR(50)
);

-- Categories table
CREATE TABLE IF NOT EXISTS Categories (
    category_id   INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- Products table
CREATE TABLE IF NOT EXISTS Products (
    product_id     INT PRIMARY KEY AUTO_INCREMENT,
    product_name   VARCHAR(150) NOT NULL,
    category_id    INT,
    brand          VARCHAR(100),
    price          DECIMAL(10,2),
    cost           DECIMAL(10,2),
    stock_quantity INT,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Employees table
CREATE TABLE IF NOT EXISTS Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    store_id    INT,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    job_title   VARCHAR(100),
    salary      DECIMAL(10,2),
    CONSTRAINT fk_employees_store
        FOREIGN KEY (store_id) REFERENCES Stores(store_id)
);

-- Sales table (in-store)
CREATE TABLE IF NOT EXISTS Sales (
    sale_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT,
    product_id   INT,
    store_id     INT,
    sale_date    DATE,
    quantity     INT,
    total_amount DECIMAL(10,2),
    CONSTRAINT fk_sales_customer
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_sales_product
        FOREIGN KEY (product_id)  REFERENCES Products(product_id),
    CONSTRAINT fk_sales_store
        FOREIGN KEY (store_id)    REFERENCES Stores(store_id)
);

-- Online orders table
CREATE TABLE IF NOT EXISTS Online_Orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_id   INT,
    product_id    INT,
    order_date    DATE,
    quantity      INT,
    total_amount  DECIMAL(10,2),
    delivery_city VARCHAR(100),
    status        VARCHAR(20),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_orders_product
        FOREIGN KEY (product_id)  REFERENCES Products(product_id)
);
