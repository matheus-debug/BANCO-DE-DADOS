create database db_loja;

use db_loja;

create table tb_foto(
	id	int	auto_increment	not null
    ,nome	varchar(45)		not null
    ,primary key(id)
);
create table tb_produto (
	id	int	auto_increment	not null
    ,nome	varchar(45)		not null
    ,tipo	varchar(45)		not null
    ,qtd	varchar(45)		not null
    ,id_foto	int				not null
    ,foreign key(id_foto) references tb_foto(id)
    ,primary key(id)
);
show tables; /*Consulta se as tabelas foram criadas
*/

/*Abaixo ingestão de dados nas tabelas*/
insert	into  tb_foto(nome) values
('Foto-1')
,('Foto-2')
,('Foto-3');

select*from tb_foto; /*Consulta da tabela foto*/

/*Abaixo ingestão de dados nas tabelas*/

insert into tb_produto(nome,tipo,qtd,id_foto)
values
('Computador','Eletronico',2,2)
,('Mouse','Eletronico',10,1)
,('Caderno', 'Escolar', 50, 3);

select*from tb_produto; /*Consulta da tabela produto*/

select
	nome
    ,id_foto
from tb_produto;

select	p.nome
		,f.id
from tb_produto p inner join tb_foto f	on (f.id = p.id)
where p.tipo = 'Eletronico';
        