/* (d) Exemplos de modificação de dados em 5 tabelas. */

USE LogisticaVendas;

UPDATE Loja
SET nome = "Loja Oriental"
WHERE idloja = 4;

UPDATE Produto P
SET preco = "23.35"
WHERE P.nome = "Par de luvas";

UPDATE Pedido P
SET valor = valor - 10
WHERE idCliente IN (
  SELECT idCliente
  FROM Cliente C
  WHERE C.email = "fausto123@email.com"
);

UPDATE Telefone
SET fone = fone + 1
WHERE idPessoa > 5;

UPDATE motorista
SET habilitacao = "AB"
WHERE idMotorista = 7;

commit;
