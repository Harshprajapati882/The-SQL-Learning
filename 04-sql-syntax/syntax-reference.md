# SQL Syntax

## Case Sensitivity
- SQL keywords are **not case-sensitive** (SELECT, select, Select are equivalent).
- Database names, table names, and column names are **case-sensitive** (depending on the database system).
- Best practice: Use uppercase for SQL keywords and lowercase for identifiers.

## Semicolon (;)
- The semicolon is the standard way to separate SQL statements.
- It is required for executing multiple statements in sequence.
- Example: `SELECT * FROM users; SELECT * FROM orders;`

## CREATE DATABASE
- Creates a new database.
- Syntax: `CREATE DATABASE database_name;`
- Example: `CREATE DATABASE school_db;`

## USE Statement
- Selects a database for subsequent operations.
- Syntax: `USE database_name;`
- Example: `USE school_db;`

## DROP Statement
- Deletes a database or table.
- Syntax: `DROP DATABASE database_name;` or `DROP TABLE table_name;`
- Example: `DROP DATABASE school_db;`

## CREATE TABLE
- Creates a new table in a database.
- Syntax: `CREATE TABLE table_name (column_name data_type constraint);`
- Example:
  ```sql
  CREATE TABLE students (
      student_id INT PRIMARY KEY,
      name VARCHAR(100),
      age INT,
      email VARCHAR(100)
  );
  ```

## DESC (DESCRIBE)
- Shows the structure of a table (columns, data types, constraints).
- Syntax: `DESC table_name;` or `DESCRIBE table_name;`
- Example: `DESC students;`

## INSERT INTO
- Adds new records to a table.
- Syntax: `INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);`
- Example: `INSERT INTO students (student_id, name, age, email) VALUES (1, 'John Doe', 20, 'john@example.com');`

## TRUNCATE TABLE
- Removes all records from a table but keeps the table structure.
- Syntax: `TRUNCATE TABLE table_name;`
- Example: `TRUNCATE TABLE students;`
- Note: TRUNCATE is faster than DELETE but cannot be rolled back in some systems.

## ALTER TABLE
- Modifies an existing table structure.
- Add a column: `ALTER TABLE table_name ADD column_name data_type;`
- Drop a column: `ALTER TABLE table_name DROP COLUMN column_name;`
- Modify a column: `ALTER TABLE table_name MODIFY column_name data_type;`
- Example: `ALTER TABLE students ADD phone VARCHAR(15);`

## RENAME
- Changes the name of a table or column.
- Syntax (Table): `ALTER TABLE old_table_name RENAME TO new_table_name;` or `RENAME TABLE old_table_name TO new_table_name;`
- Example: `RENAME TABLE students TO learners;`

## DISTINCT Clause
- Removes duplicate records from the result set.
- Syntax: `SELECT DISTINCT column1, column2, ... FROM table_name;`
- Example: `SELECT DISTINCT age FROM students;`

## WHERE Clause
- Filters records based on specific conditions.
- Syntax: `SELECT * FROM table_name WHERE condition;`
- Example: `SELECT * FROM students WHERE age > 20;`

## AND/OR Operators
- AND: Combines multiple conditions (all must be true).
- OR: Combines multiple conditions (at least one must be true).
- Example: `SELECT * FROM students WHERE age > 20 AND name = 'John Doe';`
- Example: `SELECT * FROM students WHERE age < 18 OR age > 25;`

## IN Clause
- Checks if a value exists in a list of values.
- Syntax: `SELECT * FROM table_name WHERE column_name IN (value1, value2, ...);`
- Example: `SELECT * FROM students WHERE age IN (20, 21, 22);`

## BETWEEN Clause
- Filters records within a range of values.
- Syntax: `SELECT * FROM table_name WHERE column_name BETWEEN value1 AND value2;`
- Example: `SELECT * FROM students WHERE age BETWEEN 18 AND 25;`

## LIKE Operator
- Searches for patterns in text.
- Syntax: `SELECT * FROM table_name WHERE column_name LIKE pattern;`
- Wildcards: `%` (zero or more characters), `_` (single character)
- Example: `SELECT * FROM students WHERE name LIKE 'J%';` (names starting with 'J')

## ORDER BY Clause
- Sorts records in ascending (ASC) or descending (DESC) order.
- Syntax: `SELECT * FROM table_name ORDER BY column_name ASC/DESC;`
- Example: `SELECT * FROM students ORDER BY age DESC;`

## GROUP BY Clause
- Groups records by one or more columns.
- Syntax: `SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;`
- Example: `SELECT age, COUNT(*) FROM students GROUP BY age;`

## COUNT Function
- Returns the number of rows that match a condition.
- Syntax: `SELECT COUNT(column_name) FROM table_name WHERE condition;`
- Example: `SELECT COUNT(*) FROM students WHERE age > 20;`

## HAVING Clause
- Filters groups based on conditions (used with GROUP BY).
- Syntax: `SELECT column_name FROM table_name GROUP BY column_name HAVING condition;`
- Example: `SELECT age, COUNT(*) FROM students GROUP BY age HAVING COUNT(*) > 5;`

## CREATE INDEX
- Creates an index on one or more columns for faster queries.
- Syntax: `CREATE INDEX index_name ON table_name (column_name);`
- Example: `CREATE INDEX idx_email ON students (email);`

## DROP INDEX
- Deletes an index.
- Syntax: `DROP INDEX index_name;` or `DROP INDEX index_name ON table_name;`
- Example: `DROP INDEX idx_email;`
