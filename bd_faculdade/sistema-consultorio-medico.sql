create database db_consultorio;
use db_consultorio;

create table tb_consulta (
	id			int auto_increment	not null,
    horario		varchar(45)			not null,
    agenda		date				not null,
    primary key (id)
);

create table tb_convenio (
	id			int auto_increment	not null,
    tipo		varchar(45)			not null,
    primary key (id)
);

create table tb_medico_convenio (
	id			int auto_increment	not null,
    tipo		varchar(45)			not null,
    primary key(id)
);

create table tb_medico (
	id			int auto_increment	not null,
    nome		varchar(45)			not null,
    cfm			varchar(45)			not null,
    especialidade varchar(45)		not null,
    id_consulta int					not null,
    foreign key(id_consulta) references tb_consulta (id),
    id_medico_consulta int			not null,
    foreign key(id_medico_consulta) references tb_consulta(id),
    primary key (id)
);

create table tb_paciente (
	id		int auto_increment		not null,
    nome	varchar(45)				not null,
    cpf		varchar(45)				not null,
    telefone varchar(45)			not null,
    email	varchar(45)				not null,
    idade	varchar(45)				not null,
    id_consulta	int					not null,
    foreign key(id_consulta) references tb_consulta(id),
    id_convenio	int					not null,
    foreign key(id_convenio) references tb_convenio(id),
    primary key(id)
);

select*from tb_paciente;