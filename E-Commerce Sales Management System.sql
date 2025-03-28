-- E-Commerce Sales Management System

-- Creating the database
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Creating Users table to store customer details
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating Products table to store product details
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating Orders table to store order details
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2),
    order_status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Creating Order Items table to store the products included in each order
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Creating Payments table to track payment details
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method ENUM('Credit Card', 'Debit Card', 'UPI', 'PayPal', 'Net Banking'),
    payment_status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Inserting sample data into Users table
INSERT INTO users (name, email, phone, address) VALUES
('Anand Vishwakarma', 'anand@gmail.com', '9876543210', 'gujarat'),
('Aman Vishwakarma', 'aman@gmail.com', '9123456780', 'pune');

-- Inserting sample data into Products table
INSERT INTO products (name, category, price, stock) VALUES
('iPhone 14', 'Electronics', 799.99, 50),
('Nike Shoes', 'Footwear', 120.50, 30);

-- Inserting sample data into Orders table
INSERT INTO orders (user_id, total_amount, order_status) VALUES
(1, 799.99, 'Pending');

-- Inserting sample data into Order Items table
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 799.99);

-- Inserting sample data into Payments table
INSERT INTO payments (order_id, payment_method, payment_status) VALUES
(1, 'Credit Card', 'Completed');

-- Query to fetch all orders with user details
SELECT o.order_id, u.name, u.email, o.total_amount, o.order_status, o.order_date
FROM orders o
JOIN users u ON o.user_id = u.user_id;

-- Query to find top-selling products
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

-- Query to list pending payments
SELECT p.payment_id, u.name, o.total_amount, p.payment_status
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN users u ON o.user_id = u.user_id
WHERE p.payment_status = 'Pending';

-- Query to check product stock levels
SELECT name, stock 
FROM products 
WHERE stock < 10;

-- Query to get a user’s order history
SELECT u.name, p.name AS product, oi.quantity, oi.price, o.order_date 
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE u.email = 'anand@gmail.com';
