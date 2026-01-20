-- ============================================================================
-- SQL OPERATORS - PRACTICAL EXAMPLES
-- ============================================================================

-- Create a sample table for demonstrations
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    bonus DECIMAL(10, 2),
    age INT,
    status VARCHAR(20),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Insert sample data
INSERT INTO employees VALUES
(1, 'John Smith', 'Sales', 50000.00, 5000.00, 28, 'active', 'john@company.com', '555-0101'),
(2, 'Alice Johnson', 'IT', 75000.00, 8000.00, 35, 'active', 'alice@company.com', '555-0102'),
(3, 'Bob Williams', 'HR', 60000.00, 6000.00, 42, 'active', NULL, '555-0103'),
(4, 'Carol Brown', 'Sales', 55000.00, 4500.00, 26, 'inactive', 'carol@company.com', NULL),
(5, 'David Lee', 'IT', 80000.00, 10000.00, 38, 'active', 'david@company.com', '555-0105'),
(6, 'Eva Martinez', 'Finance', 70000.00, 7000.00, 31, 'active', 'eva@company.com', '555-0106'),
(7, 'Frank Wilson', 'HR', 58000.00, 5500.00, 29, 'pending', 'frank@company.com', '555-0107'),
(8, 'Grace Taylor', 'Sales', 52000.00, 4000.00, 24, 'active', NULL, '555-0108');

-- ============================================================================
-- 1. ARITHMETIC OPERATORS
-- ============================================================================

-- Addition: Calculate gross salary (salary + bonus)
SELECT employee_id, name, salary, bonus, (salary + bonus) AS gross_salary
FROM employees;

-- Subtraction: Calculate net salary after deduction
SELECT employee_id, name, salary, (salary - 5000) AS salary_after_deduction
FROM employees;

-- Multiplication: Calculate annual gross salary
SELECT employee_id, name, salary, (salary * 12) AS annual_salary
FROM employees;

-- Division: Calculate average monthly bonus
SELECT employee_id, name, bonus, (bonus / 12) AS monthly_bonus
FROM employees;

-- Modulo: Find employees with even IDs
SELECT employee_id, name
FROM employees
WHERE employee_id % 2 = 0;

-- ============================================================================
-- 2. COMPARISON OPERATORS
-- ============================================================================

-- Equal to (=)
SELECT * FROM employees WHERE status = 'active';

-- Not equal to (!=)
SELECT * FROM employees WHERE status != 'active';

-- Greater than (>)
SELECT * FROM employees WHERE salary > 60000;

-- Less than (<)
SELECT * FROM employees WHERE age < 30;

-- Greater than or equal to (>=)
SELECT * FROM employees WHERE salary >= 70000;

-- Less than or equal to (<=)
SELECT * FROM employees WHERE age <= 35;

-- BETWEEN: Find employees aged 25 to 35
SELECT * FROM employees WHERE age BETWEEN 25 AND 35;

-- NOT BETWEEN: Find employees NOT aged 25 to 35
SELECT * FROM employees WHERE age NOT BETWEEN 25 AND 35;

-- IN: Find employees in specific departments
SELECT * FROM employees WHERE department IN ('Sales', 'IT', 'HR');

-- NOT IN: Find employees NOT in specific departments
SELECT * FROM employees WHERE department NOT IN ('Finance', 'Accounting');

-- LIKE: Find names starting with 'A'
SELECT * FROM employees WHERE name LIKE 'A%';

-- LIKE: Find names containing 'son'
SELECT * FROM employees WHERE name LIKE '%son%';

-- NOT LIKE: Find names not starting with 'J'
SELECT * FROM employees WHERE name NOT LIKE 'J%';

-- IS NULL: Find employees without email
SELECT * FROM employees WHERE email IS NULL;

-- IS NOT NULL: Find employees with phone number
SELECT * FROM employees WHERE phone IS NOT NULL;

-- ============================================================================
-- 3. LOGICAL OPERATORS
-- ============================================================================

-- AND: Both conditions must be true
-- Find active employees earning more than 60000
SELECT * FROM employees
WHERE status = 'active' AND salary > 60000;

-- OR: At least one condition must be true
-- Find employees in Sales or IT department
SELECT * FROM employees
WHERE department = 'Sales' OR department = 'IT';

