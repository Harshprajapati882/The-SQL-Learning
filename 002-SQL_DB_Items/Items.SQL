-- ============================================
-- SQL EXAMPLES FOR KEY DATABASE CONCEPTS
-- ============================================

-- 1. RDBMS - Creating a Database
-- ============================================
CREATE DATABASE CompanyDB;
USE CompanyDB;


-- 2. TABLE - Creating a Table
-- ============================================
CREATE TABLE Employees (
    ID INT,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);


-- 3. FIELD - Fields in a Table
-- ============================================
-- ID, Name, Position, Department, Salary are all fields in the Employees table


-- 4. RECORD/ROW - Inserting Records
-- ============================================
INSERT INTO Employees VALUES (1, 'John Doe', 'Manager', 'Sales', 50000.00);
INSERT INTO Employees VALUES (2, 'Jane Smith', 'Developer', 'IT', 65000.00);
INSERT INTO Employees VALUES (3, 'Mike Johnson', 'Analyst', 'Finance', 55000.00);


-- 5. COLUMN - Selecting a Column
-- ============================================
SELECT Name FROM Employees;
-- Output: John Doe, Jane Smith, Mike Johnson


-- 6. NULL VALUE - Allowing NULL Values
-- ============================================
CREATE TABLE Employees_Updated (
    ID INT,
    Name VARCHAR(100),
    MiddleName VARCHAR(100) NULL,  -- NULL allowed
    Position VARCHAR(50),
    Phone VARCHAR(15) NULL          -- NULL allowed
);

INSERT INTO Employees_Updated VALUES (1, 'John', NULL, 'Manager', '555-1234');
INSERT INTO Employees_Updated VALUES (2, 'Jane', 'Marie', 'Developer', NULL);


-- 7. CONSTRAINTS - Adding Constraints
-- ============================================
CREATE TABLE Employees_WithConstraints (
    ID INT PRIMARY KEY,              -- PRIMARY KEY constraint
    Name VARCHAR(100) NOT NULL,      -- NOT NULL constraint
    Email VARCHAR(100) UNIQUE,       -- UNIQUE constraint
    Position VARCHAR(50),
    Salary DECIMAL(10, 2) CHECK (Salary > 0)  -- CHECK constraint
);

-- Foreign Key Constraint Example
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL
);

CREATE TABLE EmployeesWithFK (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)  -- FOREIGN KEY constraint
);


-- 8. KEYS - Different Types of Keys
-- ============================================
-- Primary Key Example
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

-- Composite Primary Key Example
CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID)
);

-- Unique Key Example
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    Email VARCHAR(100) UNIQUE
);


-- 9. DATA INTEGRITY - Ensuring Data Integrity
-- ============================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    OrderAmount DECIMAL(10, 2) CHECK (OrderAmount > 0),
    OrderDate DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending'
);

INSERT INTO Orders (CustomerName, OrderAmount, OrderDate) 
VALUES ('Alice Johnson', 150.50, '2026-01-15');

-- Data integrity maintained: Amount must be > 0, all fields have values


-- 10. NORMALIZATION - Reducing Redundancy
-- ============================================

-- BEFORE Normalization (Denormalized)
-- CREATE TABLE CustomerOrders_Denormalized (
--     CustomerID INT,
--     CustomerName VARCHAR(100),
--     CustomerEmail VARCHAR(100),
--     OrderID INT,
--     OrderDate DATE,
--     OrderAmount DECIMAL(10, 2)
-- );

-- AFTER Normalization (1NF, 2NF, 3NF)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerEmail VARCHAR(100)
);

CREATE TABLE Orders_Normalized (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- 11. TYPES - Different Data Types
-- ============================================
CREATE TABLE ProductCatalog (
    ProductID INT,                    -- Integer Type
    ProductName VARCHAR(100),         -- String Type (Variable length)
    Description TEXT,                 -- Large Text Type
    Price DECIMAL(10, 2),            -- Decimal Type
    Stock INT DEFAULT 0,              -- Integer with default
    CreatedDate DATE,                 -- Date Type
    LastUpdated TIMESTAMP,            -- Timestamp Type
    IsActive BOOLEAN                  -- Boolean Type
);

INSERT INTO ProductCatalog VALUES 
(1, 'Laptop', 'High performance laptop', 999.99, 10, '2026-01-01', NOW(), TRUE);
INSERT INTO ProductCatalog VALUES 
(2, 'Mouse', 'Wireless mouse', 29.99, 50, '2026-01-05', NOW(), TRUE);


-- 12. PRACTICAL EXAMPLE - Complete Employee Management System
-- ============================================
CREATE TABLE Department (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    DeptID INT NOT NULL,
    Salary DECIMAL(10, 2) CHECK (Salary >= 0),
    HireDate DATE NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert Sample Data
INSERT INTO Department (DeptName) VALUES ('IT');
INSERT INTO Department (DeptName) VALUES ('Sales');
INSERT INTO Department (DeptName) VALUES ('HR');

INSERT INTO Employee VALUES 
(1, 'John', 'Doe', 'john.doe@company.com', '555-1001', 1, 70000, '2020-05-15');
INSERT INTO Employee VALUES 
(2, 'Sarah', 'Smith', 'sarah.smith@company.com', '555-1002', 2, 60000, '2021-06-20');
INSERT INTO Employee VALUES 
(3, 'Mike', 'Johnson', 'mike.johnson@company.com', NULL, 1, 75000, '2019-03-10');

-- Retrieve all employees with their departments
SELECT e.EmpID, e.FirstName, e.LastName, e.Email, d.DeptName, e.Salary
FROM Employee e
INNER JOIN Department d ON e.DeptID = d.DeptID;
