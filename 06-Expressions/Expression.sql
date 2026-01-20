-- ============================================================================
-- SQL EXPRESSIONS - PRACTICAL CODE EXAMPLES
-- ============================================================================
-- This file contains working examples of Boolean, Numeric, and Date/Time 
-- expressions in SQL with sample data
-- ============================================================================

-- ============================================================================
-- PART 1: BOOLEAN EXPRESSIONS
-- ============================================================================

-- Example 1.1: Simple comparison operators
SELECT * 
FROM employees 
WHERE salary > 50000;

-- Example 1.2: Equal and Not Equal
SELECT * 
FROM employees 
WHERE department = 'Sales';

SELECT * 
FROM employees 
WHERE department != 'IT';

-- Example 1.3: AND operator (both conditions must be TRUE)
SELECT employee_id, name, department, salary 
FROM employees 
WHERE salary > 50000 AND department = 'Sales';

-- Example 1.4: OR operator (at least one condition must be TRUE)
SELECT employee_id, name, department 
FROM employees 
WHERE department = 'Sales' OR department = 'Marketing' OR department = 'IT';

-- Example 1.5: NOT operator
SELECT employee_id, name, status 
FROM employees 
WHERE NOT (status = 'Inactive');

-- Example 1.6: IN operator (cleaner than multiple OR)
SELECT employee_id, name, department 
FROM employees 
WHERE department IN ('Sales', 'Marketing', 'IT');

-- Example 1.7: BETWEEN operator
SELECT employee_id, name, salary 
FROM employees 
WHERE salary BETWEEN 40000 AND 80000;

-- Example 1.8: LIKE operator (pattern matching)
SELECT employee_id, name, email 
FROM employees 
WHERE name LIKE '%John%';

-- Example 1.9: IS NULL / IS NOT NULL
SELECT employee_id, name, email 
FROM employees 
WHERE email IS NOT NULL;

-- Example 1.10: Complex boolean expression
SELECT 
    employee_id, 
    name, 
    department, 
    salary,
    (salary * 1.1) AS projected_salary 
FROM employees 
WHERE (salary > 40000 AND department = 'IT') 
  AND NOT (status = 'On Leave')
  AND (salary * 1.1) > 55000;

-- ============================================================================
-- PART 2: NUMERIC EXPRESSIONS
-- ============================================================================

-- Example 2.1: Basic arithmetic operations
SELECT 
    product_id,
    product_name,
    unit_price,
    quantity_in_stock,
    (unit_price * quantity_in_stock) AS total_inventory_value 
FROM products;

-- Example 2.2: Percentage calculations
SELECT 
    employee_id,
    name,
    salary,
    (salary * 0.10) AS ten_percent_bonus,
    (salary * 0.05) AS five_percent_raise 
FROM employees;

-- Example 2.3: Discount and final price
SELECT 
    product_id,
    product_name,
    unit_price,
    discount_percent,
    (unit_price * (1 - discount_percent/100)) AS final_price,
    (unit_price * discount_percent/100) AS discount_amount 
FROM products 
WHERE discount_percent > 0;

-- Example 2.4: Aggregate functions - SUM, AVG, COUNT, MIN, MAX
SELECT 
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary,
    SUM(salary) AS total_payroll,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary 
FROM employees;

-- Example 2.5: Aggregate by department
SELECT 
    department,
    COUNT(*) AS employee_count,
    ROUND(AVG(salary), 2) AS avg_salary,
    SUM(salary) AS total_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary 
FROM employees 
GROUP BY department 
ORDER BY total_salary DESC;

-- Example 2.6: Mathematical functions - ROUND, ABS, SQRT
SELECT 
    product_id,
    product_name,
    unit_price,
    quantity_sold,
    ROUND((unit_price * quantity_sold), 2) AS total_revenue,
    ABS(10.567) AS absolute_value,
    ROUND(3.14159, 2) AS rounded_pi 
FROM products;

-- Example 2.7: CASE statement with numeric expressions
SELECT 
    employee_id,
    name,
    salary,
    CASE 
        WHEN salary < 40000 THEN 'Entry Level'
        WHEN salary < 60000 THEN 'Mid Level'
        WHEN salary < 80000 THEN 'Senior Level'
        ELSE 'Executive'
    END AS salary_category,
    CASE 
        WHEN salary < 50000 THEN (salary * 0.08)
        WHEN salary < 75000 THEN (salary * 0.10)
        ELSE (salary * 0.12)
    END AS bonus_amount 
