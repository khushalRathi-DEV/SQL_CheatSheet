CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

INSERT INTO Employees (ID, Name, Department, Salary) VALUES
(1, 'Alice', 'IT', 5000),
(2, 'Bob', 'HR', 4500),
(3, 'Carol', 'IT', 5500),
(4, 'Dave', 'HR', 4800);


-- CTE (Exists only during execution of the main query.)
WITH IT_Employees AS (
    SELECT *
    FROM Employees
    WHERE Department = 'IT'
)
SELECT Name, Salary
FROM IT_Employees;

WITH DeptAvgSalary AS (
    SELECT Department, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY Department
)
SELECT *
FROM DeptAvgSalary;


-- VIEW
CREATE VIEW IT_DEPT AS
SELECT * FROM Employees WHERE Department = 'IT';

-- using view
SELECT * FROM IT_DEPT;
