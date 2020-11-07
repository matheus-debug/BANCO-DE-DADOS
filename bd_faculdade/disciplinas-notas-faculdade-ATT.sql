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

insert into tb_grade_aluno (ano, semestre, p1, p2, id_aluno, id_disciplina)
values (2020, 1, null, null, 4, 5)
		,(2020, 1, null, null, 4, 2)
        ,(2020, 1, null, null, 4, 4)
        ,(2020, 1, null, null, 2, 1)
        ,(2020, 1, null, null, 2, 3)
        ,(2020, 1, null, null, 2, 4)
        ,(2020, 1, null, null, 5, 5)
        ,(2020, 1, null, null, 5, 4)
        ,(2020, 1, null, null, 5, 2);
        
/*EXIBINDO OS PROFESSORES E SUA TITULAÇÃO*/

select nome
		,titulacao
from tb_professor;

/*Exibir as disciplinas de um curso*/

select id
		,nome
from tb_disciplina;

/*EXIBINDO AS DISCIPLINAS DE UM CURSO ESPECIFICO*/

select id
		,nome
from tb_disciplina
where id_curso = 2;

/*EXIBINDO DISCIPLINAS COM CARGA IGUAL A 40h*/

select id
		,nome
from tb_disciplina
where carga = 40;

/*EXIBINDO DISCIPLINAS COM CARGA SUPERIOR A 40h*/

select id
		,nome
from tb_disciplina
where carga > 40;

/*EXIBIR PROFESSORES DE UM DETERMINADO CURSO*/

select b.id
		,b.nome
from tb_disciplina a inner join tb_professor b on (a.id_professor = b.id)
where a.id_curso = 2
group by b.id
		,b.nome;
        
/*EXIBIR ALUNOS DE UMA DISCIPLINA ORDENADO PELO NOME*/

select b.nome
from tb_grade_aluno a inner join tb_aluno b on (a.id_aluno = b.id)
where a.id_disciplina = 4
order by b.nome;

/*EXIBIR TODOS OS ALUNOS COM MEDIA SUPERIOR A 8,5 EM 2020*/

select b.nome
from tb_grade_aluno a inner join tb_aluno b on (a.id_aluno = b.id)
where ((a.p1+a.p2)/2) > 8.5
  and a.ano = 2020
  and a.semestre = 1;

/*EXIBIR NOME DO PROFESSOR, DISCIPLINA E NOME DOS ALUNOS QUE TIVERAM MEDIA IGUAL A 10 EM 202*/

select c.nome as professor
      ,b.nome as disciplina
      ,a.p1
      ,a.p2
      
from tb_grade_aluno a inner join tb_disciplina b on (a.id_disciplina = b.id)
                      inner join tb_professor  c on (b.id_professor = c.id);
                      
/* essa parte do código serviria se eu quisessse procurar uma nota em especifico
where a.p1 = 10
  and a.p2 = 10
  and a.ano = 2020
  and a.semestre = 1;
  */
  
/*EXIBIR QUANTIDADE DE DISCIPLINAS ALOCADAS PARA CADA PROFESSOR*/

select b.nome
      ,count(a.nome)
from tb_disciplina a inner join tb_professor b on (a.id_professor = b.id)
group by b.nome;


/*EXIBIR QUANTIDADE DE DISCIPLINAS QUE CADA ALUNO ESTA CURSANDO EM  2020*/

select b.nome
      ,count(c.nome)
from tb_grade_aluno a inner join tb_aluno      b on (a.id_aluno = b.id)
                      inner join tb_disciplina c on (a.id_disciplina = c.id)
where a.ano = 2020
  and a.semestre = 1
group by b.nome;

/*CRIAÇÃO DE VIEW PARA EXIBIR QUANTIDADE DE DISCIPLINA E ALUNO*/

create view vw_aluno_qtd_disciplina
as

select b.nome
      ,count(c.nome)
from tb_grade_aluno a inner join tb_aluno      b on (a.id_aluno = b.id)
                      inner join tb_disciplina c on (a.id_disciplina = c.id)
where a.ano = 2020
  and a.semestre = 1
group by b.nome;

select*from vw_aluno_qtd_disciplina;

/*BUSCANDO APENAS O NOME DOS ALUNOS*/
select nome 
from vw_aluno_qtd_disciplina;

/*FIM VIEW*/


/*CRIAÇÃO DE VIEW  PARA EXIBIR NOME DO PROFESSOR, DISCIPLINA E NOTAS*/
 create view vw_professor_disciplina_notas
 as
 select c.nome as professor
      ,b.nome as disciplina
      ,a.p1
      ,a.p2
      
from tb_grade_aluno a inner join tb_disciplina b on (a.id_disciplina = b.id)
                      inner join tb_professor  c on (b.id_professor = c.id);
                      
 
select*from vw_professor_disciplina_notas;

/*EXIBIR QUANTIDADE DE DISCIPLINAS ALOCADAS PARA CADA PROFESSOR*/

select professor
	  ,disciplina
from vw_professor_disciplina_notas


