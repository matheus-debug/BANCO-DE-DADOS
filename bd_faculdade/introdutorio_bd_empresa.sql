create database db_empresa;
drop database db_empresa;
use db_empresa;

create table tb_cliente (

	id_cliente 	int auto_increment primary key  not null
    ,nome		varchar(50) not null
    ,telefone	varchar(10) not null
    ,email		varchar(50) not null

);

create table tb_produto(

	id_produto				int auto_increment primary key  not null
    ,nome_produto		varchar(50) not null
    ,preco_venda		varchar(50) not null
    ,qtd_estoque		varchar(255) not null
    );

create table tb_pedido(

	id_pedido			int auto_increment primary key  not null
    ,dt_pedido			int(8) not null
    ,ds_obs				varchar(50) not null
    );

create table tb_item_pedido(
	
    fk_pedido int not null
    ,fk_produto int not null
	,qtd_item	int not null
    ,vl_item			real
    ,primary key (fk_pedido, fk_produto)
    ,foreign key (fk_pedido) references tb_pedido(id_pedido)
    ,foreign key (fk_produto) references tb_produto(id_produto)
   
    );
	

alter table tb_pedido
add fk_cliente int;

alter table  tb_pedido
add foreign key (fk_cliente)
references tb_cliente (id_cliente);

/*
alter table tb_item_pedido
add fk_pedido int,
add fk_produto int;

alter table tb_item_pedido
add foreign key (fk_pedido)
references tb_pedido (id_pedido);

alter table tb_item_pedido
add foreign key (fk_produto)
references tb_produto (id_produto);

alter table tb_item_pedido
primary key (fk_pedido, fk_produto);
*/

insert into  tb_cliente(id_cliente, nome, telefone) values
(1, 'Matheus', '996531459'),
(2, 'Marcos', '996565656'),
(3, 'Daniel', '996652316'),
(4, 'Davi', '996652357'),
(5, 'Caio', '996652314'),
(6, 'Eder', '996652318'),
(7, 'Nelson', '996652319'),
(8, 'Eduardo', '996652310'),
(9, 'Nicolas', '996652311'),
(10, 'Wesley', '996652312');

 insert into tb_produto (id_produto,nome_produto,preco_produto, qtd_estoque) values
 (1, 'lasanha', '20', '80'),
 (2, 'Panqueca', '5', '59'),
 (3, 'Frango', '10', '74'),
 (4, 'Bife ', '8', '15'),
 (5, 'Camarão', '50', '36'),
 (6, 'Inhoque', '15', '64'),
 (7, 'Pizza', '20', '45'),
 (8, 'Macarrão', '22', '113'),
 (9, 'Pastel', '7', '98'),
 (10, 'Peixe', '25', '87'),
 (11, 'X-burguer', '18', '67'),
 (12, 'Vinagrete', '9', '56'),
 (13, 'Batata ', '14', '33'),
 (14, 'Coca', '5', '17'),
 (15, 'Fanta', '5', '80'),
 (16, 'Suco', '3', '70'),
 (17, 'Agua', '2', '50'),
 (18, 'Chocolate', '7', '30'),
 (19, 'Esfiha', '9', '13'),
 (20, 'Agua com Gas', '5', '15');
 
select*from
tb_pedido;

insert into tb_pedido (id_pedido, valor_total,fk_clientes) values 
(1, '25', '1'),
(3, '50', '10'),
(5, '75', '2'),
(2, '80', '3'),
(4, '27', '4'),
(8, '32', '5'),
(7, '95', '6'),
(9, '20', '7'),
(10, '63', '8'),
(16, '38', '9');

show tables;

use db_empresa;

select *from tb_cliente;

select id_cliente

	,concat(upper(substring(nome, 1,1)), substring(nome, 2,100)) as nome
    ,telefone
    
from tb_cliente;

SET SQL_SAFE_UPDATES = 1;

select concat(upper(substring('matheus' ,1,1)), substring('matheus',2,100)); #nessa linha eu coloco a primeira letra de uma palavra em maiuscula

#A FUNÇÃO ABAIXO RETORNA O VALOR MÉDIO DE DETERMINADA TABELA

select telefone
	,AVG(telefone)

from tb_cliente;
/*=========================================*/

# ABAIXO TEMOS 2 FUNÇÕES, CONCAT NA QUAL CONCATENA AS VARIAVEIS SELECIONADAS E SPACE QUE É USADO PARA DAR ESPAÇOS ENTRE RESULTADOS
SELECT CONCAT(id_cliente,space(10),telefone)

from tb_cliente;
/*=========================================*/

#  A FUNÇÃO ABAIXO FAZ O ARREDONDAMENTO DE UM VALOR NUMERICO
SELECT CEILING(telefone)

from tb_cliente;
/*=========================================*/

#ABAIXO FIZ UMA MODIFICAÇÃO DE DADOS NA TABELA CLIENTE DA COLUNA TELEFONE
UPDATE tb_cliente
SET telefone = 2.2
WHERE id_cliente = 1;
/*=========================================*/

/*CRIANDO VIEW PARA LER ID, NOME E TELFONE DO CLIENTE*/

create view vw_tb_cliente
as
select id_cliente
		,nome
        ,telefone
        ,email
    
from tb_cliente;

select*from vw_tb_cliente;

/*CONSULTANDO APENAS NOME E TELEFONE*/
select nome
		,telefone
from vw_tb_cliente;

/*CONSULTANDO APENAS NOME E E-MAIL*/

select	nome
		,email
from vw_tb_cliente;