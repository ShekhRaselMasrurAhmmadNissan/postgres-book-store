-- Active: 1742885856032@@127.0.0.1@5432@bookstore_db


-- Database Creation
CREATE DATABASE bookstore_db;

-- Create Books Table
CREATE TABLE books(
	id SERIAL PRIMARY KEY,
	title VARCHAR(50),
	author VARCHAR(50),
	price INT,
	CHECK (price > 0),
	stock INT,
	CHECK (stock >= 0),
	published_year CHAR(4)
)


