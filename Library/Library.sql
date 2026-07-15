CREATE DATABASE library;

CREATE TABLE users_tb(
	user_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	number VARCHAR(13),
	address VARCHAR(100),
	birthday DATE,
	email VARCHAR(45) NOT NULL UNIQUE
);

-- Renomeando a tabela que estava com o nome errado
ALTER TABLE users RENAME TO users_tb;

CREATE TABLE categories_tb(
	category_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	hallway INT,
	name VARCHAR(25) NOT NULL
);

CREATE TABLE books_tb(
	book_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	title VARCHAR(45) NOT NULL,
	release_date DATE,
	category_id BIGINT,

	FOREIGN KEY (category_id) REFERENCES categories_tb(category_id)
);

CREATE TABLE book_copies_tb(
	copy_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	books_id BIGINT,
	status VARCHAR(20),
		CHECK(
				status IN(
							'AVAILABLE',
							'BORROWED',
							'MAINTENANCE'
				)
		),

	FOREIGN KEY (books_id) REFERENCES books_tb(book_id)
);

-- Correção, faltou o CHECK para verificar se o livro está em uma dessas condições
DROP TABLE book_copies_tb;

-- Correção, alteração do nome da tabela para nome correto
ALTER TABLE book_copies_tb RENAME COLUMN copies_id TO copy_id;

CREATE TABLE loans_tb(
	loan_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	copies_id BIGINT,
	user_id BIGINT,
	loan_date TIMESTAMP, -- Como é um banco de dados para estudo não precisamos usar TIMESTAMPZ
	expected_return_date DATE,
	actual_return_date TIMESTAMP,

	FOREIGN KEY (copies_id) REFERENCES book_copies_tb(copy_id),
	FOREIGN KEY (user_id) REFERENCES users_tb(user_id)
);

CREATE TABLE authors_tb(
	author_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(45)
);

CREATE TABLE book_authors_tb(
	book_authors_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	books_id BIGINT,
	authors_id BIGINT,

	FOREIGN KEY (books_id) REFERENCES books_tb(book_id),
	FOREIGN KEY (authors_id) REFERENCES authors_tb(author_id)
);