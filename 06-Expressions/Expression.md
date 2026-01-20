# SQL Expressions

## Table of Contents
1. [Introduction](#introduction)
2. [Types of SQL Expressions](#types)
3. [Boolean Expressions](#boolean)
4. [Numeric Expressions](#numeric)
5. [Date and Time Expressions](#datetime)
6. [Practical Examples](#examples)

---

## Introduction {#introduction}

An **SQL expression** is a combination of one or more values, operators, and SQL functions that evaluates to a result value. Expressions are used in SELECT, WHERE, HAVING, and ORDER BY clauses to perform calculations, comparisons, and data manipulations.

### Components of an Expression:
- **Values** (literals, column names, variables)
- **Operators** (arithmetic, comparison, logical)
- **Functions** (aggregate, string, date, mathematical)

---

## Types of SQL Expressions {#types}

SQL expressions can be categorized into three main types:

1. **Boolean Expressions** - Return TRUE or FALSE
2. **Numeric Expressions** - Return numeric values
3. **Date and Time Expressions** - Return date/time values

---

## Boolean Expressions {#boolean}

Boolean expressions evaluate to **TRUE**, **FALSE**, or **NULL**. They are primarily used in WHERE and HAVING clauses for filtering data.

### Comparison Operators:
| Operator | Description |
|----------|-------------|
| `=` | Equal to |
| `!=` or `<>` | Not equal to |
| `>` | Greater than |
| `<` | Less than |
| `>=` | Greater than or equal to |
| `<=` | Less than or equal to |

### Logical Operators:
| Operator | Description |
|----------|-------------|
| `AND` | Both conditions must be TRUE |
| `OR` | At least one condition must be TRUE |
| `NOT` | Reverses the result |

### Boolean Expression Examples:

```sql
-- Simple comparison
WHERE age > 25

-- Multiple conditions with AND
WHERE age > 25 AND salary > 50000

-- Multiple conditions with OR
WHERE department = 'Sales' OR department = 'Marketing'

-- Using NOT
WHERE NOT (status = 'Inactive')

-- IN operator (shorthand for multiple OR)
WHERE department IN ('Sales', 'Marketing', 'IT')

-- BETWEEN operator
WHERE salary BETWEEN 40000 AND 80000

-- LIKE operator (pattern matching)
WHERE name LIKE '%John%'

-- IS NULL / IS NOT NULL
WHERE email IS NOT NULL

-- Comparison with expressions
WHERE (salary * 1.1) > 100000
```

### Use Cases:
- Filtering records based on conditions
- Validating data quality
- Segmenting data for reporting
- Conditional joins and subqueries

---

## Numeric Expressions {#numeric}

Numeric expressions combine numeric values and arithmetic operators to perform calculations and return numeric results.

### Arithmetic Operators:
| Operator | Description |
|----------|-------------|
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `/` | Division |
| `%` | Modulus (remainder) |

### Aggregate Functions:
| Function | Description |
|----------|-------------|
| `SUM()` | Sum of all values |
| `AVG()` | Average of all values |
| `COUNT()` | Count of rows |
| `MIN()` | Minimum value |
| `MAX()` | Maximum value |

### Mathematical Functions:
| Function | Description |
|----------|-------------|
| `ABS()` | Absolute value |
| `ROUND()` | Round to specified decimal places |
| `CEIL()` | Round up to nearest integer |
| `FLOOR()` | Round down to nearest integer |
| `POWER()` | Raise to a power |
| `SQRT()` | Square root |

### Numeric Expression Examples:

```sql
-- Basic arithmetic
SELECT product_id, price, quantity, (price * quantity) AS total_cost

-- Percentage calculation
SELECT salary, (salary * 0.10) AS bonus_10_percent

-- Discount calculation
SELECT price, discount_rate, (price * (1 - discount_rate/100)) AS final_price

-- Aggregate functions
SELECT 
  COUNT(*) AS total_orders,
  AVG(amount) AS average_amount,
  SUM(amount) AS total_amount,
  MIN(amount) AS min_amount,
  MAX(amount) AS max_amount

-- Mathematical functions
SELECT 
  ROUND(price / quantity, 2) AS unit_price,
  ABS(revenue - cost) AS profit_margin,
  SQRT(area) AS side_length

-- Complex expression
SELECT 
  product_id,
  (quantity * unit_price) - (quantity * unit_price * discount/100) AS net_amount

-- Grouping with aggregate functions
SELECT 
  department,
  AVG(salary) AS avg_salary,
  COUNT(*) AS employee_count
GROUP BY department
```

### Use Cases:
- Calculating totals, discounts, and fees
- Performing financial calculations
- Computing statistics and metrics
- Determining ratios and percentages
- Inventory and resource planning

---

## Date and Time Expressions {#datetime}

Date and Time expressions work with temporal data to perform calculations, comparisons, and formatting of dates and times.

### Common Date/Time Functions:
| Function | Description |
|----------|-------------|
| `GETDATE()` or `NOW()` | Current date and time |
| `DATEADD()` | Add interval to date |
| `DATEDIFF()` | Difference between two dates |
| `YEAR()` | Extract year from date |
| `MONTH()` | Extract month from date |
| `DAY()` | Extract day from date |
| `DATENAME()` | Name of date part (month name, day name) |
| `FORMAT()` | Format date/time value |
| `EOMONTH()` | End of month date |
| `DATEFROMPARTS()` | Create date from parts |

### Date/Time Expression Examples:

```sql
-- Get current date and time
SELECT GETDATE() AS current_date_time
SELECT NOW() AS current_timestamp

-- Extract parts from dates
SELECT 
  order_date,
  YEAR(order_date) AS order_year,
  MONTH(order_date) AS order_month,
  DAY(order_date) AS order_day,
  DATENAME(WEEKDAY, order_date) AS day_of_week

-- Date arithmetic - add days
SELECT 
  order_date,
  DATEADD(DAY, 30, order_date) AS delivery_date_30days

-- Date arithmetic - add months
SELECT 
  hire_date,
  DATEADD(MONTH, 12, hire_date) AS first_anniversary

-- Calculate age
SELECT 
  employee_name,
  birth_date,
  DATEDIFF(YEAR, birth_date, GETDATE()) AS age

-- Calculate days since event
SELECT 
  order_id,
  order_date,
  DATEDIFF(DAY, order_date, GETDATE()) AS days_since_order

-- Get last day of month
SELECT EOMONTH(GETDATE()) AS last_day_of_month

-- Format date for display
SELECT 
  order_date,
  FORMAT(order_date, 'MM/dd/yyyy') AS formatted_date,
  FORMAT(order_date, 'MMMM dd, yyyy') AS long_format

-- Date filtering
SELECT * FROM orders 
WHERE order_date >= DATEADD(DAY, -30, GETDATE())

-- Find records from a specific month
SELECT * FROM sales 
WHERE YEAR(sale_date) = 2024 AND MONTH(sale_date) = 12

-- Quarter extraction and filtering
SELECT 
  order_date,
  DATEPART(QUARTER, order_date) AS quarter,
  YEAR(order_date) AS year

-- Time-based grouping
SELECT 
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  COUNT(*) AS total_orders,
  SUM(amount) AS monthly_revenue
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month
```

### Use Cases:
- Filtering data by date ranges
- Calculating age, tenure, and duration
- Creating delivery/due date schedules
- Analyzing trends over time periods
- Scheduling and deadline management
- Generating time-based reports

---

## Practical Examples {#examples}

### Example 1: E-Commerce Order Analysis

```sql
-- Calculate order details with discount and delivery date
SELECT 
  order_id,
  customer_name,
  order_date,
  quantity,
  unit_price,
  (quantity * unit_price) AS subtotal,
  (quantity * unit_price * discount/100) AS discount_amount,
  (quantity * unit_price * (1 - discount/100)) AS final_amount,
  DATEADD(DAY, 7, order_date) AS estimated_delivery,
  CASE 
    WHEN (quantity * unit_price * (1 - discount/100)) > 500 THEN 'Premium Order'
    WHEN (quantity * unit_price * (1 - discount/100)) > 100 THEN 'Standard Order'
    ELSE 'Small Order'
  END AS order_category
FROM orders
WHERE order_date >= DATEADD(MONTH, -3, GETDATE())
  AND (quantity * unit_price * (1 - discount/100)) > 50
ORDER BY final_amount DESC
```

### Example 2: Employee Payroll Processing

```sql
-- Calculate employee compensation and benefits
SELECT 
  employee_id,
  employee_name,
  DATEDIFF(YEAR, hire_date, GETDATE()) AS years_of_service,
  salary,
  (salary * 0.05) AS pension_contribution,
  (salary * 0.10) AS bonus_amount,
  (salary + (salary * 0.10) - (salary * 0.05)) AS net_compensation,
  CASE 
    WHEN DATEDIFF(YEAR, hire_date, GETDATE()) >= 5 THEN 'Senior'
    WHEN DATEDIFF(YEAR, hire_date, GETDATE()) >= 2 THEN 'Mid-level'
    ELSE 'Junior'
  END AS seniority_level
FROM employees
WHERE salary > 30000
ORDER BY salary DESC
```

### Example 3: Sales Performance Report

```sql
-- Monthly sales analysis with trends
SELECT 
  YEAR(sale_date) AS year,
  MONTH(sale_date) AS month,
  DATENAME(MONTH, sale_date) AS month_name,
  COUNT(*) AS total_transactions,
  SUM(amount) AS total_revenue,
  AVG(amount) AS avg_transaction,
  MIN(amount) AS min_sale,
  MAX(amount) AS max_sale,
  ROUND(AVG(amount), 2) AS rounded_avg,
  DATEDIFF(DAY, DATEADD(MONTH, -1, GETDATE()), GETDATE()) AS days_in_period
FROM sales
WHERE sale_date >= DATEADD(YEAR, -1, GETDATE())
GROUP BY YEAR(sale_date), MONTH(sale_date), DATENAME(MONTH, sale_date)
ORDER BY year, month
```

---

## Key Takeaways

- **Boolean Expressions**: Used for filtering and conditional logic (WHERE, HAVING, CASE)
- **Numeric Expressions**: Used for calculations, aggregations, and statistical analysis
- **Date/Time Expressions**: Used for temporal calculations, scheduling, and time-series analysis
- **Combine expressions**: You can combine multiple expression types for complex queries
- **Best Practices**: 
  - Use parentheses for clarity in complex expressions
  - Use aliases (AS) to name calculated columns
  - Test expressions with sample data before applying to large datasets
  - Consider performance impact of complex calculations on large tables
