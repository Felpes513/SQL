CREATE DATABASE Library;

CREATE TABLE users_tb(
	user_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50),
	cpf VARCHAR(11),
	number VARCHAR(13),
	address VARCHAR(100),
	birthday DATE,
	email VARCHAR(45)
);

ALTER TABLE users RENAME TO users_tb;

CREATE TABLE categories_tb(
	category_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	hallway INT,
	name VARCHAR(25)
);

CREATE TABLE books_tb(
	book_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(45),
	release DATE,
	category_id BIGINT,

	FOREIGN KEY (category_id) REFERENCES categories_tb(category_id)
);