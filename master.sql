-- =====================================================
-- CREATE DATABASE
-- =====================================================

DROP DATABASE IF EXISTS OnlineStore;

CREATE DATABASE OnlineStore;

USE OnlineStore;


-- =====================================================
-- 1. CREATE SUPPLIERS TABLE
-- =====================================================

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

DROP TABLE IF EXISTS Suppliers;

-- =====================================================
-- 2. CREATE CUSTOMERS TABLE
-- =====================================================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    age INT,
    registration_date DATE
);

DROP TABLE IF EXISTS Customers;

-- =====================================================
-- 3. CREATE PRODUCTS TABLE
-- =====================================================

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    supplier_id INT,

    FOREIGN KEY (supplier_id)
        REFERENCES Suppliers(supplier_id)
);

DROP TABLE IF EXISTS Products;

-- =====================================================
-- 4. CREATE ORDERS TABLE
-- =====================================================

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);


-- =====================================================
-- 5. CREATE ORDER_ITEMS TABLE
-- =====================================================

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);


-- =====================================================
-- INSERT DATA INTO SUPPLIERS
-- =====================================================

INSERT INTO Suppliers
(supplier_id, supplier_name, city)
VALUES
(1, 'TechWorld Supplies', 'Pune'),
(2, 'Global Electronics', 'Mumbai'),
(3, 'Smart Goods Pvt Ltd', 'Delhi'),
(4, 'Prime Distributors', 'Bangalore'),
(5, 'Quality Products Co', 'Hyderabad'),
(6, 'MegaMart Suppliers', 'Chennai'),
(7, 'Reliable Traders', 'Pune'),
(8, 'FutureTech Supplies', 'Mumbai');


-- =====================================================
-- INSERT DATA INTO CUSTOMERS
-- =====================================================

INSERT INTO Customers
(customer_id, name, email, city, age, registration_date)
VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 'Pune', 22, '2025-01-15'),
(2, 'Priya Patel', 'priya@gmail.com', 'Mumbai', 25, '2025-02-10'),
(3, 'Rahul Verma', 'rahul@gmail.com', 'Delhi', 28, '2025-02-18'),
(4, 'Sneha Joshi', 'sneha@gmail.com', 'Pune', 21, '2025-03-05'),
(5, 'Aditya Mehta', 'aditya@gmail.com', 'Bangalore', 30, '2025-03-20'),
(6, 'Ananya Deshmukh', 'ananya@gmail.com', 'Pune', 24, '2025-04-12'),
(7, 'Rohan Kulkarni', 'rohan@gmail.com', 'Mumbai', 27, '2025-04-25'),
(8, 'Isha Shah', 'isha@gmail.com', 'Delhi', 23, '2025-05-08'),
(9, 'Vikram Singh', 'vikram@gmail.com', 'Hyderabad', 32, '2025-05-19'),
(10, 'Neha Kapoor', 'neha@gmail.com', 'Bangalore', 26, '2025-06-01'),
(11, 'Karan Malhotra', 'karan@gmail.com', 'Pune', 29, '2025-06-15'),
(12, 'Meera Iyer', 'meera@gmail.com', 'Chennai', 31, '2025-07-02'),
(13, 'Arjun Rao', 'arjun@gmail.com', 'Mumbai', 20, '2025-07-18'),
(14, 'Kavya Nair', 'kavya@gmail.com', 'Pune', 24, '2025-08-05'),
(15, 'Siddharth Jain', 'siddharth@gmail.com', 'Delhi', 35, '2025-08-20'),
(16, 'Tanvi Patil', 'tanvi@gmail.com', 'Pune', 22, '2025-09-01'),
(17, 'Yash Agarwal', 'yash@gmail.com', 'Bangalore', 27, '2025-09-15'),
(18, 'Pooja Mishra', 'pooja@gmail.com', 'Hyderabad', 29, '2025-10-03'),
(19, 'Nikhil Gupta', 'nikhil@gmail.com', 'Mumbai', 33, '2025-10-18'),
(20, 'Riya Sinha', 'riya@gmail.com', 'Pune', 21, '2025-11-02');


-- =====================================================
-- INSERT DATA INTO PRODUCTS
-- =====================================================

INSERT INTO Products
(product_id, product_name, category, price, stock, supplier_id)
VALUES
(1, 'Laptop Pro 14', 'Electronics', 75000, 15, 1),
(2, 'Wireless Mouse', 'Electronics', 1200, 50, 2),
(3, 'Mechanical Keyboard', 'Electronics', 4500, 25, 2),
(4, 'USB-C Hub', 'Electronics', 2500, 30, 8),
(5, 'Noise Cancelling Headphones', 'Electronics', 8500, 18, 3),
(6, 'Smart Watch', 'Electronics', 12000, 20, 4),
(7, 'Bluetooth Speaker', 'Electronics', 3500, 35, 6),
(8, 'Webcam HD', 'Electronics', 4000, 22, 1),

(9, 'Python Programming', 'Books', 650, 40, 5),
(10, 'Data Science Handbook', 'Books', 950, 30, 5),
(11, 'AI Fundamentals', 'Books', 800, 45, 7),
(12, 'SQL Mastery', 'Books', 700, 35, 7),
(13, 'Machine Learning Guide', 'Books', 1100, 25, 3),

