# SQL Syntax and Operations

## SQL Syntax Basics
- **Case Sensitivity**: SQL keywords (like `SELECT`, `FROM`, `WHERE`) are generally case-insensitive. However, table names and column names can be case-sensitive depending on the operating system and database configuration.
- **Semicolons**: It is the standard way to separate each SQL statement in database systems that allow more than one SQL statement to be executed in the same call.

## Database Operations
- **CREATE DATABASE**: Creates a new SQL database.
- **USE**: Selects a database to work with.
- **DROP DATABASE**: Deletes an existing database.

## Table Operations
- **CREATE TABLE**: Creates a new table in the database.
- **DESC / DESCRIBE**: Displays the structure of a table (columns, types, etc.).
- **ALTER TABLE**: Modifies an existing table (add, delete, or modify columns).
- **RENAME TABLE**: Renames an existing table.
- **TRUNCATE TABLE**: Deletes all data inside a table but keeps the structure.
- **DROP TABLE**: Deletes a table and its data.

## Data Manipulation
- **INSERT INTO**: Inserts new records into a table.

## Querying and Filtering
- **DISTINCT**: Returns only distinct (different) values.
- **WHERE**: Filters records based on a specified condition.
- **AND / OR**: Operators used to filter records based on more than one condition.
- **IN**: Allows you to specify multiple values in a WHERE clause.
- **BETWEEN**: Selects values within a given range.
- **LIKE**: Searches for a specified pattern in a column.

## Sorting and Grouping
- **ORDER BY**: Sorts the result set in ascending or descending order.
- **GROUP BY**: Groups rows that have the same values into summary rows.
- **COUNT()**: Returns the number of rows that match a specified criterion.
- **HAVING**: Used with `GROUP BY` to filter groups (since `WHERE` cannot be used with aggregate functions).

## Indexes
- **CREATE INDEX**: Creates an index on a table to speed up data retrieval.
- **DROP INDEX**: Deletes an index from a table.

## SQL Code
You can find the runnable SQL code examples in Note.sql.