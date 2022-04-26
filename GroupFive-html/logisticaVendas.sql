DROP SCHEMA logisticaDeVendas;

CREATE SCHEMA IF NOT EXISTS logisticaDeVendas;

USE logisticaDeVendas;

CREATE TABLE IF NOT EXISTS Pessoa (
	idPessoa INT NOT NULL AUTO_INCREMENT,
	cpf VARCHAR(11) NOT NULL,
	primeiroNome VARCHAR(30) NOT NULL,
	sobrenome VARCHAR(70) NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	estado VARCHAR(45) NOT NULL,
	cep CHAR(8) NOT NULL,
	bairro VARCHAR(30) NULL,
    rua VARCHAR(50) NOT NULL,
	numero INT UNSIGNED NOT NULL,
	complemento VARCHAR(30) NULL,
	PRIMARY KEY (idPessoa),
	UNIQUE INDEX cpf_UNIQUE (cpf ASC)
);

CREATE TABLE IF NOT EXISTS Telefone (
	idPessoa INT NOT NULL,
	fone VARCHAR(11) NOT NULL,
	PRIMARY KEY (idPessoa, fone),
	CONSTRAINT fk_Pessoa
		FOREIGN KEY (idPessoa)
		REFERENCES Pessoa (idPessoa)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Cliente (
	idCliente INT NOT NULL,
	email VARCHAR(40) NOT NULL,
	pedidosEfetuados INT UNSIGNED NOT NULL DEFAULT 0,
    totalGasto DECIMAL(8,2) NOT NULL DEFAULT 0.00,
	PRIMARY KEY (idCliente),
	UNIQUE INDEX email_UNIQUE (email ASC),
	CONSTRAINT fk_ClientePessoa
		FOREIGN KEY (idCliente)
		REFERENCES Pessoa (idPessoa)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Loja (
	idLoja INT NOT NULL,
	cnpj VARCHAR(14) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	rua VARCHAR(50) NOT NULL,
	numero INT UNSIGNED NOT NULL,
	bairro VARCHAR(30) NULL,
	cidade VARCHAR(30) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	qtdFuncionarios INT NULL,
	totalVendido DECIMAL(12,2) NULL,
	produtosVendidos INT NULL,
	PRIMARY KEY (idLoja),
	UNIQUE INDEX cnpj_UNIQUE (cnpj ASC)
);

CREATE TABLE IF NOT EXISTS Funcionario (
	idFuncionario INT NOT NULL,
	regFuncionario VARCHAR(4) NOT NULL,
	salario DECIMAL(6,2) NOT NULL,
	idLoja INT NOT NULL,
	PRIMARY KEY (idFuncionario),
	UNIQUE INDEX registro_UNIQUE (regFuncionario ASC),
	INDEX idLoja_idx (idLoja ASC),
	CONSTRAINT idFuncionario
		FOREIGN KEY (idFuncionario)
		REFERENCES Pessoa (idPessoa)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT idLoja
		FOREIGN KEY (idLoja)
		REFERENCES Loja (idLoja)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS Motorista (
	idMotorista INT NOT NULL,
	regCNH VARCHAR(11) NOT NULL,
	habilitacao VARCHAR(2) NOT NULL,
	PRIMARY KEY (idMotorista),
	UNIQUE INDEX regCNH_UNIQUE (regCNH ASC),
	CONSTRAINT idMotorista
		FOREIGN KEY (idMotorista)
		REFERENCES Funcionario (idFuncionario)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS VeiculoEntrega (
	idVeiculo INT NOT NULL,
	idMotorista INT NOT NULL,
	placa VARCHAR(7) NOT NULL,
	tipoVeiculo VARCHAR(15) NOT NULL,
	cilindradas INT NULL,
	capacidadePeso DECIMAL(2,1) NULL,
	PRIMARY KEY (idVeiculo),
	INDEX idMotorista_idx (idMotorista ASC),
	UNIQUE INDEX placa_UNIQUE (placa ASC),
	CONSTRAINT fk_VeiculoMotorista
		FOREIGN KEY (idMotorista)
		REFERENCES Motorista (idMotorista)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS Pedido (
	numPedido INT NOT NULL,
	idCliente INT NOT NULL,
	idLoja INT NULL,
	codEntrega VARCHAR(11) NOT NULL,
	idVeiculo INT NOT NULL,
	valor DECIMAL(7,2) NOT NULL,
	data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	distanciaEntrega DECIMAL(4,1) NOT NULL,
	PRIMARY KEY (numPedido),
	INDEX idCliente_idx (idCliente ASC),
	INDEX idLoja_idx (idLoja ASC),
	INDEX idVeiculo_idx (idVeiculo ASC),
	UNIQUE INDEX codEntrega_UNIQUE (codEntrega ASC),
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

CREATE TABLE IF NOT EXISTS Produto (
	codProduto VARCHAR(14) NOT NULL,
	preco DECIMAL(6,2) NOT NULL,
	nome VARCHAR(30) NOT NULL,
	UNIQUE INDEX codProduto_UNIQUE (codProduto ASC),
	PRIMARY KEY (codProduto)
);

CREATE TABLE IF NOT EXISTS ProdutosPedido (
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

commit;
