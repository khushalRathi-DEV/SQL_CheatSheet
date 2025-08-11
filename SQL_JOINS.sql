CREATE DATABASE IF NOT EXISTS RetailStore;
USE RetailStore;

CREATE TABLE Customers (
	CustomerId INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50)
);

CREATE TABLE Orders (
	OrderId INT PRIMARY KEY,
    Product VARCHAR(100),
    Amount DECIMAL(10,2),
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

-- Customers Table 
INSERT INTO Customers (CustomerName) VALUES ('Alice Johnson');
INSERT INTO Customers (CustomerName) VALUES ('Bob Smith');     
INSERT INTO Customers (CustomerName) VALUES ('Charlie Brown');
INSERT INTO Customers (CustomerName) VALUES ('Ruth Khadka');
-- Products table
INSERT INTO Orders (OrderId, Product, Amount, CustomerId) VALUES
(1, 'Laptop', 999.99, 1),
(2, 'Smartphone', 599.99, 2),
(3, 'Headphones', 199.50, 3),
(4, 'Monitor', 249.99, 2),
(5, 'Keyboard', 49.99, 3),
(7, 'Tripod', 999.99, null);

SELECT * FROM Customers;

-- INNER JOIN // THIS is the defaulyt join in sql
SELECT Customers.CustomerName,Orders.Product,Orders.Amount 
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerId = Orders.CustomerId;

-- LEFT JOIN
SELECT Customers.CustomerName,Orders.Product,Orders.Amount 
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerId = Orders.CustomerId;

-- RIGHT JOIN 
SELECT Customers.CustomerName,Orders.Product,Orders.Amount 
FROM Customers
RIGHT JOIN Orders 
ON Customers.CustomerId = Orders.CustomerId;

-- FULL OUTER JOIN (we dont have it in sql ,so we can take the union of left and right join in ordere to make it or simulate it)
-- LEFT JOIN
SELECT Customers.CustomerName,Orders.Product,Orders.Amount 
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerId = Orders.CustomerId

UNION
-- RIGHT JOIN 
SELECT Customers.CustomerName,Orders.Product,Orders.Amount 
FROM Customers
RIGHT JOIN Orders 
ON Customers.CustomerId = Orders.CustomerId;
