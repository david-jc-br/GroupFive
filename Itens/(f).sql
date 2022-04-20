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