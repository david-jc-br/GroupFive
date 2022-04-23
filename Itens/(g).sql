USE LogisticaVendas;

/*  Visão que armazena para cada produto a quantidade de pedidos realizados,
    e soma o valor total pedido */
CREATE VIEW PedidosDeProdutos AS 
SELECT codProduto, COUNT(numPedido) AS qtdePedida, SUM(preco) AS valorTotalPedido FROM ProdutosPedido NATURAL JOIN Produto
GROUP BY codProduto;

SELECT codProduto, qtdePedida FROM PedidosDeProdutos ORDER BY qtdePedida DESC;

DROP VIEW PedidosDeProdutos;


/* Visao que armazena os dados do endereco de uma pessoa em apenas uma coluna */
CREATE VIEW enderecoPessoa AS 
SELECT idPessoa, CONCAT(rua,', ', numero, ', ',bairro,', ', cidade, ', ', estado, ', ',cep) AS endereco, complemento
FROM Pessoa;

SELECT endereco, complemento FROM enderecoPessoa WHERE idPessoa = 8;
SELECT idPessoa, endereco FROM enderecoPessoa WHERE endereco LIKE '%MG%';

DROP VIEW enderecoPessoa;



/* Visao que armazena os telefones de uma pessoa em apenas uma coluna */
CREATE VIEW telefonesPessoa (idPessoa, telefones)AS
SELECT idPessoa, GROUP_CONCAT(fone) AS fones
FROM Telefone
GROUP BY idPessoa;

SELECT telefones FROM telefonesPessoa WHERE idPessoa = 1;

DROP VIEW telefonesPessoa;


/* Visao que armazena os dados principais de um funcionario */
CREATE VIEW dadosFuncionario (idPessoa, nome, cpf, endereco, telefones, salario, lojaTrabalho ) AS 
SELECT P.idPessoa, CONCAT(P.primeiroNome, ' ', P.sobrenome), P.cpf, E.endereco, T.telefones, F.salario, F.idLoja
FROM Pessoa AS P, enderecoPessoa AS E, Funcionario AS F, telefonesPessoa AS T 
WHERE P.idPessoa = F.idFuncionario AND P.idPessoa = E.idPessoa AND T.idPessoa = P.idPessoa; 

SELECT * FROM dadosFuncionario;
SELECT idPessoa, nome, endereco, telefones FROM dadosFuncionario WHERE lojaTrabalho = 1;

DROP VIEW dadosFuncionario;

commit;
