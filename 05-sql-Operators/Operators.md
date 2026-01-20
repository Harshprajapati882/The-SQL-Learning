# SQL Operators

Operators are symbols or keywords used in SQL to perform operations on values, compare values, and combine conditions. They are essential building blocks of SQL queries.

---

## 1. Arithmetic Operators

Arithmetic operators are used to perform mathematical operations on numeric values.

| Operator | Description | Example |
|----------|-------------|---------|
| `+` | Addition | `SELECT salary + 1000 FROM employees;` |
| `-` | Subtraction | `SELECT salary - 500 FROM employees;` |
| `*` | Multiplication | `SELECT price * quantity FROM orders;` |
| `/` | Division | `SELECT total / quantity FROM sales;` |
| `%` | Modulo (Remainder) | `SELECT id % 2 FROM users;` |

### Example:
```sql
-- Calculate gross salary (salary + bonus)
SELECT employee_id, salary, bonus, (salary + bonus) AS gross_salary
FROM employees;

-- Calculate discount price
SELECT product_id, price, (price * 0.9) AS discounted_price
FROM products;

-- Find remainder
SELECT number, number % 3 AS remainder
FROM numbers;
```

---

## 2. Comparison Operators

Comparison operators are used to compare two values and return TRUE or FALSE.

| Operator | Description | Example |
|----------|-------------|---------|
| `=` | Equal to | `WHERE age = 25` |
| `!=` or `<>` | Not equal to | `WHERE status != 'active'` |
| `>` | Greater than | `WHERE salary > 50000` |
| `<` | Less than | `WHERE age < 30` |
| `>=` | Greater than or equal to | `WHERE score >= 80` |
| `<=` | Less than or equal to | `WHERE price <= 100` |
| `BETWEEN` | Between a range | `WHERE age BETWEEN 20 AND 30` |
| `IN` | Matches any value in a list | `WHERE status IN ('active', 'pending')` |
| `LIKE` | Pattern matching | `WHERE name LIKE 'A%'` |
| `IS NULL` | Check if value is NULL | `WHERE email IS NULL` |
| `IS NOT NULL` | Check if value is NOT NULL | `WHERE phone IS NOT NULL` |

### Example:
```sql
-- Find employees with salary greater than 50000
SELECT * FROM employees WHERE salary > 50000;

-- Find employees between 25 and 35 years old
SELECT * FROM employees WHERE age BETWEEN 25 AND 35;

-- Find employees in specific departments
SELECT * FROM employees WHERE department IN ('HR', 'IT', 'Sales');

-- Find names starting with 'A'
SELECT * FROM employees WHERE name LIKE 'A%';

-- Find employees with NULL email
SELECT * FROM employees WHERE email IS NULL;

-- Find employees with non-NULL phone
SELECT * FROM employees WHERE phone IS NOT NULL;
```

---

## 3. Logical Operators

Logical operators are used to combine multiple conditions in a WHERE clause.

| Operator | Description | Example |
|----------|-------------|---------|
| `AND` | Both conditions must be TRUE | `WHERE age > 25 AND salary > 50000` |
| `OR` | At least one condition must be TRUE | `WHERE status = 'active' OR status = 'pending'` |
| `NOT` | Negates the condition | `WHERE NOT (age < 18)` |

### Example:
```sql
-- AND operator: Both conditions must be true
SELECT * FROM employees
WHERE age > 25 AND salary > 50000;

-- OR operator: At least one condition must be true
SELECT * FROM employees
WHERE department = 'HR' OR department = 'IT';

-- NOT operator: Negate a condition
SELECT * FROM employees
WHERE NOT (status = 'inactive');

-- Combining multiple logical operators
SELECT * FROM employees
WHERE (department = 'Sales' OR department = 'IT')
AND salary > 40000
AND NOT (status = 'terminated');
```

---

## 4. Operators Used to Negate Conditions

Negation operators are used to reverse or invert conditions.

