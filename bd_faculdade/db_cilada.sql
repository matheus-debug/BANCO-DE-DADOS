create database db_cilada; 
use db_cilada;

create table prd_departamento(
	id int auto_increment primary key not null
    ,nome	varchar(45)
);


create table prd_produto_similar(
	id int auto_increment primary key not null
	,nome	varchar(45)

);

create table prd_marca(
	id int auto_increment primary key not null
	,nome	varchar(45)

);

create table prd_categoria(
	id int auto_increment primary key not null,
    id_departamento int
	,nome	varchar(45)
    ,foreign key (id_departamento) references prd_departamento(id)
);

create table prd_subcategoria(
	id int auto_increment primary key not null,
    id_categoria int,
    foreign key (id_categoria) references prd_categoria(id)
	,nome	varchar(45)

);

create table prd_unidade_medida(
	id int auto_increment primary key not null,
    id_produto_similar int,
    foreign key (id_produto_similar) references prd_produto_similar(id)
);	

create table prd_preco_venda(
	id int auto_increment primary key not null,
    id_produto_similar int,
    foreign key (id_produto_similar) references prd_produto_similar(id),
    preco_venda real,
    data_validade_inicial date,
    data_validade_final date
);

create table prd_produto(
	id int auto_increment primary key not null,
    codigo int,
    descricao varchar(255),
    id_subcategoria int,
    foreign key (id_subcategoria) references prd_subcategoria(id),
    id_marca int,
    foreign key (id_marca) references prd_marca(id),
    id_unidade_medida int,
    foreign key (id_unidade_medida) references prd_unidade_medida(id),
    status varchar(50),
    peso_bruto float,
    peso_liquido float,
    qtd_max int,
    qtd_min int,
    cod_barra int
);

select*from prd_departamento
select*from prd_categoria

select	b.id
		,b.nome
		,a.nome
from prd_categoria a inner join prd_departamento b on (a.id_departamento = b.id)
where id_departamento = 2


#FUNÇÃO PROCEDURE PARA ADICIONAR, MODIFICAR E DELETAR DEPARTAMENTOS
DELIMITER $$
CREATE PROCEDURE sp_departamento
(
  IN in_acao VARCHAR(1),
  IN in_nome VARCHAR(50)
 
)
BEGIN
    IF (in_acao = 'I') THEN
    BEGIN
		INSERT INTO prd_departamento
		(
		  nome
		)
		VALUES
		(
		  in_nome
		);
	END;

ELSEIF(in_acao = 'U') THEN

BEGIN
	UPDATE prd_departamento
    SET nome = in_nome
    WHERE id = in_id;
END;
ELSEIF (in_acao = 'D') THEN 
BEGIN
	DELETE FROM prd_departamento
    WHERE id = in_id;
END;
END IF;
END$$
DELIMITER ;
    
CALL sp_departamento ("U","Jonathan", "1");
SHOW PROCEDURE STATUS WHERE Db = 'db_cilada';