/*(e) Exemplos de exclusão de dados em 5 tabelas. */

USE LogisticaVendas;

/* 1 - Deleta a pessoas que são de Minas Gerais com DDD 81*/
DELETE Pessoa
FROM Telefone NATURAL JOIN Pessoa
WHERE estado = 'MG' AND fone LIKE '81%';

/*2 - Deleta telefones com DDD 35 */
DELETE FROM Telefone
WHERE fone LIKE '35%';

/*3 - Deleta Produtos pedidos com valores entre 1 e 100 reais */
DELETE ProdutosPedido
FROM ProdutosPedido NATURAL JOIN Produto
WHERE preco BETWEEN 1 AND 100;

/*4 - Deleta cliinet com email david@email.com*/
DELETE FROM Cliente
WHERE email LIKE 'david@email.com';
