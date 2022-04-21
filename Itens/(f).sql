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
GROUP BY M.idMotorista;/* (f) Exemplos de consultas. */

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

commit;
