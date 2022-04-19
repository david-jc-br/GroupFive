/* (c) Exemplos de inserção de dados nas tabelas. */

USE LogisticaVendas;

-- Exemplo de inserção de dados na tabela Pessoa --

INSERT INTO Pessoa VALUES (1, "12121212121", "David", "Costa", "Carmo da Cachoeira","MG", "37225000", "Bom Retiro", "Lauro Rezende de Vilela", 201, NULL);
INSERT INTO Pessoa VALUES (2, "12365289753", "Daphne", "Vilela", "Carmo da Cachoeira","MG", "37225000", "Centro", "Avenida JK", 201, "Próximo ao shopping");
INSERT INTO Pessoa VALUES (3, "78219401001", "Guilherme", "Grego", "Divinópolis", "MG", "68553015", "Serrinha", "Rua Primavera", 501, NULL);
INSERT INTO Pessoa VALUES (4, "28923867055", "Mário", "Couto", "São Gonçalo", "MG", "30112971", "Funcionários", "Avenida Getúlio Vargas", 631, NULL);
INSERT INTO Pessoa VALUES (5, "10101010100", "Antonio", "Lanza", "Lavras", "MG", "3720000", "Avenida Lagoa dos Ipês","Aquenta Sol", "61", NULL);
INSERT INTO Pessoa VALUES (6, "10101010122", "Joaozinho", "Silva", "Lavras", "MG", "3720000", "Rua Qualquer", "Bairro Qualquer", "782", "Complemento qualquer");
INSERT INTO Pessoa VALUES (7, "12345678900", "Victor", "Lima", "Campo Belo", "MG", "37270000", "Panorama", "Pedro Neves", 75, NULL);
INSERT INTO Pessoa VALUES (8, "12547895673", "Dudu", "Mata", "Campo Belo", "MG", "37270000", "Árvores", "Adel", 130, "Casa");
INSERT INTO Pessoa VALUES (9, "47845698725", "Kaka", "Gon", "Campo Belo", "MG", "37270000", "Palmeiras", "Barros", 35, "Prédio");
INSERT INTO Pessoa VALUES (10, "15983264598", "Carla", "Miranda", "Belo Horizonte", "MG", "37270000", "Avenida Pinheiros", "Alto do Peró", 35, "Ao lado do mercado Mart Minas");
INSERT INTO Pessoa VALUES (11,"11111111111", "Ademir", "Guia","Rio de Janeiro", "RJ", "11111111","Botafogo", 11, "Rua 11", NULL);
INSERT INTO Pessoa VALUES (12,"22222222222", "Fausto", "Silva","Porto Ferreira", "SP", "22222222","Jardim Dalva", 22, "Rua 12", "Perto do cemitério");

-- Exemplo de inserção de dados na tabela Telefone --

INSERT INTO Telefone VALUES (1,"2239282181");
INSERT INTO Telefone VALUES (1,"8192323090");
INSERT INTO Telefone VALUES (2,"6132482381");
INSERT INTO Telefone VALUES (3, "35921313098");
INSERT INTO Telefone VALUES (3, "35111111111");
INSERT INTO Telefone VALUES (4, "35222222222");
INSERT INTO Telefone VALUES (4, "35333333333");
INSERT INTO Telefone VALUES (5, "35444444444");
INSERT INTO Telefone VALUES (6, "35555555555");
INSERT INTO Telefone VALUES (6, "35666666666");
INSERT INTO Telefone VALUES (6, "35777777777");
INSERT INTO Telefone VALUES (7, "35888888888");
INSERT INTO Telefone VALUES (8, "35999999999");
INSERT INTO Telefone VALUES (9, "11111111111");
INSERT INTO Telefone VALUES (10, "11222222222");
INSERT INTO Telefone VALUES (10, "11333333333");
INSERT INTO Telefone VALUES (10, "11444444444");
INSERT INTO Telefone VALUES (11, "11555555555");
INSERT INTO Telefone VALUES (11, "11666666666");
INSERT INTO Telefone VALUES (12, "11777777777");

-- Exemplo de inserção de dados na tabela Cliente --

INSERT INTO Cliente VALUES (1,"grego2373@gmail.com");
INSERT INTO Cliente VALUES (2, "emailTeste@email.com");
INSERT INTO Cliente VALUES (3, "dudu@email.com");
INSERT INTO Cliente VALUES (4, “cleinte98@email.com”);
INSERT INTO Cliente VALUES (5, “fausto123@email.com”);
INSERT INTO Cliente VALUES (6, “nescau_radical@email.com”);

-- Exemplo de inserção de dados na tabela Loja --

