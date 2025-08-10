CREATE DATABASE IF NOT EXISTS SimpleStore;
USE SimpleStore;

CREATE TABLE Sales (
	SalesId INT PRIMARY KEY AUTO_INCREMENT,
    Product VARCHAR(100),
    Category VARCHAR(100),
    Amount DECIMAL(10,2),
    SaleDate DATE 
);


INSERT INTO Sales (Product, Category, Amount, SaleDate) VALUES
('Pen', 'Stationary', 25.00, '2025-03-01'),
('Notebook', 'Stationary', 50.00, '2025-03-01'),
('Mouse', 'Electronics', 500.00, '2025-03-02'),
('Keyboard', 'Electronics', 700.00, '2025-03-02'),
('Charger', 'Electronics', 300.00, '2025-03-03'),
('Bag', 'Accessories', 1000.00, '2025-03-04'),
('Headphones', 'Electronics', 1200.00, '2025-03-04'),
('Water Bottle', 'Accessories', 200.00, '2025-03-05'),
('Marker', 'Stationary', 15.00, '2025-03-05'),
('Laptop', 'Electronics', 50000.00, '2025-03-06'),
('Tablet', 'Electronics', 25000.00, '2025-03-06'),
('Desk Organizer', 'Accessories', 800.00, '2025-03-07'),
('Stapler', 'Stationary', 100.00, '2025-03-07'),
('Smartwatch', 'Electronics', 7500.00, '2025-03-08'),
('Backpack', 'Accessories', 1500.00, '2025-03-08');

SELECT COUNT(*) FROM Sales;	-- gives row count
SELECT SUM(Amount) FROM Sales;  -- gives the total sales 
SELECT AVG(Amount) FROM Sales; -- gives the avg amount
SELECT MIN(Amount),MAX(Amount) FROM Sales; -- gives the min and max amount


-- GROUP BY 
-- finding the total sales of each category
SELECT Category,SUM(Amount) FROM Sales GROUP BY Category; -- gives us the sales of a particular category

-- ADDITIONALLY SORTING THE O/P ACC TO THE SALES AMOUNT OF EACDH CATEGORY
SELECT Category,SUM(Amount) AS SALE FROM Sales GROUP BY Category ORDER BY SALE;

-- Taking it even a step forward using the having clause
-- HAVING CLAUSE
-- The HAVING clause in SQL is used to filter the results of a GROUP BY operation.
--  While the WHERE clause filters rows before grouping, the HAVING clause filters after the grouping and aggregation 
-- (like SUM(), AVG(), COUNT(), etc.) has been performed.

-- ex -
-- If you want to find customers who spent more than 200 in total, you can use:
-- SELECT Customer, SUM(Amount) AS TotalSpent
-- FROM Orders
-- GROUP BY Customer
-- HAVING SUM(Amount) > 200;

SELECT Category ,SUM(Amount) FROM Sales GROUP BY Category HAVING SUM(Amount) < 1000; -- returns the category with total sales less than 1000
