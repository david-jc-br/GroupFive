/* (b) Exemplos de ALTER TABLE e DROP TABLE. */

USE LogisticaVendas;

CREATE TABLE ClienteBloqueado (
	idCliente INT NOT NULL,
    totalPedidos INT NOT NULL
);

ALTER TABLE ClienteBloqueado ADD COLUMN cpf CHAR(11) NULL;
ALTER TABLE ClienteBloqueado DROP COLUMN totalPedidos CASCADE;
ALTER TABLE ClienteBloqueado ADD CONSTRAINT fk_BloqueadoCliente FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente);

DROP TABLE ClienteBloqueado;

SELECT *
FROM ClienteBloqueado;