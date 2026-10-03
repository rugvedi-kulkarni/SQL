-- ==============================================
-- Joins in SQL
-- ==============================================

DROP DATABASE IF EXISTS joins;
DROP TABLE IF EXISTS customers;

CREATE DATABASE joins;

USE joins;

DROP TABLE IF EXISTS customers;

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

DROP TABLE IF EXISTS orders;

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

-- inner join
SELECT *
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- left join 
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- right join
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- outer join
SELECT * 
FROM customers AS c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT * 
FROM customers AS c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- cross join
-- in cross join each row in the table1 is combined with each row of 2nd table
SELECT *
FROM customers
CROSS JOIN orders;

-- self join
-- it is regular to inner join but the table is joined to itself, it works from left to right
SELECT * 
FROM customers as A
JOIN customers AS B
ON A.customer_id = B.customer_id;

-- Practise Questions
-- left Exclusive join
SELECT *
FROM customers as A
LEFT JOIN orders AS B
ON A.customer_id = B.customer_id
WHERE B.customer_id IS NULL;

-- right Exclusive join
SELECT *
FROM customers AS A
RIGHT JOIN orders AS B
ON A.customer_id = B.customer_id
WHERE A.customer_id IS NULL;

SELECT * FROM customers;