FROM employees;

-- Example 2.8: Complex numeric expression (ROI calculation)
SELECT 
    project_id,
    project_name,
    budget,
    actual_cost,
    revenue_generated,
    (revenue_generated - actual_cost) AS profit,
    ROUND(((revenue_generated - actual_cost) / actual_cost * 100), 2) AS roi_percentage 
FROM projects 
WHERE actual_cost > 0;

-- Example 2.9: Filtering with numeric expressions
SELECT 
    order_id,
    customer_id,
    order_amount,
    (order_amount * 0.15) AS tax,
    (order_amount * 1.15) AS total_with_tax 
FROM orders 
WHERE (order_amount * 1.15) > 1000;

-- Example 2.10: Running totals and calculations
SELECT 
    month,
    sales,
    (sales * 0.10) AS commission,
    (sales - (sales * 0.10)) AS net_sales,
    SUM(sales) OVER (ORDER BY month) AS cumulative_sales 
FROM monthly_sales;

-- ============================================================================
-- PART 3: DATE AND TIME EXPRESSIONS
-- ============================================================================

-- Example 3.1: Get current date and time
SELECT 
    GETDATE() AS current_date_time,
    NOW() AS current_timestamp;

-- Example 3.2: Extract parts from dates
SELECT 
    order_id,
    order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day,
    DATENAME(WEEKDAY, order_date) AS day_of_week 
FROM orders;

-- Example 3.3: Date arithmetic - Add days
SELECT 
    order_id,
    order_date,
    DATEADD(DAY, 7, order_date) AS delivery_date_7_days,
    DATEADD(DAY, 30, order_date) AS delivery_date_30_days 
FROM orders;

-- Example 3.4: Date arithmetic - Add months
SELECT 
    employee_id,
    name,
    hire_date,
    DATEADD(MONTH, 3, hire_date) AS three_month_review,
    DATEADD(MONTH, 12, hire_date) AS one_year_anniversary 
FROM employees;

-- Example 3.5: Date arithmetic - Add years
SELECT 
    employee_id,
    name,
    hire_date,
    DATEADD(YEAR, 5, hire_date) AS five_year_milestone,
    DATEADD(YEAR, 10, hire_date) AS ten_year_milestone 
FROM employees;

-- Example 3.6: Calculate age from birth date
SELECT 
    employee_id,
    name,
    birth_date,
    DATEDIFF(YEAR, birth_date, GETDATE()) AS age,
    DATEDIFF(MONTH, birth_date, GETDATE()) AS age_in_months 
FROM employees;

-- Example 3.7: Calculate days since event
SELECT 
    order_id,
    order_date,
    DATEDIFF(DAY, order_date, GETDATE()) AS days_since_order,
    DATEDIFF(DAY, order_date, GETDATE()) / 7 AS weeks_since_order 
FROM orders;

-- Example 3.8: End of month calculation
SELECT 
    order_date,
    EOMONTH(order_date) AS last_day_of_month,
    EOMONTH(GETDATE()) AS current_month_end 
FROM orders;

-- Example 3.9: Format dates for display
SELECT 
    order_id,
    order_date,
    FORMAT(order_date, 'MM/dd/yyyy') AS us_format,
    FORMAT(order_date, 'dd/MM/yyyy') AS european_format,
    FORMAT(order_date, 'MMMM dd, yyyy') AS long_format,
    FORMAT(order_date, 'yyyy-MM-dd') AS iso_format 
FROM orders;

-- Example 3.10: Quarter extraction
SELECT 
    order_id,
    order_date,
    YEAR(order_date) AS year,
    DATEPART(QUARTER, order_date) AS quarter,
    CASE 
        WHEN DATEPART(QUARTER, order_date) = 1 THEN 'Q1'
        WHEN DATEPART(QUARTER, order_date) = 2 THEN 'Q2'
        WHEN DATEPART(QUARTER, order_date) = 3 THEN 'Q3'
        ELSE 'Q4'
    END AS quarter_label 
