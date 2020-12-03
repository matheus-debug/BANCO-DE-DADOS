/*CRIAÇÃO DO BANCO DE DADOS*/
create database db_consultorio;

/*SELECIONANDO O BANCO DE DADOS*/
use db_consultorio;

/*CRIAÇÃO DE TABELAS*/
create table tb_convenio(
	id			int auto_increment	not null
    ,tipo		varchar(45)			not null
    ,primary key(id)
);

create table tb_medico(
	id			int auto_increment	not null
    ,nome		varchar(45)			not null
    ,cfm		varchar(45)			not null
    ,espec		varchar(45)			not null /*espec = especialidade*/
    ,id_medico_convenio int			not null
    ,foreign key(id_medico_convenio) references tb_medico_convenio(id)
    ,primary key(id)
);

create table tb_medico_convenio(
	id			int auto_increment	not null
    ,tipo		varchar(45)			not null
    ,primary key(id)

);

create table tb_paciente(
	id			int auto_increment	not null
    ,nome		varchar(45)			not null
    ,cpf		varchar(45)			not null
    ,email		varchar(45)			not null
    ,telefone	varchar(45)			not null
    ,idade		varchar(45)			not null
    ,id_convenio int				not null
    ,foreign key(id_convenio) references tb_convenio(id)
    ,primary key(id)
);

create table tb_consulta (
	id			int auto_increment	not null
    ,horario	time				not null
    ,agenda		date				not null
    ,id_paciente int				not null
    ,foreign key(id_paciente) references tb_paciente(id)
    ,id_medico	int			not null
    ,foreign key(id_medico) references tb_medico(id)
    ,primary key(id)
);

/*REALIZANDO INGESTÃO DE DADOS*/
insert into tb_convenio (tipo) values
	('Ambulatorial')
    ,('Hospitalar')
    ,('Referencia')
    ,('Odontologico');

insert into tb_medico(nome,cfm, espec, id_medico_convenio) values
	('Dr.João','4862','Clinico', 1)
    ,('Dr.Pedro', '1235', 'Pedriatra', 1)
    ,('Dra.Katia', '2645','Odonto', 1)
    ,('Dr.Felipe', '4625','Clinico', 1)
    ,('Dr.Marcos', '7895', 'Oftalmologia', 2)
    ,('Dra.Julia', '4627', 'Psiquiatria', 2)
    ,('Dr.Jose', '7863', 'Cardiologia', 2)
    ,('Dra.Maria', '3614', 'Cardiologia', 2);
    
insert into tb_medico_convenio(tipo) values 
	('Simples')
    ,('Completo');


insert into tb_paciente (nome, cpf, email, telefone, idade, id_convenio) values
	('Matheus', '305.367.390-80', 'matheus@gmail.com','996531459','12', 1),
	('Marcos', '735.502.690-99', 'marcos@gmail.com', '996565656','15', 3),
	('Daniel', '194.252.270-39','daniel@gmail.com', '996652316','32', 2),
	('Davi', '328.900.500-33', 'davi@gmail.com', '996652357','27', 4),
	('Caio', '273.797.550-64', 'caio@gmail.com', '996652314','52', 1),
	('Eder', '147.477.530-60', 'eder@gmail.com', '996652318' ,'18', 3),
	('Nelson', '718.862.370-85', 'nelson@gmail.com', '996652319' ,'42', 2),
	('Eduardo', '876.216.590-92', 'eduardo@gmail.com', '996652310','42', 4),
	('Nicolas', '736.417.260-26', 'nicolas@gmail.com', '996652311','18', 1),
	('Wesley', '844.097.600-33', 'wesley@gmail.com', '996652312','18', 3);
    
insert into tb_consulta (horario, agenda, id_paciente, id_medico) values
	('11:10', '2020/11/5', 10, 8)
	,('12:10', '2020/11/5', 1, 8)
	,('11:40', '2020/11/5', 9, 8)
	,('11:30', '2020/11/5', 2, 2)
	,('10:10', '2020/11/5', 8, 6)
	,('11:50', '2020/11/5', 3, 3)
	,('13:00', '2020/11/5', 7, 8)
	,('9:10', '2020/11/5', 4, 2)
	,('7:50', '2020/11/5', 6, 3)
	,('10:30', '2020/11/5', 5, 2);
update tb_consulta
set agenda = '2020/11/12'
where id = 2;

/*REALIZANDO CONSULTAS*/

/*EXIBIR PACIENTE E SEU CONVENIO*/
select	a.nome
		,b.tipo
from tb_paciente a inner join tb_convenio b on (a.id_convenio = b.id);

/*EXBIR PACIENTES QUE NÃO TEM E-MAIL*/
select	 nome
		,email
from tb_paciente where email = null;

/*EXIBIR CONVENIOS*/
select tipo
from tb_convenio;	

/*EXIBIR TODOS OS MÉDICOS E SEU RESPECTIVO CONVENIO*/
select	b.nome
		,a.tipo
from tb_medico_convenio a inner join tb_medico b on (b.id_medico_convenio = a.id);

/*EXIBIR A QUANTIDADE DE MÉDICOS PARA CADA CONVENIO*/
select b.tipo
      ,count(a.id_medico_convenio)
from tb_medico a inner join tb_medico_convenio b on (a.id_medico_convenio = b.id)
group by a.id_medico_convenio;

/*EXIBIR A QUANTIDADE DE CONSULTAS PARA CADA MÉDICO*/
select	b.nome
		,count(a.id_medico)
from tb_consulta a inner join tb_medico b on (a.id_medico = b.id)
group by a.id_medico;

/*EXIBIR A QUANTIDADE DE CONSULTAS PARA CADA PACIENTE*/
select	b.nome
		,count(a.id)
from tb_consulta a inner join tb_paciente b on (a.id_paciente = b.id)
group by a.id;

/*EXIBIR TODOS OS PACIENTES DE UM DETERMINADO MEDICO*/
select	c.nome
		,count(b.nome)
from tb_consulta a inner join tb_paciente b on (a.id_paciente = b.id)
					inner join tb_medico c on (a.id_medico = c.id)
where c.id = 3;

/*TODAS AS CONSULTAS NO MES DE NOVEMBRO DE UM DETERMINADO MEDICO*/

select b.nome
		,count(a.id)
from tb_consulta a inner join tb_medico b on (a.id_medico = b.id)
where b.id = 8 and MONTH(agenda) = 11;

/*EXIBIR CONSULTAS DE UMA DETERMINADA SEMANA DO MES*/
select  b.nome
        ,c.nome
from tb_consulta a inner join tb_paciente b on (a.id_paciente = b.id)
				   inner join tb_medico c on (a.id_medico = c.id)
Where (FLOOR((DAYOFMONTH(agenda) - 1) / 7) + 1) = 2; /*FUNÇÃO PARA CALCULAR A SEMANA DE UM DETERMINADO MES*/

/*EXIBIR TODOS OS PACIENTES ACIMA DE UMA DETERMINADA IDADE*/
select	b.nome
		,b.idade
        ,c.nome
from tb_consulta a inner join tb_paciente b on (a.id_paciente = b.id)
				inner join tb_medico c on (a.id_medico = c.id)
where b.idade > 40;