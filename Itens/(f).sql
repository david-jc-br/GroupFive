/* (f) Exemplos de consultas. */

USE LogisticaVendas;

/* 1. Recupera o nome completo, o CPF e o salario de pessoas que são funcionários de uma loja
      da cidade de Lavras em ordem decrescente de salário */
SELECT CONCAT(P.primeiroNome, " ", P.sobrenome) AS nome, P.cpf, F.salario
FROM Pessoa P, Funcionario F, Loja L
WHERE P.idPessoa = F.idFuncionario AND F.idloja = L.idLoja AND L.cidade = "Lavras"
ORDER BY salario DESC, P.primeiroNome ASC, P.sobrenome ASC;

/* 2. Recupera o nome completo, o CPF e o email de clientes que não fizeram nenhum pedido 
      em ordem alfabética de nomes.*/
SELECT CONCAT(P.primeiroNome, " ", P.sobrenome) AS nome, P.cpf, C.email
FROM Cliente C LEFT OUTER JOIN Pedido Pd ON C.idCliente = Pd.idCliente, Pessoa P
WHERE P.idPessoa = C.idCliente AND Pd.idCliente IS NULL;

/* 3. Recupera o nome completo, o registro da CNH e o número de veículos que um motorista trabalha */
SELECT CONCAT(P.primeiroNome, " ", P.sobrenome) AS nome, M.regCNH, COUNT(*) AS numeroVeiculos
FROM Pessoa P, Funcionario F, Motorista M NATURAL JOIN VeiculoEntrega V
WHERE idPessoa = idFuncionario AND idFuncionario = idMotorista
GROUP BY M.idMotorista;

/*4. Recupera o nome, o valor e quantidade de vezes que um produto aparece nos pedidos. 
	 Apenas para produtos que estão contido em mais de um pedido */
SELECT nome, preco, COUNT(*) qtdePedida
FROM produto NATURAL JOIN produtospedido
GROUP BY codProduto
HAVING qtdePedida > 1;

/*5.Recupera o nome, endereço e a identificação da loja em que trabalha o 
	funcionário que tem a letra A no fim do primeiro nome */
SELECT CONCAT(P.primeiroNome, " ", P.sobrenome) AS nome, rua, numero, bairro, cep, cidade, estado, idLoja
FROM pessoa P JOIN funcionario F ON P.idPessoa = F.idFuncionario
WHERE P.primeiroNome LIKE '%a';    

/*6. Recupera o numero e o valor do pedido, onde a distancia da entrega 
	 está entre 5 e 25 km ou o valor do pedido seja maior que 5000*/
SELECT numPedido, valor
FROM pedido 
WHERE distanciaEntrega BETWEEN 5 and 30
UNION
SELECT numPedido, valor
FROM pedido
WHERE valor > 5000;

/*7. Seleciona a identificação do cliente e da loja que pediram o produto de codigo 2 */
SELECT idCliente, idLoja 
FROM Pedido NATURAL JOIN ProdutosPedido 
WHERE codProduto = 2;

/*8. Seleciona a identificação, nome, sobrenome e telefones 
      dos funcionarios cujo DDD do telefone é 35 */
SELECT P.idPessoa, primeiroNome, sobrenome, fone 
From Telefone AS T, Pessoa AS P, Funcionario AS F
WHERE fone LIKE '35%' AND F.idFuncionario = P.idPessoa AND T.idPessoa = P.idPessoa;

/*9. Seleciona a identificação da loja, soma os salarios dos funcionarios 
 e conta a quantidade de funcionarios, em que a soma dos salários é maior que 1000
 e ordenando em ordem crescente */
SELECT idLoja, COUNT(*) AS qtdeFuncs, SUM(salario) AS SomaSalarios 
FROM Funcionario GROUP BY idLoja 
HAVING SomaSalarios > 1000 ORDER BY SomaSalarios ASC;

/*10 Recupera a quantidade e o nome do produto que teve maior quantidade pedida de uma só vez*/ 
SELECT nome AS nome_do_produto, quantidade AS maior_quantidade_pedida
FROM ProdutosPedido NATURAL JOIN Produto
WHERE quantidade IN (
	SELECT MAX(quantidade)
	FROM ProdutosPedido);

/*11 Recupera a média salarial de cada estado com salario e nome em ordem crescente */
SELECT nome AS NomeLoja, AVG(salario) AS MediaSalarial, estado AS Estado
FROM Loja NATURAL JOIN Funcionario
GROUP BY estado, nome, salario
ORDER BY nome ASC, salario ASC;

<<<<<<< HEAD
/*12 Recupera o nome completo e o telefone de pessoas que são de Minas Gerais e possuem telefone com DDD diferente de 35 com o nome completo em ordem crescente*/
SELECT DiSTINCT CONCAT(primeiroNome, " ", sobrenome) AS NomeCompleto, fone AS Telefone
FROM Telefone NATURAL JOIN Pessoa
WHERE fone NOT LIKE '35%' AND EXISTS(
	SELECT * 
	FROM Pessoa 
	WHERE estado = 'MG')
ORDER BY nomeCompleto ASC;
=======
/*12 Recupera o nome, o estado e o total vendido de lojas em Minas Gerais ou lojas que venderam mais que 500 */
SELECT L.nome, L.estado, L.totalVendido
FROM Loja L
WHERE estado = "MG" OR totalVendido > 500;

/*13 Recupera o salario e o id da loja de funcionarios que não são motoristas */
SELECT DISTINCT F.salario, F.idLoja
FROM Funcionario F JOIN Motorista M
WHERE F.idFuncionario NOT IN(SELECT M.idMotorista
			     FROM Motorista M) ;
                            
/*14 Recupera o código e nome de produtos distintos que foram pedidos */
SELECT DISTINCT P.codProduto, P.nome 
FROM Produto P JOIN ProdutosPedido PP
WHERE P.codProduto = PP.codProduto;
>>>>>>> 29a6618ec6efd4dc66bd889636c50d77bf60953c

/*15 Recupera o id das lojas que possuem (EXIST) um fucionário com sobrenome "Silva" */
SELECT F.idLoja 
FROM Funcionario F
WHERE EXISTS (SELECT P.*
	      FROM Pessoa P
              WHERE P.idPessoa = F.idFuncionario AND P.sobrenome = "Silva");

/*16 Recupera todos os produtos que são mais caros que "Par de Luvas" */
SELECT P.nome, P.preco
FROM Produto P
WHERE P.preco >ALL(SELECT P.preco
		   FROM Produto P
		   WHERE P.nome = "Par de Luvas")
ORDER BY P.preco ASC;

/*17 Recupera o id e o salario dos funcionarios que ganham mais do que algum funcionário da loja 2*/
SELECT F.idFuncionario, F.salario
FROM Funcionario F
WHERE F.salario >SOME(SELECT F.salario
		      FROM Funcionario F
		      WHERE F.idLoja = 2)
ORDER BY F.salario ASC;

commit;