FROM orders;

-- Example 3.11: Filter records from last 30 days
SELECT * 
FROM orders 
WHERE order_date >= DATEADD(DAY, -30, GETDATE());

-- Example 3.12: Filter records from specific month
SELECT 
    order_id,
    order_date,
    amount 
FROM orders 
WHERE YEAR(order_date) = 2024 AND MONTH(order_date) = 12;

-- Example 3.13: Find records from current year
SELECT 
    employee_id,
    name,
    hire_date 
FROM employees 
WHERE YEAR(hire_date) = YEAR(GETDATE());

-- Example 3.14: Date range filtering
SELECT 
    order_id,
    order_date,
    amount 
FROM orders 
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';

-- ============================================================================
-- PART 4: COMBINED EXPRESSIONS (Boolean + Numeric + Date/Time)
-- ============================================================================

-- Example 4.1: E-Commerce Order Summary with all expression types
SELECT 
    order_id,
    customer_id,
    order_date,
    FORMAT(order_date, 'MMMM dd, yyyy') AS formatted_date,
    DATEDIFF(DAY, order_date, GETDATE()) AS days_ago,
    quantity,
    unit_price,
    (quantity * unit_price) AS subtotal,
    discount_percent,
    (quantity * unit_price * (1 - discount_percent/100)) AS final_amount,
    DATEADD(DAY, 7, order_date) AS estimated_delivery,
    CASE 
        WHEN (quantity * unit_price * (1 - discount_percent/100)) > 500 THEN 'High Value'
        WHEN (quantity * unit_price * (1 - discount_percent/100)) > 100 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category,
    CASE 
        WHEN DATEDIFF(DAY, order_date, GETDATE()) > 30 THEN 'Old Order'
        WHEN DATEDIFF(DAY, order_date, GETDATE()) > 7 THEN 'Recent Order'
        ELSE 'New Order'
    END AS order_age_category 
FROM orders 
WHERE (quantity * unit_price * (1 - discount_percent/100)) > 50 
  AND order_date >= DATEADD(MONTH, -3, GETDATE())
ORDER BY final_amount DESC;

-- Example 4.2: Employee Performance Report with all expression types
SELECT 
    employee_id,
    name,
    department,
    hire_date,
    DATEDIFF(YEAR, hire_date, GETDATE()) AS years_of_service,
    salary,
    (salary * 0.10) AS performance_bonus,
    (salary + (salary * 0.10)) AS total_compensation,
    CASE 
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) >= 5 THEN 'Senior'
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) >= 2 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS seniority_level,
    CASE 
        WHEN salary < 40000 THEN 'Below Average'
        WHEN salary < 60000 THEN 'Average'
        ELSE 'Above Average'
    END AS salary_range,
    CASE 
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) >= 5 THEN 'Eligible for Long-Service Leave'
        ELSE 'Not Yet Eligible'
    END AS leave_eligibility 
FROM employees 
WHERE department IN ('Sales', 'IT', 'Marketing') 
  AND salary > 35000 
ORDER BY department, salary DESC;

-- Example 4.3: Sales Performance Analysis with all expression types
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    DATENAME(MONTH, sale_date) AS month_name,
    FORMAT(DATEADD(MONTH, DATEDIFF(MONTH, 0, sale_date), 0), 'yyyy-MM') AS year_month,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_revenue,
    ROUND(AVG(amount), 2) AS avg_transaction,
    MIN(amount) AS min_sale,
    MAX(amount) AS max_sale,
    DATEDIFF(DAY, DATEADD(MONTH, DATEDIFF(MONTH, 0, sale_date), 0), GETDATE()) AS days_in_current_period 
FROM sales 
WHERE sale_date >= DATEADD(YEAR, -1, GETDATE()) 
  AND amount > 0
GROUP BY YEAR(sale_date), MONTH(sale_date), DATENAME(MONTH, sale_date), 
         DATEADD(MONTH, DATEDIFF(MONTH, 0, sale_date), 0)
ORDER BY year DESC, month DESC;

