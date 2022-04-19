/* (f) Exemplos de consultas. */

/* 1. Recupera o nome completo, o CPF e o salario de pessoas que são funcionários de uma loja
      da cidade de Lavras em ordem alfabética de nome */
SELECT CONCAT(P.primeiroNome, " ", P.sobrenome) AS nome, P.cpf, F.salario
FROM Pessoa P, Funcionario F, Loja L
WHERE P.idPessoa = F.idFuncionario AND F.idloja = L.idLoja AND L.cidade = "Lavras"
ORDER BY P.primeiroNome ASC, P.sobrenome ASC, salario DESC;

/* 2. */