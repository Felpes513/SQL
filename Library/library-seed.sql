-- Comando para ver todas as tabelas do meu banco de dados
SELECT table_name 
FROM information_schema.tables
WHERE table_schema='public'
AND table_type='BASE TABLE';

-- Comando para listar dados de uma tabela
SELECT * FROM users_tb;

INSERT INTO users_tb(
	name,
	cpf,
	number,
	address,
	birthday,
	email
) VALUES (
	'Felipe Souza Moreira',
	'86334623036',
	'5511934409921',
	'Avenida Pereira Barreto',
	'2003-10-22',
	'felipesouzamoreira2003@gmail.com'
);