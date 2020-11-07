/*INSERT - UPDATE - DELETE - INNER JOIN*/


/* UMA PROCEDURE PARA CADA FUNÇÃO
#PROCEDURE PARA INSERIR DADOS NA TABELA CLIENTE
DELIMITER $$
CREATE  PROCEDURE insert_cliente
(
  IN in_nome VARCHAR(255),
  IN in_telefone VARCHAR(255),
  IN in_email varchar (50)
)
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
END $$
DELIMITER ;

CALL insert_cliente ("Ryan Santana", "000000000", "ryan@gmail.com"); #FUNÇÃO PARA INSERIR DADOS DA TABELA CLIENTE
#FIM DO PROCEDURE

#PROCEDURE PARA MODIFICAR DADOS
DELIMITER $$
CREATE PROCEDURE update_cliente
(
	IN in_id int,
	IN in_nome VARCHAR(255),
	IN in_telefone VARCHAR(255),
	IN in_email varchar (50)
)
BEGIN
	UPDATE tb_cliente
	
    SET 
    
    nome = in_nome
    ,telefone = in_telefone
    ,email = in_email
    
    WHERE in_id = id_cliente;
    
END $$
DELIMITER ;

CALL modifica_cliente (12, "Ryan Paulino", "9876" ); #FUNÇÃO PARA MODIFICAR DADOS DA TABELA CLIENTE
#FIM DO PROCEDURE MODIFICA


#PROCEDURE PARA DELETAR DADOS
DELIMITER $$

CREATE  PROCEDURE delete_cliente
(
	IN in_id int
)
BEGIN 
	DELETE from tb_cliente
    
    WHERE  id_cliente  = in_id;
     
END$$
DELIMITER ;

CALL deleta_cliente (13); #FUNÇÃO PROCEDURE PARA DELETAR O CLIENTE
#FIM DO DELETA CLIENTE
*/


/*
SELECT * FROM tb_pedido

select* from tb_pedido
#PROCEDURE PARA INSERIR DADOS NA TABELA  PEDIDO
DROP procedure insert_tb_pedido;
DELIMITER $$
CREATE   PROCEDURE insert_pedido
(
  IN in_ds_pedido varchar(50),
  IN in_dt_pedido date,
  IN in_fk_cliente int

)
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
END $$
DELIMITER ;

CALL insere_pedido("1", "lasanha"); #FUNÇÃO PARA INSERIR DADOS DA TABELA ITEM PEDIDO
#FIM DO PROCEDURE

#PROCEDURE PARA MODIFICAR DADOS EM TB PEDIDO
DELIMITER $$
CREATE procedure update_pedido
(
	IN in_ds_pedido varchar(50),
	IN in_dt_pedido date,
	IN in_fk_cliente int
)
BEGIN
	update tb_pedido
    
    SET	
    ds_obs = in_ds_pedido,
    dt_pedido = in_dt_pedido,
    fk_cliente = in_fk_cliente
    
    WHERE id_pedido = in_id_pedido;
    
END $$
DELIMITER ;
#FIM PROCEDURE UPDATE PEDIDO

#PROCEDURE DELETA PEDIDO
DELIMITER $$

CREATE PROCEDURE delete_pedido
(
	IN in_id_pedido int
    )
    BEGIN
		DELETE from tb_pedido
        
        WHERE id_pedido = in_id_pedido;
END $$
DELIMITER ;
#FIM PROCEDURE DELETA PEDIDO*/