(14, 'Office Chair', 'Furniture', 15000, 10, 4),
(15, 'Study Table', 'Furniture', 9000, 12, 6),
(16, 'Bookshelf', 'Furniture', 7000, 8, 5),
(17, 'Desk Lamp', 'Furniture', 1800, 40, 7),

(18, 'Running Shoes', 'Fashion', 4500, 25, 6),
(19, 'Backpack', 'Fashion', 2500, 35, 8),
(20, 'Hoodie', 'Fashion', 2200, 30, 2),

(21, 'Coffee Maker', 'Home Appliances', 6500, 15, 4),
(22, 'Air Fryer', 'Home Appliances', 9000, 10, 6),
(23, 'Electric Kettle', 'Home Appliances', 2200, 28, 5),
(24, 'Mixer Grinder', 'Home Appliances', 5500, 18, 3);


-- =====================================================
-- INSERT DATA INTO ORDERS
-- =====================================================

INSERT INTO Orders
(order_id, customer_id, order_date, total_amount, status)
VALUES
(1, 1, '2025-01-20', 76200, 'Delivered'),
(2, 2, '2025-02-15', 6900, 'Delivered'),
(3, 3, '2025-02-25', 12000, 'Shipped'),
(4, 4, '2025-03-10', 2500, 'Delivered'),
(5, 5, '2025-03-25', 18600, 'Delivered'),
(6, 1, '2025-04-05', 8500, 'Delivered'),
(7, 6, '2025-04-18', 950, 'Delivered'),
(8, 7, '2025-05-02', 16000, 'Shipped'),
(9, 8, '2025-05-15', 14400, 'Delivered'),
(10, 9, '2025-05-28', 6500, 'Pending'),
(11, 10, '2025-06-05', 3500, 'Delivered'),
(12, 11, '2025-06-20', 77400, 'Delivered'),
(13, 12, '2025-07-08', 700, 'Shipped'),
(14, 13, '2025-07-22', 4500, 'Delivered'),
(15, 14, '2025-08-10', 2500, 'Delivered'),
(16, 15, '2025-08-25', 8500, 'Pending'),
(17, 16, '2025-09-05', 2200, 'Delivered'),
(18, 17, '2025-09-20', 6500, 'Delivered'),
(19, 18, '2025-10-08', 9000, 'Shipped'),
(20, 19, '2025-10-22', 18600, 'Delivered'),
(21, 20, '2025-11-05', 12000, 'Delivered'),
(22, 1, '2025-11-15', 4500, 'Delivered'),
(23, 2, '2025-11-25', 8500, 'Shipped'),
(24, 5, '2025-12-05', 2500, 'Delivered'),
(25, 7, '2025-12-15', 78600, 'Pending'),
(26, 3, '2025-12-20', 3500, 'Delivered'),
(27, 11, '2025-12-22', 950, 'Delivered'),
(28, 1, '2025-12-25', 19000, 'Delivered'),
(29, 5, '2025-12-27', 6500, 'Shipped'),
(30, 7, '2025-12-29', 9500, 'Delivered');


-- =====================================================
-- INSERT DATA INTO ORDER_ITEMS
-- =====================================================

INSERT INTO Order_Items
(order_item_id, order_id, product_id, quantity, price)
VALUES

(1, 1, 1, 1, 75000),
(2, 1, 2, 1, 1200),
(3, 2, 3, 1, 4500),
(4, 2, 2, 2, 1200),
(5, 3, 6, 1, 12000),
(6, 4, 4, 1, 2500),
(7, 5, 14, 1, 15000),
(8, 5, 17, 2, 1800),
(9, 6, 5, 1, 8500),
(10, 7, 10, 1, 950),
(11, 8, 15, 1, 9000),
(12, 8, 16, 1, 7000),
(13, 9, 6, 1, 12000),
(14, 9, 2, 2, 1200),
(15, 10, 21, 1, 6500),
(16, 11, 7, 1, 3500),
(17, 12, 1, 1, 75000),
(18, 12, 2, 2, 1200),
(19, 13, 12, 1, 700),
(20, 14, 18, 1, 4500),
(21, 15, 19, 1, 2500),
(22, 16, 5, 1, 8500),
(23, 17, 20, 1, 2200),
(24, 18, 21, 1, 6500),
(25, 19, 22, 1, 9000),
(26, 20, 14, 1, 15000),
(27, 20, 17, 2, 1800),
(28, 21, 6, 1, 12000),
(29, 22, 3, 1, 4500),
(30, 23, 5, 1, 8500),
(31, 24, 4, 1, 2500),
(32, 25, 1, 1, 75000),
(33, 25, 2, 3, 1200),
(34, 26, 7, 1, 3500),
(35, 27, 10, 1, 950),
(36, 28, 6, 1, 12000),
(37, 28, 16, 1, 7000),
(38, 29, 21, 1, 6500),
(39, 30, 18, 1, 4500),
(40, 30, 19, 2, 2500);

SELECT * FROM Customers;
SELECT * FROM Order_items;
SELECT * FROM Oders;
SELECT * FROM Products;
SELECT * FROM Suppliers;

SHOW DATABASES;
SHOW TABLES;