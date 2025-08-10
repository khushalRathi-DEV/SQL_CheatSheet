CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

CREATE TABLE IF NOT EXISTS Customers(
CustomerId INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100),
Email VARCHAR(100) UNIQUE,
Address VARCHAR(200)
);

INSERT INTO Customers(Name, Email, Address) VALUES
('Khushal', 'kr95945@gmail.com', 'Rajasthan, India'),
('Aarav Mehta', 'aarav.m@gmail.com', 'Mumbai, Maharashtra, India'),
('Priya Sharma', 'priya.sharma89@yahoo.com', 'Delhi, India'),
('Rohan Verma', 'rohan.v123@outlook.com', 'Bangalore, Karnataka, India'),
('Sneha Patel', 'sneha_patel@gmail.com', 'Delhi, India');

SELECT * FROM Customers;
SELECT Name FROM Customers;
SELECT DISTINCT Address FROM Customers;

/*we can update like this since email is unique , if we try to update using name or use address we get error
either we need to use a unique or primary key field */
UPDATE Customers SET Address = 'Delhi, India' WHERE Email = 'sneha_patel@gmail.com'; 

-- USING LIKE for matching patterns ,with WILDCARDS - ("%","_")
-- 🔹 SQL LIKE Wildcards
-- 1. % — Percent Sign
-- Meaning: Matches zero or more characters.
-- Matches any name that starts with 'Jo'
-- SELECT * FROM employees WHERE name LIKE 'Jo%';

-- Matches any name that ends with 'n'
-- SELECT * FROM employees WHERE name LIKE '%n';

-- Matches any name that contains 'an'
-- SELECT * FROM employees WHERE name LIKE '%an%';

-- Use: When you don’t know how many characters (or any) might appear in a position.

-- 2. _ — Underscore
-- Meaning: Matches exactly one character.

-- Matches any 4-letter name starting with 'J' and ending with 'n'
-- SELECT * FROM employees WHERE name LIKE 'J__n';

-- Matches names where the second letter is 'a'
-- 	SELECT * FROM employees WHERE name LIKE '_a%';

-- Use: When you want to match a single unknown character at a specific position.

SELECT * FROM Customers WHERE Address LIKE '%Delhi%';  
SELECT * FROM Customers WHERE Address NOT LIKE '%Mumbai%';

SELECT * FROM Customers ORDER BY Name ASC; -- by default its sortes in ascending 
SELECT * FROM Customers ORDER BY CustomerId DESC;

ALTER TABLE Customers ADD COLUMN City VARCHAR(50);
UPDATE Customers SET City = 'Pune' WHERE Address LIKE '%Maharashtra%';

DELETE FROM Customers WHERE Address LIKE '%Maharashtra%'; -- this query delete all customers from maharashtra


