/* (c) Exemplos de inserção de dados nas tabelas. */

USE LogisticaVendas;

-- Inserção de exemplos de dados --

INSERT INTO Pessoa VALUES (1, "12345678900", "Victor", "Lima", "Campo Belo",
                           "MG", "37270000", "Panorama", "Pedro Neves", 75, NULL);
						
INSERT INTO Loja (idLoja, cnpj, nome, cep, rua, numero, bairro, cidade, estado)
VALUES (1, "12345678998765", "Papelaria X", "62011140", "Rua Domingos Olímpio", 35, "Centro", "Sobral", "CE");

INSERT INTO Funcionario VALUES (1, "1010", 1000.00, 1);



-- PARA TESTES --

DELETE FROM Pessoa WHERE idPessoa = 1;

DELETE FROM Loja WHERE idLoja = 1;

DELETE FROM Funcionario WHERE idFuncionario = 1;

SELECT *
FROM Pessoa;

SELECT *
FROM Funcionario;

SELECT *
FROM Loja;