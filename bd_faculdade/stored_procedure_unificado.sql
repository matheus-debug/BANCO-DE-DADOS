/*criação de stored e procedure - usado para fazer atualização, modificação ou exclução de um dado,
é um função que só usa o call para chamar a função e realizar a ingestão de dados*/

#PROCEDURE PARA INSERT, UPDATE E DELETE NA TABELA CLIENTE

DELIMITER $$
CREATE PROCEDURE sp_cliente
( 
	IN in_acao varchar (1),
	IN in_id_cliente int,
	IN in_nome VARCHAR(50),
	IN in_telefone VARCHAR(10),
	IN in_email varchar (50)
    )
BEGIN
	IF(in_acao = 'I') THEN
    BEGIN
	INSERT INTO tb_cliente
    (
      nome
	 ,telefone
     ,email
    )
    VALUES
    (
      in_nome
     ,in_telefone
     ,in_email
    );
END;
ELSEIF (in_acao = 'U') THEN
	BEGIN
	UPDATE tb_cliente
	
    SET 
    
    nome = in_nome
    ,telefone = in_telefone
    ,email = in_email
    
    WHERE  id_cliente =  in_id_cliente;
    
END;
ELSEIF (in_acao = 'D') THEN
	BEGIN 
	DELETE from tb_cliente
    
    WHERE  id_cliente  = in_id_cliente;
	END;
    END IF;
END $$
DELIMITER ;
#FIM PROCEDURE GERAL
#MANEIRA NA QUAL EU DEVO CHAMAR MINHAS PROCEDURES
CALL sp_cliente ("I", null, "nelson", "153624759", "nelson@hotmail.com");
CALL sp_cliente("U", 3, "Matheus P. Santana", "989786778", "matheusp@gmail.com");
CALL sp_cliente("D", 4, null, null, null);


select*from tb_cliente
#PROCEDURE PARA INSERT, UPDATE E DELETE NA TABELA PRODUTO
DELIMITER $$
CREATE PROCEDURE sp_pedido
( 
	IN in_acao varchar (1),
	IN in_ds_pedido varchar(50),
	IN in_dt_pedido date,
	IN in_fk_cliente int
    )
BEGIN
	IF(in_acao = 'I') THEN
   BEGIN
	INSERT INTO tb_cliente
    (
	 ds_pedido
     ,dt_pedido
     ,fk_cliente
    )
    VALUES
    (
     in_ds_pedido
     ,in_dt_pedido
     ,in_fk_cliente
    );
END ;
ELSEIF (in_acao = 'U') THEN
	BEGIN
	update tb_pedido
    
    SET	
    ds_obs = in_ds_pedido,
    dt_pedido = in_dt_pedido,
    fk_cliente = in_fk_cliente
    
    WHERE id_pedido = in_id_pedido;
        
END;
ELSEIF (in_acao = 'D') THEN
	BEGIN 
		DELETE from tb_pedido
        
        WHERE id_pedido = in_id_pedido;
	END;
    END IF;
END $$
DELIMITER ;
#FIM PROCEDURE GERAL
select*from tb_item_pedido
#PROCEDURE PARA INSERT, UPDATE E DELETE NA TABELA ITEM PEDIDO
DELIMITER $$
CREATE PROCEDURE sp_item_pedido
( 
	IN in_acao varchar (1),
	IN in_qtd_item int ,
	IN in_vl_item float,
	IN in_fk_pedido int,
    IN in_fk_produto int
    )
BEGIN
	IF(in_acao = 'I') THEN
   BEGIN
	INSERT INTO tb_item_pedido
    (
	 qtd_item
     ,vl_item
     ,fk_pedido
     ,fk_produto
    )
    VALUES
    (
    in_acao
	, in_qtd_item
	, in_vl_item
	, in_fk_pedido
    , in_fk_produto
    );
END ;
ELSEIF (in_acao = 'U') THEN
	BEGIN
	update tb_item_pedido
    
    SET	
		qtd_comprada = in_qtd_comprada,
		vl_item = in_vl_item,
		fk_pedido = in_fk_pedido,
		fk_produto = in_fk_produto
    
    WHERE fk_pedido = in_fk_pedido;
        
END;
ELSEIF (in_acao = 'D') THEN
	BEGIN 
		DELETE from tb_pedido
        
        WHERE fk_pedido = in_fk_pedido;
	END;
    END IF;
END $$
DELIMITER ;
#FIM PROCEDURE GERAL
select*from tb_produto;
#PROCEDURE PARA INSERT, UPDATE E DELETE NA TABELA PRODUTO

DELIMITER $$
CREATE PROCEDURE sp_produto
( 
	IN in_acao varchar (1),
	IN in_id_produto int ,
	IN in_nome_produto varchar (255),
	IN in_qtd_estoque varchar(255),
    IN in_preco_venda varchar(50)
    )
BEGIN
	IF(in_acao = 'I') THEN
   BEGIN
	INSERT INTO tb_produto
    (
	 nome_produto
     ,preco_venda
	 ,qtd_estoque

    )
    VALUES
    (
    in_acao
	, in_nome_produto
	, in_preco_venda
	, in_qtd_estoque
    );
END ;
ELSEIF (in_acao = 'U') THEN
	BEGIN
	update tb_produto
    
    SET	
		nome_produto = in_nome_produto,
		preco_venda = in_preco_venda,
		qtd_estoque = in_qtd_estoque

		WHERE id_produto = in_id_produto;
        
END;
ELSEIF (in_acao = 'D') THEN
	BEGIN 
		DELETE from tb_produto
        
        WHERE id_produto= in_id_produto;
	END;
    END IF;
END $$
DELIMITER ;
#FIM PROCEDURE GERAL

CALL sp_produto("I", null, "Mouse", "123", "N/A");

SHOW PROCEDURE STATUS; #exibe as procedures de todos os bancos

SHOW PROCEDURE STATUS WHERE Db = 'db_empresa'; #retorna todas as procedures do banco

show databases

use db_empresa

show tables


select * from tb_cliente

alter table tb_cliente
add fk_cliente

