use RetailStore;


-- schema off the orders table  from the retail store database
-- CREATE TABLE Orders (
-- 	OrderId INT PRIMARY KEY,
--     Product VARCHAR(100),
--     Amount DECIMAL(10,2),
--     CustomerId INT,
--     FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
-- );

DELIMITER $$
CREATE PROCEDURE view_products()
BEGIN
	SELECT product FROM Orders;
END $$
DELIMITER ;

CALL view_products();


DELIMITER $$
CREATE PROCEDURE add_orders(
IN p_orderid INT,
IN p_product VARCHAR(200),
IN p_amount DECIMAL(10,2),
IN p_customerid INT
)
BEGIN
	INSERT INTO Orders (OrderId,Product,Amount,CustomerId) 
    VALUES (p_orderid,p_product,p_amount,p_customerid);
END $$
DELIMITER ;

CALL add_orders(8,'Camera',12000.00,2);