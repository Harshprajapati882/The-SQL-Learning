-- SQL Code Examples

-- 1. Creating a Database
-- Creates a new database if it doesn't already exist.
CREATE DATABASE IF NOT EXISTS my_database;

-- 2. Select the database
-- Selects the database to perform operations on.
USE my_database;

-- 3. Creating a Table
-- Creates a 'users' table with id, name, and email columns.
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY,       -- Unique identifier for each user
    name VARCHAR(100),        -- User's name (up to 100 characters)
    email VARCHAR(100)        -- User's email (up to 100 characters)
);

-- 4. Inserting Data
-- Inserts a new record into the 'users' table.
INSERT INTO users (id, name, email) VALUES (1, 'John Doe', 'john@example.com');

-- 5. Retrieving Data
-- Selects all columns and rows from the 'users' table.
SELECT * FROM users;

-- 6. Updating Data
-- Updates the email address for the user with id 1.
UPDATE users SET email = 'john.doe@example.com' WHERE id = 1;

-- 7. Deleting Data
-- Deletes the record for the user with id 1.
DELETE FROM users WHERE id = 1;