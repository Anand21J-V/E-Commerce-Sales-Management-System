# E-Commerce-Sales-Management-System

# E-Commerce Sales Management System (SQL Project)

## 📌 Project Overview
This **E-Commerce Sales Management System** is a SQL-based project that simulates the backend database of an online store. It manages users, products, orders, payments, and analytics using structured queries, making it a great way to practice and refine SQL skills.

## 📂 Features
✅ **User Management** – Store customer details securely 🧑‍💼  
✅ **Product Management** – Track stock & pricing in real-time 📦  
✅ **Order Processing** – Manage purchases & order statuses seamlessly 🛒  
✅ **Payment System** – Secure transactions with multiple payment methods 💳  
✅ **Advanced Queries** – Generate sales insights & top-selling products 📊  

## ⚙️ Database Schema
The system consists of the following tables:
1. **users** – Stores customer details.
2. **products** – Stores product information including stock & price.
3. **orders** – Stores order details linked to users.
4. **order_items** – Tracks products within each order.
5. **payments** – Stores payment details for orders.

## 🚀 Installation & Setup
### **1️⃣ Install MySQL Server**  
Ensure you have MySQL installed on your system. You can download it from [MySQL Official Site](https://www.mysql.com/downloads/).

### **2️⃣ Create the Database**  
Open MySQL and execute the following command:
```sql
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
```

### **3️⃣ Run SQL Script**  
Execute the full SQL script provided in `ecommerce_db.sql` to create tables and insert sample data.

### **4️⃣ Run Queries**  
You can test queries using:
```sql
SELECT * FROM users;
SELECT * FROM orders;
```

## 📊 Sample Queries
✅ **Get all orders with customer details:**
```sql
SELECT o.order_id, u.name, u.email, o.total_amount, o.order_status, o.order_date
FROM orders o
JOIN users u ON o.user_id = u.user_id;
```
✅ **Find top-selling products:**
```sql
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;
```
✅ **Check low-stock products:**
```sql
SELECT name, stock FROM products WHERE stock < 10;
```

## 📌 Future Enhancements
🔹 Implement stored procedures for automated tasks.  
🔹 Add triggers to update stock levels on order placement.  
🔹 Improve security with role-based access control.  

## 🤝 Contribution
Feel free to fork, modify, and enhance the project! PRs are welcome. 🚀  

## 📜 License
This project is open-source and available under the **MIT License**.

### 🔗 Connect
For any questions or collaborations, reach out via LinkedIn or GitHub. 😊

