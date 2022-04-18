CREATE SCHEMA IF NOT EXISTS LogisticaVendas;


USE LogisticaVendas ;


CREATE TABLE IF NOT EXISTS LogisticaVendas.Pessoa (
	idPessoa INT NOT NULL AUTO_INCREMENT,
	cpf VARCHAR(11) NOT NULL,
	primeiroNome VARCHAR(30) NOT NULL,
	sobrenome VARCHAR(70) NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	estado VARCHAR(45) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	bairro VARCHAR(30) NULL,
	numero INT UNSIGNED NOT NULL,
	rua VARCHAR(50) NOT NULL,
	complemento VARCHAR(30) NULL,
	PRIMARY KEY (idPessoa),
	UNIQUE INDEX cpf_UNIQUE (cpf ASC) VISIBLE
);


CREATE TABLE IF NOT EXISTS LogisticaVendas.Telefone (
	idPessoa INT NOT NULL,
	fone VARCHAR(11) NOT NULL,
	PRIMARY KEY (idPessoa, fone),
	CONSTRAINT idPessoa
		FOREIGN KEY (idPessoa)
		REFERENCES LogisticaVendas.Pessoa (idPessoa)
		ON DELETE CASCADE
		ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS LogisticaVendas.Cliente (
	idCliente INT NOT NULL,
	email VARCHAR(40) NOT NULL,
	totalGasto DECIMAL(8,2) NOT NULL,
	pedidosEfetuados INT UNSIGNED NOT NULL,
	PRIMARY KEY (idCliente),
	UNIQUE INDEX email_UNIQUE (email ASC) VISIBLE,
	CONSTRAINT idCliente
		FOREIGN KEY (idCliente)
		REFERENCES LogisticaVendas.Pessoa (idPessoa)
		ON DELETE CASCADE
		ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS LogisticaVendas.Loja (
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
	UNIQUE INDEX cnpj_UNIQUE (cnpj ASC) VISIBLE
);


CREATE TABLE IF NOT EXISTS LogisticaVendas.Funcionario (
	idFuncionario INT NOT NULL,
	regFuncionario VARCHAR(4) NOT NULL,
	salario DECIMAL(6,2) NOT NULL,
	idLoja INT NOT NULL,
	PRIMARY KEY (idFuncionario),
	UNIQUE INDEX registro_UNIQUE (regFuncionario ASC) VISIBLE,
	INDEX idLoja_idx (idLoja ASC) VISIBLE,
	CONSTRAINT idFuncionario
		FOREIGN KEY (idFuncionario)
		REFERENCES LogisticaVendas.Pessoa (idPessoa)
		ON DELETE CASCADE
		ON UPDATE NO ACTION,
	CONSTRAINT idLoja
		FOREIGN KEY (idLoja)
		REFERENCES LogisticaVendas.Loja (idLoja)
		ON DELETE RESTRICT
		ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS LogisticaVendas.Motorista (
	idMotorista INT NOT NULL,
	regCNH VARCHAR(11) NOT NULL,
	habilitacao VARCHAR(2) NOT NULL,
	PRIMARY KEY (idMotorista),
	UNIQUE INDEX regCNH_UNIQUE (regCNH ASC) VISIBLE,
	CONSTRAINT idMotorista
		FOREIGN KEY (idMotorista)
		REFERENCES LogisticaVendas.Funcionario (idFuncionario)
		ON DELETE CASCADE
		ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS LogisticaVendas.VeiculoEntrega (
	idVeiculo INT NOT NULL,
	idMotoristaEntrega INT NOT NULL,
	placa VARCHAR(7) NOT NULL,
	tipoVeiculo VARCHAR(15) NOT NULL,
	cilindradas INT NULL,
	capacidadePeso DECIMAL(2,1) NULL,
	PRIMARY KEY (idVeiculo),
	INDEX idMotorista_idx (idMotoristaEntrega ASC) VISIBLE,
	UNIQUE INDEX placa_UNIQUE (placa ASC) VISIBLE,
	CONSTRAINT idMotoristaEntrega
		FOREIGN KEY (idMotoristaEntrega)
		REFERENCES LogisticaVendas.Motorista (idMotorista)
		ON DELETE RESTRICT
		ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS LogisticaVendas.Pedido (
	numPedido INT NOT NULL,
	idClientePedido INT NOT NULL,
	idLojaPedido INT NULL,
	codEntrega VARCHAR(11) NOT NULL,
	idVeiculoPedido INT NOT NULL,
	valor DECIMAL(7,2) NOT NULL,
	data DATETIME NOT NULL,
	distanciaEntrega DECIMAL(4,1) NOT NULL,
	PRIMARY KEY (numPedido),
	INDEX idCliente_idx (idClientePedido ASC) VISIBLE,
	INDEX idLoja_idx (idLojaPedido ASC) VISIBLE,
	INDEX idVeiculo_idx (idVeiculoPedido ASC) VISIBLE,
	UNIQUE INDEX codEntrega_UNIQUE (codEntrega ASC) VISIBLE,
	CONSTRAINT idClientePedido
		FOREIGN KEY (idClientePedido)
		REFERENCES LogisticaVendas.Cliente (idCliente)
		ON DELETE RESTRICT
		ON UPDATE NO ACTION,
	CONSTRAINT idLojaPedido
		FOREIGN KEY (idLojaPedido)
		REFERENCES LogisticaVendas.Loja (idLoja)
		ON DELETE RESTRICT
		ON UPDATE NO ACTION,
	CONSTRAINT idVeiculoPedido
		FOREIGN KEY (idVeiculoPedido)
		REFERENCES LogisticaVendas.VeiculoEntrega (idVeiculo)
		ON DELETE RESTRICT
		ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS LogisticaVendas.Produto (
	codProduto VARCHAR(14) NOT NULL,
	preco DECIMAL(6,2) NOT NULL,
	nome VARCHAR(30) NOT NULL,
	UNIQUE INDEX codProduto_UNIQUE (codProduto ASC) VISIBLE,
	PRIMARY KEY (codProduto)
);


CREATE TABLE IF NOT EXISTS LogisticaVendas.ProdutosPedido (
	numPedido INT NOT NULL,
	codProduto VARCHAR(14) NOT NULL,
	quantidade INT UNSIGNED NOT NULL,
	precoVendido DECIMAL(6,2) NOT NULL,
	PRIMARY KEY (codProduto, numPedido),
	CONSTRAINT numPedido
		FOREIGN KEY (numPedido)
		REFERENCES LogisticaVendas.Pedido (numPedido)
		ON DELETE CASCADE
		ON UPDATE NO ACTION,
	CONSTRAINT codProduto
		FOREIGN KEY (codProduto)
		REFERENCES LogisticaVendas.Produto (codProduto)
		ON DELETE CASCADE
		ON UPDATE NO ACTION
);