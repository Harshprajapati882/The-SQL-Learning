/*
================================================================================
FILE: basics.sql
TOPIC: SQL Syntax - Basics
DESCRIPTION: Basic SQL syntax examples including database and table operations
================================================================================
*/

-- 1. Database Operations
-- Create a new database
CREATE DATABASE IF NOT EXISTS shop_db;

-- Select the database to use
USE shop_db;

-- Drop a database (Commented out to prevent accidental deletion)
-- DROP DATABASE IF EXISTS shop_db;

-- 2. Table Operations
-- Create a new table 'products'
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Describe the table structure
DESC products;

-- Alter table to add a new column
ALTER TABLE products ADD COLUMN description TEXT;

-- Rename the table (MySQL syntax)
-- RENAME TABLE products TO inventory_items;
-- RENAME TABLE inventory_items TO products; -- Reverting back

-- Truncate table (Removes all data)
-- TRUNCATE TABLE products;

-- Drop table (Commented out)
-- DROP TABLE IF EXISTS products;

-- 3. Data Manipulation
-- Insert data into products
INSERT INTO products (product_name, category, price, stock_quantity) VALUES 
('Laptop', 'Electronics', 1200.00, 10),
('Smartphone', 'Electronics', 800.00, 20),
('Desk Chair', 'Furniture', 150.00, 15),
('Coffee Table', 'Furniture', 100.00, 5),
('Headphones', 'Electronics', 200.00, 30);

-- 4. Querying and Filtering
-- Select distinct categories
SELECT DISTINCT category FROM products;

-- Filter with WHERE, AND, OR
SELECT * FROM products 
WHERE category = 'Electronics' AND price > 500;

SELECT * FROM products 
WHERE category = 'Furniture' OR price < 200;

-- Filter with IN
SELECT * FROM products 
WHERE category IN ('Furniture', 'Electronics');

-- Filter with BETWEEN
SELECT * FROM products 
WHERE price BETWEEN 100 AND 1000;

-- Filter with LIKE (Pattern matching)
-- Finds products starting with 'Smart'
SELECT * FROM products 
WHERE product_name LIKE 'Smart%';

-- 5. Sorting and Grouping
-- Order by price descending
SELECT * FROM products 
ORDER BY price DESC;

-- Group by category and count products
SELECT category, COUNT(*) as product_count 
FROM products 
GROUP BY category;

-- Filter groups with HAVING (Categories with more than 1 product)
SELECT category, COUNT(*) as product_count 
FROM products 
GROUP BY category 
HAVING COUNT(*) > 1;

-- 6. Indexes
-- Create an index on the product_name column
CREATE INDEX idx_product_name ON products (product_name);

-- Drop the index
DROP INDEX idx_product_name ON products;