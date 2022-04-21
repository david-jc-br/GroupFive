/* (h) Exemplos de criação de usuários (pelo menos 2), concessão (GRANT) e revocação
	   (REVOKE) de permissão de acesso. */

USE LogisticaVendas;

/* Criação de um usuário que tem permissão de selecionar dados dos veículos utilizados para entrega e 
   executar um store producere. */

CREATE USER 'guilherme'@'localhost' IDENTIFIED BY '0000';

GRANT SELECT ON LogisticaVendas.veiculoentrega TO 'guilherme'@'localhost';

REVOKE SELECT ON LogisticaVendas.veiculoentrega FROM 'guilherme'@'localhost';

GRANT EXECUTE ON PROCEDURE LogisticaVendas.InfosDaLoja TO 'guilherme'@'localhost';

DROP USER 'guilherme'@'localhost';


/* Criação de um usuário que tem permissão de selecionar dados de todas as tabelas */

CREATE USER 'teste'@'localhost' IDENTIFIED BY '1111';

GRANT SELECT ON LogisticaVendas.* TO 'teste'@'localhost';

DROP USER 'teste'@'localhost';

commit;
