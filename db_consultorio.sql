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
    ,primary key(id)
);

create table tb_medico_convenio(
	id			int auto_increment	not null
    ,tipo		varchar(45)			not null
    ,id_medico	int					not null
    ,foreign key(id_medico) references tb_medico(id)
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
    ,id_medico_convenio int			not null
    ,foreign key(id_medico_convenio) references tb_medico_convenio(id)
    ,primary key(id)
);

/*REALIZANDO INGESTÃO DE DADOS*/

insert into tb_convenio (tipo) values
	('Ambulatorial')
    ,('Hospitalar')
    ,('Referencia')
    ,('Odontologico');

insert into tb_medico(nome,cfm, espec) values
	('Dr.João','4862','Clinico')
    ,('Dr.Pedro', '1235', 'Pedriatra')
    ,('Dra.Katia', '2645','Odonto')
    ,('Dr.Felipe', '4625','Clinico')
    ,('Dr.Marcos', '7895', 'Oftalmologia')
    ,('Dra.Julia', '4627', 'Psiquiatria')
    ,('Dr.Jose', '7863', 'Cardiologia')
    ,('Dra.Maria', '3614', 'Cardiologia');
    
insert into tb_medico_convenio(tipo, id_medico) values 
	('Simples', 1)
    ,('Simples', 2)
	,('Simples', 3)
    ,('Simples', 4)
    ,('Completo', 5)
    ,('Completo', 6)
    ,('Completo', 7)
    ,('Completo', 8);

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
    
insert into tb_consulta (horario, agenda, id_paciente, id_medico_convenio) values
	('11:10', '2020/11/5', 10, 8)
	,('12:10', '2020/11/5', 1, 1)
	,('11:40', '2020/11/5', 9, 7)
	,('11:30', '2020/11/5', 2, 2)
	,('10:10', '2020/11/5', 8, 6)
	,('11:50', '2020/11/5', 3, 3)
	,('13:00', '2020/11/5', 7, 5)
	,('9:10', '2020/11/5', 4, 4)
	,('7:50', '2020/11/5', 6, 3)
	,('10:30', '2020/11/5', 5, 2);


