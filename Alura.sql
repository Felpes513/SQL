-- Para criar um banco de dados usamos 

CREATE DATABASE PostgreSQL
	WITH
	OWNER = Postgres
	ENCODING = 'UTF8'
	CONNECTION LIMIT = -1;

-- Para excluir um banco de dados
DROP DATABASE PostgreSQL;

-- Para renomear um banco de dados no PostgreSQL
ALTER DATABASE "PostgreSQL" RENAME TO "PostgreSQL1";


