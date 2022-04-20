/* (j) Criação de triggers para a consistência dos dados. */

USE LogisticaVendas;

-- Para atualizar o valor de funcionários trabalhando para uma loja. --

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

-- Para atualizar o valor total do pedido de acordo com os produtos adicionados. --

DELIMITER //
CREATE TRIGGER valorPedido
AFTER INSERT ON ProdutosPedido
FOR EACH ROW
BEGIN
	UPDATE Pedido P
	SET P.valor = P.valor + NEW.quantidade * New.precoVendido
	WHERE P.numPedido = NEW.numPedido;
END //
DELIMITER ;

-- Para atualizar o valor total e a quantidade de itens vendidos por uma loja. --

DELIMITER //
CREATE TRIGGER totalVendidoLoja
AFTER INSERT ON ProdutosPedido
FOR EACH ROW
BEGIN
	UPDATE Loja L, Pedido P
	SET L.totalVendido = L.totalVendido + NEW.quantidade * New.precoVendido
	WHERE P.numPedido = NEW.numPedido AND L.idLoja = P.idLoja;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER produtosVendidosLoja
AFTER INSERT ON ProdutosPedido
FOR EACH ROW
BEGIN
	UPDATE Loja L, Pedido P
	SET L.produtosVendidos = L.produtosVendidos + NEW.quantidade
	WHERE P.numPedido = NEW.numPedido AND L.idLoja = P.idLoja;
END //
DELIMITER ;

-- Para atualizar o valor total gasto e a quantidade de pedidos feitos por um cliente. --

DELIMITER //
CREATE TRIGGER totalGastoCliente
AFTER INSERT ON ProdutosPedido
FOR EACH ROW
BEGIN
	UPDATE Cliente C, Pedido P
	SET C.totalGasto = C.totalGasto + NEW.quantidade * NEW.precoVendido
	WHERE P.numPedido = NEW.numPedido AND C.idCliente = P.idCliente;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER totalPedidosCliente
AFTER INSERT ON Pedido
FOR EACH ROW
BEGIN
	UPDATE Cliente C
	SET C.pedidosEfetuados = C.pedidosEfetuados + 1
	WHERE C.idCliente = NEW.idCliente;
END //
DELIMITER ;

COMMIT;