| Operator | Description | Example |
|----------|-------------|---------|
| `NOT` | Negates a condition | `WHERE NOT (age < 18)` |
| `!=` or `<>` | Not equal to | `WHERE status != 'inactive'` |
| `NOT LIKE` | Pattern not matching | `WHERE name NOT LIKE 'A%'` |
| `NOT IN` | Does not match any value in list | `WHERE status NOT IN ('inactive', 'deleted')` |
| `NOT BETWEEN` | Not in a range | `WHERE age NOT BETWEEN 18 AND 30` |
| `IS NOT NULL` | Value is not NULL | `WHERE phone IS NOT NULL` |

### Example:
```sql
-- NOT operator
SELECT * FROM employees WHERE NOT (age < 25);

-- != operator
SELECT * FROM employees WHERE status != 'inactive';

-- NOT LIKE operator
SELECT * FROM employees WHERE name NOT LIKE 'J%';

-- NOT IN operator
SELECT * FROM employees WHERE department NOT IN ('HR', 'Accounting');

-- NOT BETWEEN operator
SELECT * FROM employees WHERE salary NOT BETWEEN 30000 AND 50000;

-- IS NOT NULL operator
SELECT * FROM employees WHERE middle_name IS NOT NULL;
```

---

## 5. SQL Operator Precedence

Operator precedence determines the order in which operators are evaluated in SQL expressions. Operators with higher precedence are evaluated before operators with lower precedence.

### Precedence Order (Highest to Lowest):

1. **Parentheses** `( )`
2. **Multiplication, Division, Modulo** `*, /, %`
3. **Addition, Subtraction** `+, -`
4. **Comparison Operators** `=, !=, <>, <, >, <=, >=, LIKE, IN, BETWEEN`
5. **NOT**
6. **AND**
7. **OR**

### Important Notes:

- **Parentheses** have the highest precedence and are used to override default precedence.
- **Arithmetic operations** are evaluated before **comparison operations**.
- **NOT** is evaluated before **AND**.
- **AND** is evaluated before **OR**.
- Use parentheses to make your expressions clear and avoid ambiguity.

### Examples:

```sql
-- Without parentheses (confusing):
-- AND is evaluated before OR
SELECT * FROM employees
WHERE department = 'Sales' OR department = 'HR' AND salary > 50000;
-- This means: (department = 'Sales') OR (department = 'HR' AND salary > 50000)

-- With parentheses (clear):
-- All Sales employees OR HR employees with salary > 50000
SELECT * FROM employees
WHERE (department = 'Sales') OR (department = 'HR' AND salary > 50000);

-- With parentheses (different meaning):
-- All employees from Sales or HR departments with salary > 50000
SELECT * FROM employees
WHERE (department = 'Sales' OR department = 'HR') AND salary > 50000;
```

---

## Operator Examples Cheat Sheet

```sql
-- ARITHMETIC
SELECT price * quantity AS total FROM orders;
SELECT salary + bonus AS gross_salary FROM employees;

-- COMPARISON
SELECT * FROM products WHERE price > 100;
SELECT * FROM users WHERE age BETWEEN 25 AND 35;
SELECT * FROM products WHERE status IN ('active', 'available');

-- LOGICAL
SELECT * FROM orders WHERE customer_id = 5 AND status = 'completed';
SELECT * FROM employees WHERE department = 'Sales' OR department = 'IT';

-- NEGATION
SELECT * FROM products WHERE price != 100;
SELECT * FROM employees WHERE status NOT IN ('inactive');
SELECT * FROM users WHERE age NOT BETWEEN 18 AND 65;

-- PRECEDENCE
SELECT * FROM employees
WHERE (age > 25 AND salary > 50000) OR (department = 'Manager');
```

---

## Key Takeaways

- **Arithmetic operators** perform mathematical calculations
- **Comparison operators** compare values and return boolean results
- **Logical operators** combine multiple conditions
- **Negation operators** reverse or invert conditions
- **Operator precedence** determines evaluation order; use parentheses for clarity
- Always use parentheses to make complex conditions more readable and avoid mistakes