-- NOT: Negate a condition
-- Find employees who are NOT active
SELECT * FROM employees
WHERE NOT (status = 'active');

-- Complex: Combining AND, OR, NOT
-- Find active employees (in Sales or IT) earning more than 55000
SELECT * FROM employees
WHERE status = 'active' AND (department = 'Sales' OR department = 'IT') AND salary > 55000;

-- ============================================================================
-- 4. OPERATORS USED TO NEGATE CONDITIONS
-- ============================================================================

-- NOT operator with condition
SELECT * FROM employees
WHERE NOT (age < 30);

-- != operator
SELECT * FROM employees WHERE status != 'inactive';

-- NOT LIKE operator
SELECT * FROM employees WHERE name NOT LIKE 'B%';

-- NOT IN operator
SELECT * FROM employees WHERE department NOT IN ('HR', 'Finance');

-- NOT BETWEEN operator
SELECT * FROM employees WHERE salary NOT BETWEEN 50000 AND 70000;

-- IS NOT NULL operator
SELECT * FROM employees WHERE email IS NOT NULL AND phone IS NOT NULL;

-- ============================================================================
-- 5. OPERATOR PRECEDENCE EXAMPLES
-- ============================================================================

-- Example 1: Order matters!
-- Without parentheses - AND is evaluated first
SELECT * FROM employees
WHERE department = 'Sales' OR department = 'HR' AND salary > 60000;
-- This is interpreted as: (department = 'Sales') OR (department = 'HR' AND salary > 60000)

-- Example 2: With parentheses - forces OR to be evaluated first
SELECT * FROM employees
WHERE (department = 'Sales' OR department = 'HR') AND salary > 60000;
-- This finds all Sales or HR employees who earn more than 60000

-- Example 3: Arithmetic precedence
-- Multiplication is evaluated before addition
SELECT employee_id, name, salary, bonus,
       (salary + bonus * 2) AS calculated_1,  -- bonus * 2 first, then add to salary
       ((salary + bonus) * 2) AS calculated_2  -- salary + bonus first, then multiply by 2
FROM employees;

-- Example 4: Comparison with arithmetic
-- Arithmetic operations are evaluated before comparison
SELECT * FROM employees
WHERE salary + bonus > 75000;  -- First calculates salary + bonus, then compares

-- Example 5: Complex precedence example
SELECT * FROM employees
WHERE (age > 25 AND salary > 60000) OR (department = 'IT' AND status = 'active');
-- Parentheses make the logic clear and force evaluation order

-- ============================================================================
-- 6. REAL-WORLD SCENARIOS
-- ============================================================================

-- Scenario 1: Find high-value employees (good salary + bonus)
SELECT employee_id, name, salary, bonus, (salary + bonus) AS total_comp
FROM employees
WHERE (salary + bonus) > 80000
ORDER BY (salary + bonus) DESC;

-- Scenario 2: Find active employees by department with salary filter
SELECT employee_id, name, department, salary
FROM employees
WHERE status = 'active'
AND (department = 'Sales' OR department = 'IT')
AND salary >= 55000
ORDER BY salary DESC;

-- Scenario 3: Find employees missing contact info
SELECT employee_id, name, email, phone
FROM employees
WHERE email IS NULL OR phone IS NULL;

-- Scenario 4: Find employees in certain age range, not in certain departments
SELECT * FROM employees
WHERE age BETWEEN 25 AND 40
AND department NOT IN ('HR', 'Finance')
AND status != 'inactive';

-- Scenario 5: Calculate performance metrics with operators
SELECT 
    employee_id,
    name,
    salary,
    bonus,
    (salary + bonus) AS total_compensation,
    ((salary + bonus) / salary * 100) AS bonus_percentage,
    age,
    CASE WHEN age < 30 THEN 'Junior' WHEN age >= 30 THEN 'Senior' END AS experience_level
FROM employees
WHERE (salary + bonus) > 60000
AND status = 'active'
AND NOT (department = 'HR')
ORDER BY total_compensation DESC;

-- ============================================================================
-- Cleanup (optional)
-- ============================================================================
-- DROP TABLE employees;
