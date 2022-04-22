/* (i) Exemplos de 3 procedimentos/funções. */

USE LogisticaVendas;

/* Retorna o nome de uma determinada loja passada como parametro
   e a quantidade de produtos vendidos por ela */
DELIMITER // 
CREATE PROCEDURE InfosDaLoja(IN pIdLoja DECIMAL(2)) 
BEGIN 
   SELECT nome, produtosVendidos
   FROM Loja
   WHERE idLoja = pIdLoja; 
END // 
DELIMITER ; 

CALL InfosDaLoja(1);
CALL InfosDaLoja(2);
CALL InfosDaLoja(3);
CALL InfosDaLoja(4);
CALL InfosDaLoja(5);

DROP PROCEDURE InfosDaloja;


/* Retorna a quantidade de numero de telefone cadastrado de uma pessoa, dado seu nome */
DELIMITER // 
CREATE PROCEDURE NroTelDePessoa(IN pPrimeiroNome varchar(30), IN pSobrenome varchar(70), OUT pNumTel DECIMAL(4)) 
BEGIN 
   SELECT Count(*) INTO pNumTel
   FROM Pessoa NATURAL JOIN Telefone
   WHERE primeiroNome = pPrimeiroNome AND sobrenome = pSobrenome;
END // 
DELIMITER ; 

CALL NroTelDePessoa('guilherme', 'grego', @numTel);
SELECT @numTel AS qtdTelefone;

DROP PROCEDURE NroTelDePessoa;


/* Retorna o nome e o preço do produto mais caro. */
DELIMITER //
CREATE PROCEDURE ProdutoMaisCaro (OUT nomeSaida VARCHAR(30), OUT resultado DECIMAL(6,2))
BEGIN
	DECLARE valor DECIMAL(6,2) DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    
	DECLARE PrecoComp DECIMAL(6,2) DEFAULT 0;
    DECLARE nomeComp VARCHAR(30);
	
    DECLARE meuCursor CURSOR FOR SELECT preco, nome FROM produto;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET i = 1;
    
    OPEN meuCursor;
    
    WHILE(i != 1) DO
		FETCH meuCursor INTO PrecoComp, nomeComp;
		IF PrecoComp > valor THEN
			SET valor = PrecoComp;
            SET nomeSaida = nomeComp;
		END IF;
    END WHILE;
    
    SET resultado = valor;
	
END //
DELIMITER ;

CALL ProdutoMaisCaro(@nomeA, @resultado1);
SELECT  @nomeA AS nome, @resultado1 AS Preço;

DROP PROCEDURE ProdutoMaisCaro;

COMMIT;

