CREATE DATABASE CompanyDB;
USE CompanyDB;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Email VARCHAR(100),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (FirstName, LastName, Department, Email, Salary) VALUES
('Alice', 'Johnson', 'HR', 'alice.johnson@example.com', 55000.00),
('Bob', 'Smith', 'IT', 'bob.smith@example.com', 72000.00),
('Carol', 'White', 'Finance', 'carol.white@example.com', 65000.00),
('David', 'Brown', 'IT', 'david.brown@example.com', 73000.00),
('Eve', 'Black', 'HR', 'eve.black@example.com', 54000.00),
('Frank', 'Green', 'Finance', 'frank.green@example.com', 67000.00),
('Grace', 'Taylor', 'IT', 'grace.taylor@example.com', 75000.00);

-- SELECT * WITHOUT ANY INDEX (This will be slower as data grows)
SELECT * FROM Employees WHERE Department = 'IT';

--  CREATE AN INDEX ON DEPARTMENT COLUMN TO SPEED UP SEARCH
CREATE INDEX idx_department ON Employees(Department);

-- NOW THE SAME QUERY WILL BE FASTER DUE TO THE INDEX
SELECT * FROM Employees WHERE Department = 'IT';

-- CREATE A UNIQUE INDEX (e.g., on Email, to prevent duplicate emails)
CREATE UNIQUE INDEX idx_unique_email ON Employees(Email);

-- now if we try to insert duplicaye email we get an error
-- INSERT INTO Employees (FirstName, LastName, Department, Email, Salary)
-- VALUES ('Test', 'User', 'IT', 'alice.johnson@example.com', 60000.00);

--  CREATE A COMPOSITE INDEX (multi-column) FOR QUERIES THAT USE BOTH
CREATE INDEX idx_dept_salary ON Employees(Department, Salary);

--  SAMPLE QUERY USING BOTH COLUMNS IN WHERE CLAUSE
SELECT * FROM Employees WHERE Department = 'Finance' AND Salary > 60000;

--  DROP INDEX IF NEEDED
-- DROP INDEX idx_department ON Employees;

--  VIEW ALL INDEXES ON THE EMPLOYEES TABLE
SHOW INDEX FROM Employees;
