/* (a) Criação de todas as tabelas, restrições de integridade,
restrições de PRIMARY KEY e FOREIGN KEY, e exemplos com UNIQUE e DEFAULT. */

-- Criação e utilização do Schema --

CREATE SCHEMA LogisticaVendas;

USE LogisticaVendas;

-- Criação das tabelas e restrições --

CREATE TABLE Pessoa (
	idPessoa INT NOT NULL AUTO_INCREMENT,
	cpf VARCHAR(11) NOT NULL,
	primeiroNome VARCHAR(30) NOT NULL,
	sobrenome VARCHAR(70) NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	estado VARCHAR(45) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	bairro VARCHAR(30) NULL,
    rua VARCHAR(50) NOT NULL,
	numero INT UNSIGNED NOT NULL,
	complemento VARCHAR(30) NULL,
	PRIMARY KEY (idPessoa),
	UNIQUE INDEX cpf_UNIQUE (cpf ASC) VISIBLE
);

CREATE TABLE Telefone (
	idPessoa INT NOT NULL,
	fone VARCHAR(11) NOT NULL,
	PRIMARY KEY (idPessoa, fone),
	CONSTRAINT fk_Pessoa
		FOREIGN KEY (idPessoa)
		REFERENCES Pessoa (idPessoa)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Cliente (
	idCliente INT NOT NULL,
	email VARCHAR(40) NOT NULL,
	pedidosEfetuados INT UNSIGNED NOT NULL DEFAULT 0,
    totalGasto DECIMAL(8,2) NOT NULL DEFAULT 0.00,
	PRIMARY KEY (idCliente),
	UNIQUE INDEX email_UNIQUE (email ASC) VISIBLE,
	CONSTRAINT fk_ClientePessoa
		FOREIGN KEY (idCliente)
		REFERENCES Pessoa (idPessoa)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE Loja (
	idLoja INT NOT NULL,
	cnpj VARCHAR(14) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	rua VARCHAR(50) NOT NULL,
	numero INT UNSIGNED NOT NULL,
	bairro VARCHAR(30) NULL,
	cidade VARCHAR(30) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	qtdFuncionarios INT NULL DEFAULT 0,
	totalVendido DECIMAL(12,2) NULL DEFAULT 0.00,
	produtosVendidos INT NULL DEFAULT 0,
	PRIMARY KEY (idLoja),
	UNIQUE INDEX cnpj_UNIQUE (cnpj ASC) VISIBLE
);

CREATE TABLE Funcionario (
	idFuncionario INT NOT NULL,
	regFuncionario VARCHAR(4) NOT NULL,
	salario DECIMAL(6,2) NOT NULL,
	idLoja INT NOT NULL,
	PRIMARY KEY (idFuncionario),
	UNIQUE INDEX registro_UNIQUE (regFuncionario ASC) VISIBLE,
	INDEX idLoja_idx (idLoja ASC) VISIBLE,
	CONSTRAINT idFuncionario
		FOREIGN KEY (idFuncionario)
		REFERENCES Pessoa (idPessoa)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT idLoja
		FOREIGN KEY (idLoja)
		REFERENCES Loja (idLoja)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE Motorista (
	idMotorista INT NOT NULL,
	regCNH VARCHAR(11) NOT NULL,
	habilitacao VARCHAR(2) NOT NULL,
	PRIMARY KEY (idMotorista),
	UNIQUE INDEX regCNH_UNIQUE (regCNH ASC) VISIBLE,
	CONSTRAINT idMotorista
		FOREIGN KEY (idMotorista)
		REFERENCES Funcionario (idFuncionario)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE VeiculoEntrega (
	idVeiculo INT NOT NULL,
	idMotorista INT NOT NULL,
	placa VARCHAR(7) NOT NULL,
	tipoVeiculo VARCHAR(15) NOT NULL,
	cilindradas INT NULL,
	capacidadePeso DECIMAL(2,1) NULL,
	PRIMARY KEY (idVeiculo),
	INDEX idMotorista_idx (idMotorista ASC) VISIBLE,
	UNIQUE INDEX placa_UNIQUE (placa ASC) VISIBLE,
	CONSTRAINT fk_VeiculoMotorista
		FOREIGN KEY (idMotorista)
		REFERENCES Motorista (idMotorista)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE Pedido (
	numPedido INT NOT NULL,
	idCliente INT NOT NULL,
	idLoja INT NULL,
	codEntrega VARCHAR(11) NOT NULL,
	idVeiculo INT NOT NULL,
	valor DECIMAL(7,2) NOT NULL,
	data DATETIME NOT NULL,
	distanciaEntrega DECIMAL(4,1) NOT NULL,
	PRIMARY KEY (numPedido),
	INDEX idCliente_idx (idCliente ASC) VISIBLE,
	INDEX idLoja_idx (idLoja ASC) VISIBLE,
	INDEX idVeiculo_idx (idVeiculo ASC) VISIBLE,
	UNIQUE INDEX codEntrega_UNIQUE (codEntrega ASC) VISIBLE,
	CONSTRAINT fk_PedidoCliente
		FOREIGN KEY (idCliente)
		REFERENCES Cliente (idCliente)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT fk_PedidoLoja
		FOREIGN KEY (idLoja)
		REFERENCES Loja (idLoja)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT fk_PedidoVeiculo
		FOREIGN KEY (idVeiculo)
		REFERENCES VeiculoEntrega (idVeiculo)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE Produto (
	codProduto VARCHAR(14) NOT NULL,
	preco DECIMAL(6,2) NOT NULL,
	nome VARCHAR(30) NOT NULL,
	UNIQUE INDEX codProduto_UNIQUE (codProduto ASC) VISIBLE,
	PRIMARY KEY (codProduto)
);

CREATE TABLE ProdutosPedido (
	numPedido INT NOT NULL,
	codProduto VARCHAR(14) NOT NULL,
	quantidade INT UNSIGNED NOT NULL,
	precoVendido DECIMAL(6,2) NOT NULL,
	PRIMARY KEY (codProduto, numPedido),
	CONSTRAINT numPedido
		FOREIGN KEY (numPedido)
		REFERENCES Pedido (numPedido)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT codProduto
		FOREIGN KEY (codProduto)
		REFERENCES Produto (codProduto)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Triggers --

DELIMITER //
CREATE TRIGGER adicionarFuncionario
AFTER INSERT ON Funcionario
FOR EACH ROW
BEGIN
	UPDATE Loja L
	SET L.qtdFuncionarios = L.qtdFuncionarios + 1
	WHERE L.idLoja = NEW.idLoja;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER removerFuncionario
AFTER DELETE ON Funcionario
FOR EACH ROW
BEGIN
	UPDATE Loja L
	SET L.qtdFuncionarios = L.qtdFuncionarios - 1
	WHERE L.idLoja = OLD.idLoja;
END //
DELIMITER ;

