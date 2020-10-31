/*SQL DO BANCO DE DADOS - **NOTAS E DISCIPLINAS DA FACULDADE** */
create database db_faculdade;

use db_faculdade;

create table tb_aluno (
	id 			int auto_increment	not null
	,nome 		varchar(255)		not null
    ,ra			int					not null
	,email		varchar(255)		not null
    ,telefone	varchar(50)			not null
    ,primary key (id)
    );

create table tb_professor (
	id			int auto_increment	not null
    ,nome		varchar(255)		not null
    ,titulacao	varchar(255)		not null
    ,email		varchar(255)		not null
    ,telefone	varchar(50)			not null
    ,primary key (id)

);

create table tb_curso (
	id			int auto_increment	not null
    ,nome		varchar(255)		not null
    ,qtd_semestres int				not null
    ,turno		varchar(50)			not null
    ,primary key (id)
);

create table tb_disciplina (
	id			int auto_increment	not null
    ,nome		varchar(100)		not null
    ,carga		int					not null
    ,ementa 	varchar(255)		not null
    ,id_professor int				not null
    ,foreign key (id_professor) references tb_professor(id)
    ,id_curso	int					not null
    ,foreign key (id_curso) references tb_curso (id)
    ,primary key (id)
);

create table tb_grade_aluno (
	id			int auto_increment	not null
    ,ano		int					not null
    ,semestre	int					not null
    ,p1			float				null
    ,p2			float				null
    ,id_aluno	int					not null
    ,foreign key (id_aluno) references tb_aluno (id)
    ,id_disciplina int				not null
    ,foreign key (id_disciplina) references tb_disciplina (id)
    ,primary key(id)
);

insert into tb_professor (nome, titulacao, email, telefone)
values	('Renato', 'Mestre', 'renato@gmail.com', '123456789')
		,('Renato', 'Mestre', 'joseffe@gmail.com', '12345678')
        ,('Anderson Brasil', 'Mestre', 'brasil@gmail.com', '123456789')
        ,('Claudio', 'Doutor', 'claudio@gmail.com', '123456789')
        ,('Amália', 'Doutor', 'amalia@gmail.com', '123456789');
        
insert into tb_aluno (nome, ra, email, telefone)
values	('João', '12345', 'joão@gmail.com', '123456789')
		,('Luiz', '21345', 'luiz@gmail.com', '123456789')
        ,('José', '32145', 'jose@gmail.com', '123456789')
        ,('Paulo', '43215', 'paulo@gmail.com', '123456789')
        ,('Marco', '54321', 'marco@gmail.com', '123456789');
        
insert into tb_curso (nome, qtd_semestres,turno)
values ('Engenharia da Computação', 10, 'Manhã')
		,('Engenharia da Computação', 10, 'Noite')
        ,('Engenharia Elétrica', 10, 'Manhã')
        ,('Engenharia Elétrica', 10, 'Noite')
        ,('Engenharia Mecânica', 10, 'Manhã')
        ,('Engenharia Mecânica', 10, 'Noite')
        ,('Engenharia Química', 10, 'Manhã')
        ,('Engenharia Química', 10, 'Noite');
	
insert into tb_disciplina (nome, carga, ementa, id_professor,id_curso )
values ('Banco de Dados', 80, 'Ementa...', 2, 2)
		,('Programação I', 40, 'Ementa...',2 ,2)
        ,('Programação II', 40, 'Ementa...',1,2)
        ,('Arquitetura de Computadores', 80, 'Ementa...', 2,4)
        ,('Interface Humano Computador', 40, 'Ementa...', 2,5)
        ,('compiladores', 40, 'Ementa...', 2,1)
        ,('Tecnologia Web', 40, 'Ementa...', 1,2)
        ,('Programação Orientada a Objetos', 40, 'Ementa...', 2,3);

