# Retail Sales Analytics SQL Project

This project is a mini **retail analytics system** built using **MySQL**.  
It simulates a retail company and focuses on **analyzing sales, customers, products, and online vs in-store performance** using SQL.

The goal of the project is to:
- Practice **database design** (ERD + relational schema)
- Write **realistic SQL analytical queries**
- Prepare a **CV-ready portfolio project** for Data Science / MIS / Analytics roles

---

## Project Structure

This project contains three main SQL scripts:

- `create_tables.sql` – Creates the `retail_analytics` database and all tables  
- `insert_data.sql` – Inserts sample data (customers, stores, products, sales, online orders)  
- `analysis_queries.sql` – Contains analysis queries for revenue, customers, products, categories, and online channel performance  

Optional file:
- `ERD.png` – Entity Relationship Diagram of the retail database

---

## Database Design

The database is called **`retail_analytics`** and includes the following tables:

- **Customers** – Customer profiles (name, gender, age, city, country, join date)  
- **Stores** – Physical store locations (Dubai, Riyadh, Kuala Lumpur, etc.)  
- **Categories** – Product categories like Beauty, Fragrance, Fashion  
- **Products** – Product details (brand, price, cost, stock quantity)  
- **Sales** – In-store sales transactions  
- **Online_Orders** – E-commerce orders (delivery city, status)

An ERD (Entity Relationship Diagram) shows the relationships:
- One **Customer** → many **Sales** and **Online_Orders**  
- One **Store** → many **Sales**  
- One **Category** → many **Products**  
- One **Product** → many **Sales** and **Online_Orders**

> If you export your ERD from diagrams.net, you can include it here as `ERD.png`.

---

## Tech Stack

- **Database:** MySQL  
- **Tool:** MySQL Workbench  
- **Modeling:** ERD with diagrams.net (draw.io)  
- **Language:** SQL

---

## How to Run This Project

1. **Clone or download** this repository.
2. Open **MySQL Workbench** and connect to your MySQL server.
3. Open `create_tables.sql`:
   - Run the whole script.
   - This will create the `retail_analytics` database and all tables.
4. Open `insert_data.sql`:
   - Run the whole script.
   - This will insert sample data (customers, stores, products, sales, online orders).
5. Open `analysis_queries.sql`:
   - Make sure you are using the correct database:
     ```sql
     USE retail_analytics;
     ```
   - Highlight **one query at a time** and click **Execute (⚡)** to see the results.

---

## Main Analysis Queries

The `analysis_queries.sql` file is organized into sections:

###  Section 1 – Revenue Analysis
Examples:
- Total revenue from **in-store sales**
- Total revenue from **online orders**
- Combined revenue across all channels
- Revenue **by store**
- **Monthly revenue trend**

###  Section 2 – Customer Analysis
Examples:
- Total spending per customer  
- In-store spending ranking  
- Combined in-store + online spending  
- Customers who **never ordered online**

###  Section 3 – Product & Category Analysis
Examples:
- Revenue and units sold by product  
- Revenue by category (Beauty, Fragrance, Fashion)  
- **Low-stock alert** for products with low inventory

###  Section 4 – Online Channel Analysis
Examples:
- Number of online orders by status (delivered, pending)  
- Online revenue by delivery city  

---

## Sample Data

The sample data includes:

- Customers like **Jaad AlHosaini**, **Mohammed Shahrani**, and **Sara Al-Fayez**  
- Stores located in **Dubai**, **Riyadh**, and **Kuala Lumpur**  
- Products such as **Luxury Perfume**, **Hydrating Face Cream**, and **Designer Handbag**  
- A mix of in-store sales and online orders to simulate a real retail environment

You can easily extend this data by adding more INSERT statements.

---

## Possible Extensions (Future Work)

Some ideas to extend this project further:

- Add more customers, products, and orders for richer analysis  
- Add an **Employees** table with HR and store staffing data  
- Connect MySQL to **Power BI / Tableau / Excel** and build dashboards:
  - Revenue by month
  - Revenue by store
  - Top customers and products
  - Online vs in-store comparison
- Add computed metrics like **profit** and **margin** per product and category  

---

