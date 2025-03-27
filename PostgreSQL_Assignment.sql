-- Active: 1742885856032@@127.0.0.1@5432@bookstore_db@public


-- Database Creation
CREATE DATABASE bookstore_db;

-- Create Books Table
CREATE TABLE books(
	id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	author VARCHAR(50),
	price DECIMAL(10,2),
	CHECK (price > 0),
	stock INT,
	CHECK (stock >= 0),
	published_year CHAR(4)
)

-- Create Customers Table
CREATE TABLE customers(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(50),
	joined_date DATE DEFAULT now()
)

-- Create Orders Table
CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(id),
	book_id INT REFERENCES books(id),
	quantity INT,
	CHECK (quantity > 0),
	order_date DATE DEFAULT now()
)

-- Add book table data
INSERT INTO books (title, author, price, stock, published_year) VALUES
	('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, '1999'),
	('Clean Code', 'Robert C. Martin', 35.00, 5, '2008'),
	('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, '2014'),
	('Refactoring', 'Martin Fowler', 50.00, 3, '1999'),
	('Database Design Principles', 'Jane Smith', 20.00, 0, '2018');


-- Insert customer table data
INSERT INTO customers (name, email, joined_date) VALUES
	('Alice', 'alice@email.com', '2023-01-10'),
	('Bob', 'bob@email.com', '2022-05-15'),
	('Charlie', 'charlie@email.com', '2023-06-20');

-- Insert order table data
INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
	(1, 2, 1, '2024-03-10'),
	(2, 1, 1, '2024-02-20'),
	(1, 3, 2, '2024-03-05');

-- ? Retrieve all data
-- SELECT * FROM books;
-- SELECT * FROM customers;
-- SELECT * FROM orders;

-- ! DROP ALL THE TABLES
-- DROP TABLE orders;
-- DROP TABLE customers;
-- DROP TABLE books;

/*
-- Problems and Solution: 1
-- Find the books that are out of stock
*/
SELECT title FROM books WHERE stock = 0;

/*
-- Problems and Solution: 2
-- Retrieve the most expensive book of the store
*/
SELECT * FROM books ORDER BY price DESC LIMIT 1;

/*
-- Problems and Solution: 3
-- Find the total number of orders placed by each customer
*/
SELECT c.name, COUNT(o.id) AS total_orders FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.name HAVING COUNT(o.id) > 0;

/*
-- Problems and Solution: 4
-- Calculate the total revenue generated from book sales.
*/
SELECT SUM(price * quantity) AS total_revenue FROM orders o
JOIN books b ON o.book_id = b.id;

/*
-- Problems and Solution: 5
-- List all customers who have placed more than 1 order
*/
SELECT c.name, COUNT(o.id) AS orders_count FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.name HAVING COUNT(o.id) > 1;

/*
-- Problems and Solution: 6
-- Find the average price of books in the store
*/
SELECT ROUND(AVG(price), 2) AS average_price FROM books;

/*
-- Problems and Solution: 7
-- Increase the price of all books published before 2000 by 10%
*/
UPDATE books SET price = price + (price * 0.1) WHERE published_year < '2000';

/*
-- Problems and Solution: 8
-- Delete customers who have not placed any orders
*/
DELETE FROM customers WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);
