-- ==============================================
-- Sub-queries, views, index, stored procedures
-- ==============================================

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

CREATE DATABASE joins;

USE joins;

CREATE TABLE IF NOT EXISTS customers (
	customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);


INSERT INTO customers VALUES
(1, 'alice', 'mumbai'),
(2, 'bob', 'delhi'),
(3, 'charlie', 'banglore'),
(4, 'david', 'mumbai');

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    amount int
);

INSERT INTO orders VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

SELECT * FROM customers;
SELECT * FROM orders;


-- creating a sub-query
SELECT * 
FROM orders
WHERE amount > (
	SELECT AVG(amount)
    FROM orders
);

-- Views

CREATE VIEW view1 AS
SELECT customer_id, name FROM customers;

SELECT * FROM view1;

DROP VIEW view2;
DROP VIEW view1;

-- views using inner join
CREATE VIEW view2 AS
SELECT c.customer_id, c.name, o.order_id
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT * FROM view2;

CREATE TABLE IF NOT EXISTS accounts(
	account_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance DECIMAL(10, 2),
    branch VARCHAR(50)
);

INSERT INTO accounts VALUES
(1, 'Adam', 500.00, 'Mumbai'),
(2, 'Bob', 300.00, 'Delhi'),
(3, 'Charlie', 700.00, 'Banglore'),
(4, 'David', 1000.00, 'Noida');

SELECT * FROM accounts;

-- INDEX 

CREATE INDEX idx_branch ON accounts(branch);

SHOW INDEX FROM accounts;

DROP INDEX idx_branch ON accounts;

-- Stored procedures

DELIMITER $$
CREATE PROCEDURE check_balance(IN acc_id INT, OUT bal DECIMAL(10, 2))
BEGIN
	SELECT balance INTO bal
    FROM accounts
    WHERE account_id = acc_id;
END $$
DELIMITER ;

-- Call procedure
CALL check_balance(1, @balance);
SELECT @balance;

-- Drop procedure
DROP PROCEDURE IF EXISTS check_balance;
