create database db_consultorio;
use db_consultorio;
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