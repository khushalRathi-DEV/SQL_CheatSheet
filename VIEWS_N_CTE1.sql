CREATE DATABASE IF NOT EXISTS SimpleStore2;
USE SimpleStore2;

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

-- SUBQUERIES
SELECT Product,Category,Amount 
FROM Sales
WHERE Amount > (SELECT AVG(Amount) FROM Sales);

-- CTE COMMON TABLE EXPRESSION 
WITH CategoryTotals AS (
	SELECT Category ,SUM(Amount) AS TotalSales
    FROM Sales
	GROUP BY Category	
)
-- USING CTE
SELECT Category,TotalSales
FROM CategoryTotals 
WHERE TotalSales > 1000;


-- CREATING VIEW
CREATE VIEW CategorySales AS
SELECT Category, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY Category;

-- USING VIEW
SELECT * FROM CategorySales WHERE TotalSales > 4000;

