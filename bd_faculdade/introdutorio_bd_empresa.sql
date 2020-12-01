create database db_empresa;

use db_empresa;

create table tb_cliente (

	id 			int auto_increment primary key  not null
    ,nome		varchar(50) not null
    ,telefone	varchar(10) not null
    ,email		varchar(50) not null

);

create table tb_produto(

	id					int auto_increment primary key  not null
    ,nome				varchar(50) not null
    ,qtd_estoque		float
    ,valor_custo		float
    ,preco_venda		float

    );

create table tb_pedido(

	id					int auto_increment primary key  not null
    ,dt_venda			date not null
    ,obs				varchar(50) not null
    ,valor_total 		float
    ,id_cliente			int not null
    ,foreign key(id_cliente) references tb_cliente(id)
    );

create table tb_item_pedido(

	id					int auto_increment primary key not null
    ,qtd				float not null
    ,valor				float not null
    ,id_pedido			int not null
    ,foreign key(id_pedido) references tb_pedido(id)
    ,id_produto			int not null
    ,foreign key(id_produto) references tb_produto(id)   
    );
	

insert into  tb_cliente(id, nome, email, telefone) values
(1, 'Matheus', 'matheus@gmail.com','996531459'),
(2, 'Marcos', 'marcos@gmail.com', '996565656'),
(3, 'Daniel', 'daniel@gmail.com', '996652316'),
(4, 'Davi', 'davi@gmail.com', '996652357'),
(5, 'Caio', 'caio@gmail.com', '996652314'),
(6, 'Eder', 'eder@gmail.com', '996652318'),
(7, 'Nelson', 'nelson@gmail.com', '996652319'),
(8, 'Eduardo', 'eduardo@gmail.com', '996652310'),
(9, 'Nicolas', 'nicolas@gmail.com', '996652311'),
(10, 'Wesley', 'wesley@gmail.com', '996652312');

 insert into tb_produto (id, nome, qtd_estoque, valor_custo, preco_venda) values
 (1, 'lasanha', '20', '3.5', '10'),
 (2, 'Panqueca', '5', '5.9', '12.5'),
 (3, 'Frango', '10', '7.4', '19.9'),
 (4, 'Bife ', '8', '15', '30'),
 (5, 'Camarão', '50', '36', '70'),
 (6, 'Inhoque', '15', '6.4', '13'),
 (7, 'Pizza', '20', '10', '25.9'),
 (8, 'Macarrão', '22', '11.3', '20'),
 (9, 'Pastel', '7', '9.8', '16'),
 (10, 'Peixe', '25', '8.7','14'),
 (11, 'X-burguer', '18', '6.7','20.3'),
 (12, 'Vinagrete', '9', '5.6', '9.5'),
 (13, 'Batata ', '14', '3.3', '6.9'),
 (14, 'Coca', '5', '17', '30'),
 (15, 'Fanta', '5', '80', '100'),
 (16, 'Suco', '3', '70', '110'),
 (17, 'Agua', '2', '50', '70'),
 (18, 'Chocolate', '7', '30','35'),
 (19, 'Esfiha', '9', '13', '26'),
 (20, 'Agua com Gas', '5', '15', '29.6');
 
insert into tb_pedido (id, dt_venda, obs, valor_total, id_cliente) values 
(1, '2020/11/5', 'Lasanha','10', 1),
(3, '2020/11/10', 'Panqueca', '12.5', 1),
(5, '2020/11/15', 'Frango', '19.9', 1),
(2, '2020/11/30', 'Bife', '30', 3),
(4, '2020/11/27', 'Camarão', '70',3),
(8, '2020/11/12', 'Suco', '110', 6),
(7, '2020/11/15', 'Pizza', '25.9', 6),
(9, '2020/11/20', 'Pizza', '25.9',10),
(10, '2020/11/13', 'Água', '70',10),
(16, '2020/11/8', 'Coca', '30',10);

show tables;

/*EXIBIR PRODUTOS COM VALOR DE CUSTO INFERIOR A 10 E PREÇO VENDA INFERIOR A 50*/
select	id
		,nome
        ,valor_custo
        ,preco_venda
from tb_produto
where	valor_custo > 10 && preco_venda < 50;

/*EXIBIR PRODUTOS COM CUSTO INFERIOR A SUPERIOR A 20 E ESTOQUE INFERIOR A 10*/
select	id
		,nome
		,valor_custo
        ,qtd_estoque
from tb_produto
where valor_custo > 20 && qtd_estoque < 10;

/*EXIBIR NOME, EMAIL E PEDIDO DO CLIENTE*/
select	b.nome
		,b.email
        ,a.obs
from tb_pedido a inner join tb_cliente b on (a.id_cliente = b.id);

/*EXBIR PRODUTO, ID CLIENTE, NOME E EMAIL DO PEDIDO*/
select	
		a.obs
        ,b.id
		,b.nome
		,b.email
from tb_pedido a inner join tb_cliente b on (a.id_cliente = b.id)
where a.id_cliente = 10;

/*EXIBE VENDAS REALIZADAS EM DETERMIDADA DATA*/
select	a.obs
		,b.nome
        ,a.dt_venda
from tb_pedido a inner join tb_cliente b on (a.id_cliente = b.id)
WHERE DATE(dt_venda) = '2020/11/15';

/*EXIBIR  PEDIDOS COM TOTAL SUPERIOR A 50*/
select	b.nome
		,a.valor_total
from tb_pedido a inner join tb_cliente b on (a.id_cliente = b.id)
where a.valor_total > 50;
select *from tb_produto;

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


/*=========================================*/

/*CRIANDO VIEW PARA LER ID, NOME E TELFONE DO CLIENTE*/

create view vw_tb_cliente
as
select	id
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