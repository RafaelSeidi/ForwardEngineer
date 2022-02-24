drop database exercicio;
create database exercicio;
use exercicio;

Create table Escola(
Cod_Escola int not null primary key,
Nome_Escola varchar(200) not null,
Endereco_Escola varchar (200) not null) engine=InnoDB;

Create table Curso(
Cod_Curso int not null primary key,
Descricao_Curso varchar (1000) not null,
Cod_Escola int not null,
foreign key (Cod_Escola) references Escola (Cod_Escola)) engine=InnoDB;

Create table Disciplina(
Cod_Disciplina int not null primary key,
Descricao_Disciplina varchar (1000) not null,
Cod_Curso int not null,
foreign key (Cod_Curso) references Curso (Cod_Curso)) engine=InnoDB;

Create table Professor(
Cod_Professor int not null primary key,
Nome_Professor varchar (200) not null,
CPF_Professor varchar (11) not null,
Endereco_Professor varchar (200) not null,
Salario_Professor decimal(6,2) not null,
Cod_Disciplina int not null,
foreign key (Cod_Disciplina) references Disciplina (Cod_Disciplina)) engine=InnoDB;

Create table Aluno(
Cod_Aluno int not null primary key,
Nome_Aluno varchar (200) not null,
CPF_Aluno varchar (11) not null,
Endereco_Aluno varchar (200) not null,
Série_Aluno varchar(7) not null) engine=InnoDB;

Create table Avaliacao(
Cod_Avaliacao int not null primary key,
Descricao_Avaliacao varchar (1000) not null,
Data_Avaliacao datetime not null,
Cod_Professor int not null,
foreign key (Cod_Professor) references Professor (Cod_Professor)) engine=InnoDB;

Create table Mencao(
Cod_Mencao int not null primary key,
Nota varchar(2) not null,
Cod_Aluno int not null,
Cod_Avaliacao int not null,
foreign key (Cod_Aluno) references Aluno (Cod_Aluno),
foreign key (Cod_Avaliacao) references Avaliacao (Cod_Avaliacao)) engine=InnoDB;

insert into Escola values (1, "Etec de Taboão da Serra", "Rua das JOOJ");

insert into Curso values (1, "Desenvolvimento de Sistemas", 1),
					     (2, "Informática", 1);
                         
insert into Disciplina values (1, "Inglês", 1),
                              (2, "DS", 1),
                              (3, "Banco de Dados", 1),
                              (4, "Informática", 2);
                              
insert into Professor values (1, "Vera", 12345678912, "Rua das Camélias", 1500.00, 1),
                             (2, "Rute", 12345678913, "Rua das Camélias", 1600.00, 3),
							 (3, "Ronny", 12345678914, "Rua das Camélias", 1700.00, 3),
                             (4, "Saiz", 12345678918, "Rua das Camélias", 1800.00, 2);
                             
insert into Aluno values (1, "Rafael Seidi", 12345678915, "Rua das Camélias", "2A"),
                         (2, "Matheus de Souza", 12345678916, "Rua das Camélias", "2A"),
                         (3, "Bruno Firmo", 12345678917, "Rua das Camélias", "2A");
                         
insert into Avaliacao values (1, "Prova DS", "2020-03-06 13:00:00", 4);

insert into Mencao values (1, "MB", 1, 1),
					      (2, "B", 2, 1),
                          (3, "R", 3, 1);
                          
select * from Professor where Salario_Professor = (select max(Salario_Professor) from Professor);
select * from Professor where Salario_Professor = (select min(Salario_Professor) from Professor);
select Nome_Professor, Descricao_Disciplina from Professor inner join Disciplina on Professor.Cod_Disciplina = Disciplina.Cod_Disciplina where Disciplina.Descricao_Disciplina like 'Banco de Dados';
select Nome_Aluno, Nota, Descricao_Avaliacao from Aluno inner join Mencao on Aluno.Cod_Aluno = Mencao.Cod_Aluno inner join Avaliacao on Mencao.Cod_Avaliacao = Avaliacao.Cod_Avaliacao where Mencao.Nota = 'MB';
select Descricao_Curso, Descricao_Disciplina, Nome_Professor from Curso inner join Disciplina on Curso.Cod_Curso = Disciplina.Cod_Curso inner join Professor on Disciplina.Cod_Disciplina = Professor.Cod_Professor
where Disciplina.Descricao_Disciplina like 'Inglês';