/*
================================================================================
FILE: introduction.sql
TOPIC: SQL Basics and Introduction
DESCRIPTION: Basic SQL examples covering table creation and data manipulation
================================================================================
*/

-- Create a table
-- We use IF NOT EXISTS to avoid errors on subsequent runs
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER
);

-- Example of inserting data
INSERT INTO users (name, age) VALUES ('Alice', 30);

-- Example of querying data
SELECT * FROM users;