INSERT INTO Loja (idLoja, cnpj, nome, cep, rua, numero, bairro, cidade, estado)
VALUES (1, "23456", "Mercenaria Azul", "9090782345678", "Rua da Aleatoria", 127, "Bairro Final", "São Paulo", "SP");
INSERT INTO Loja (idLoja, cnpj, nome, cep, rua, numero, bairro, cidade, estado)
VALUES (2, "12345678998765", "Papelaria X", "62011140", "Rua Domingos Olímpio", 35, "Centro", "Lavras", "MG");
INSERT INTO Loja (idLoja, cnpj, nome, cep, rua, numero, bairro, cidade, estado)
VALUES (3, "45256255221114", "Sapataria V", "04302021", "Rua Paracatu", 47, "Parque Imperial", "São Paulo", "SP");
INSERT INTO Loja (idLoja, cnpj, nome, cep, rua, numero, bairro, cidade, estado)
VALUES (4,"73182454000102","Orient","32143290","Rua B","17","Colorado","Contagem","MG");
INSERT INTO Loja (idLoja, cnpj, nome, cep, rua, numero, bairro, cidade, estado)
VALUES (5,"37243428000175", "Fluxo de Dados", "79050300","Rua Geraldo Castelo", "99", "Jardim Paulista", "Campo Grande", "MS");

-- Exemplo de inserção de dados na tabela Funcionario --

INSERT INTO Funcionario VALUES (1, "1010", 1000.00, 1);
INSERT INTO Funcionario VALUES (6, "2020", 1760.50, 1);
INSERT INTO Funcionario VALUES (7, "1010", 1000.00, 1);
INSERT INTO Funcionario VALUES (8, "5252", 2100.00, 2);
INSERT INTO Funcionario VALUES (9, "0707", 5600.00, 3);
INSERT INTO Funcionario VALUES (10, "1111", 800.00, 4);
INSERT INTO Funcionario VALUES (11, "2222", 1700.00, 5);

-- Exemplo de inserção de dados na tabela Motorista --

INSERT INTO Motorista VALUES (7, "91239293023", "B");
INSERT INTO Motorista VALUES (9, "47895632587", "D");

-- Exemplo de inserção de dados na tabela VeiculoEntrega --

INSERT INTO VeiculoEntrega VALUES (1, 7, "BCA2925", "Caminhão" NULL, 4.5);
INSERT INTO VeiculoEntrega VALUES (2, 9, "ABC2525", "Moto" 160, NULL);

-- Exemplo de inserção de dados na tabela Produto --

INSERT INTO Produto VALUES(1, 25.00, “Par de Luvas”);
INSERT INTO Produto VALUES(2, 4000.00, “Notebook”);
INSERT INTO Produto VALUES(3, 1200.50, “Cama de Solteiro”);
INSERT INTO Produto VALUES(4, 9000.00,"Galaxy S22”);
INSERT INTO Produto VALUES(5 1.99, “Bala”);
INSERT INTO Produto VALUES(6, 9.99, “Chocolate”);
INSERT INTO Produto VALUES(7, 12.50, “Chinelo”);
INSERT INTO Produto VALUES(8, 111.99, “Sapato”);
INSERT INTO Produto VALUES(9, 69.99, “Mouse”)
INSERT INTO Produto VALUES(10, 50.00, “Película Iphone 8”);
INSERT INTO Produto VALUES(11, 75.00, “Teclado Logitech”);
INSERT INTO Produto VALUES(12, 12999.50 , “Macbook M1 PRO”);
INSERT INTO Produto VALUES(13, 199.00, “Fone sem fio Xiaomi");
INSERT INTO Produto VALUES(14, 256.95, “Filtro de barro”);
INSERT INTO Produto VALUES(15, 15.00, “Garrafa”)
INSERT INTO Produto VALUES(16, 1.00, “Chiclete”)
INSERT INTO Produto VALUES(17, 359.00, “Tênis adidas All black”);
INSERT INTO Produto VALUES(18, 898.25, “CookTop”);

-- Exemplo de inserção de dados na tabela Pedido --

INSERT INTO Pedido (numPedido, idCliente, idLoja, codEntrega, idVeiculo, distanciaEntrega)
VALUES (1, 2, 1, “45454477789”, 1, 50.0);
INSERT INTO Pedido (numPedido, idCliente, idLoja, codEntrega, idVeiculo, distanciaEntrega)
VALUES (2, 3, 5, “09122930239”, 2, 75.0);
INSERT INTO Pedido (numPedido, idCliente, idLoja, codEntrega, idVeiculo, distanciaEntrega)
VALUES (3, 5, 3, “129323323”, 1, 25.0);

-- Exemplo de inserção de dados na tabela Loja --

INSERT INTO Produtos-Pedido(numPedido, codProduto, quantidade, precoVendido)
VALUES(1,2,1,4000.00);
INSERT INTO Produtos-Pedido(numPedido, codProduto, quantidade, precoVendido)
VALUES(2,15,5,15.00);
INSERT INTO Produtos-Pedido(numPedido, codProduto, quantidade, precoVendido) VALUES(3,10,3,50.00);


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

SELECT *
FROM Telefone;