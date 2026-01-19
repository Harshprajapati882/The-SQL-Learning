# SQL Topics

## RDBMS
Relational Database Management System (RDBMS) is a type of database management system that stores data in a structured format, using rows and columns. 

**Example:** MySQL, PostgreSQL.

## Table
A table is a collection of related data entries that consists of columns and rows.

**Example:** A table named `Employees` with columns `ID`, `Name`, `Position`.

## Field
A field is the intersection of a row and a column in a table. It contains a single piece of data.

**Example:** In the `Employees` table, `Name` is a field.

## Record or Row
A record (or row) is a single entry in a table.

**Example:** A row in the `Employees` table might contain `1, John Doe, Manager`.

## Column
A column is a set of data values of a particular type, one for each row of the table.

**Example:** The `Position` column in the `Employees` table.

## Null Value
A null value represents missing or unknown data.

**Example:** If an employee's middle name is unknown, it can be represented as `NULL` in the `Employees` table.

## Constraints
Constraints are rules applied to the data in a table to ensure data integrity.

**Example:** A `UNIQUE` constraint on the `Email` field to prevent duplicate email addresses.

## Keys
Keys are attributes that help identify records uniquely in a table.

**Example:** The `ID` field in the `Employees` table is a primary key.

## Data Integrity
Data integrity refers to the accuracy and consistency of data stored in a database.

**Example:** Ensuring that all entries in the `Email` field follow a valid email format.

## Normalization
Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. It involves dividing large tables into smaller, related tables.

**Example:** Splitting a `Customers` table into `Customers` and `Orders` tables to separate customer information from order details.

## Types
Data types define the kind of data that can be stored in a field.

**Example:** `VARCHAR` for strings, `INT` for integers.
