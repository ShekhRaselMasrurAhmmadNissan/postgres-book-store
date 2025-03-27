-- Active: 1742885856032@@127.0.0.1@5432@bookstore_db


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

-- Retrieve all data
SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

/*
-- Problems and Solution: 1
-- Find the books that are out of stock
*/
SELECT title FROM books WHERE stock = 0;