-- Example 4.4: Project ROI Analysis with all expression types
SELECT 
    project_id,
    project_name,
    start_date,
    end_date,
    DATEDIFF(DAY, start_date, end_date) AS project_duration_days,
    DATEDIFF(MONTH, start_date, end_date) AS project_duration_months,
    DATEDIFF(DAY, end_date, GETDATE()) AS days_since_completion,
    budget,
    actual_cost,
    (budget - actual_cost) AS budget_variance,
    CASE 
        WHEN (budget - actual_cost) >= 0 THEN 'Under Budget'
        ELSE 'Over Budget'
    END AS budget_status,
    revenue_generated,
    (revenue_generated - actual_cost) AS profit,
    ROUND(((revenue_generated - actual_cost) / actual_cost * 100), 2) AS roi_percentage,
    CASE 
        WHEN ((revenue_generated - actual_cost) / actual_cost * 100) > 50 THEN 'Excellent ROI'
        WHEN ((revenue_generated - actual_cost) / actual_cost * 100) > 20 THEN 'Good ROI'
        ELSE 'Fair ROI'
    END AS roi_category 
FROM projects 
WHERE end_date <= GETDATE() 
  AND actual_cost > 0
ORDER BY roi_percentage DESC;

-- ============================================================================
-- PART 5: REAL-WORLD SCENARIOS
-- ============================================================================

-- Scenario 1: Customer Acquisition Analysis
-- Find high-value customers acquired in the last 6 months
SELECT 
    customer_id,
    customer_name,
    registration_date,
    DATEDIFF(DAY, registration_date, GETDATE()) AS days_as_customer,
    total_purchases,
    total_spent,
    ROUND(AVG(total_spent), 2) AS avg_order_value,
    CASE 
        WHEN DATEDIFF(DAY, registration_date, GETDATE()) <= 30 THEN 'New'
        WHEN DATEDIFF(DAY, registration_date, GETDATE()) <= 90 THEN 'Recent'
        ELSE 'Established'
    END AS customer_stage,
    CASE 
        WHEN total_spent > 1000 THEN 'VIP'
        WHEN total_spent > 500 THEN 'Premium'
        ELSE 'Standard'
    END AS customer_tier 
FROM customers 
WHERE registration_date >= DATEADD(MONTH, -6, GETDATE()) 
  AND total_spent > 100
ORDER BY total_spent DESC;

-- Scenario 2: Inventory Management
-- Identify products with low stock or high carrying costs
SELECT 
    product_id,
    product_name,
    quantity_in_stock,
    unit_cost,
    (quantity_in_stock * unit_cost) AS total_inventory_value,
    reorder_point,
    CASE 
        WHEN quantity_in_stock <= reorder_point THEN 'REORDER NEEDED'
        WHEN quantity_in_stock <= (reorder_point * 1.5) THEN 'LOW STOCK'
        ELSE 'ADEQUATE STOCK'
    END AS stock_status,
    CASE 
        WHEN (quantity_in_stock * unit_cost) > 10000 THEN 'High Value Inventory'
        WHEN (quantity_in_stock * unit_cost) > 5000 THEN 'Medium Value Inventory'
        ELSE 'Low Value Inventory'
    END AS inventory_value_category 
FROM inventory 
WHERE quantity_in_stock > 0 
  AND (quantity_in_stock <= (reorder_point * 2) OR (quantity_in_stock * unit_cost) > 5000)
ORDER BY total_inventory_value DESC;

-- Scenario 3: Employee Compensation Analysis
-- Calculate fair compensation and identify outliers
SELECT 
    employee_id,
    name,
    department,
    salary,
    (SELECT AVG(salary) FROM employees WHERE department = e.department) AS dept_avg_salary,
    (salary - (SELECT AVG(salary) FROM employees WHERE department = e.department)) AS salary_vs_dept_avg,
    CASE 
        WHEN salary > (SELECT AVG(salary) FROM employees WHERE department = e.department) * 1.2 THEN 'Above Market'
        WHEN salary < (SELECT AVG(salary) FROM employees WHERE department = e.department) * 0.8 THEN 'Below Market'
        ELSE 'Market Rate'
    END AS compensation_status 
FROM employees e 
WHERE department IN ('Sales', 'IT', 'Marketing');

-- ============================================================================
-- END OF SQL EXPRESSIONS EXAMPLES
-- ============================================================================
