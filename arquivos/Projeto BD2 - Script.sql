--drop table comentario;
--drop table segue;
--drop table curte;
--drop table postagem;
--drop table usuario;

--Grupo: Amanda, George e Ian

--2)a)i

create table usuario(
email varchar(45),
senha varchar(20) not null,
nickname varchar(45) not null,
nome varchar(45) not null,
datanasc date not null);

alter table usuario
add constraint pk_usuario primary key(email),
add constraint uq_nickname unique(nickname),
add constraint check_email check (email like '%@%.com%'),
add constraint check_datanasc check (datanasc <= current_date);


create table postagem(
url varchar(500),
autor varchar(45) not null,
conteudo text not null,
datahora timestamp not null,
curtidas int not null);

alter table postagem
add constraint pk_postagem primary key(url),
add constraint fk_postagem_usuario foreign key(autor) references usuario;


create table curte(
quem_curtiu varchar(45),
postagem_curtida varchar(500));

alter table curte
add constraint pk_curte primary key(quem_curtiu, postagem_curtida),
add constraint fk_curte_usuario foreign key(quem_curtiu) references usuario,
add constraint fk_curte_postagem foreign key(postagem_curtida) references postagem;


create table segue(
seguidor varchar(45),
seguido varchar(45));

alter table segue
add constraint pk_segue primary key(seguidor, seguido),
add constraint fk_segue_usuario_seguidor foreign key(seguidor) references usuario,
add constraint fk_segue_usuario_seguido foreign key(seguido) references usuario;


create table comentario(
url_com varchar(500),
url_post varchar(500) not null,
comentador varchar(45) not null,
datahora timestamp not null,
editado boolean not null,
curtidas int not null,
conteudo text not null);

alter table comentario
add constraint pk_comentario primary key(url_com),
add constraint fk_comentario_postagem foreign key(url_post) references postagem,
add constraint fk_comentario_usuario foreign key(comentador) references usuario;


--Inserções

insert into usuario values 
('georgelima@example.com', '$trongPassw0rd', 'georgelima', 'George Lima','1993-11-21'),
('amandacruz@example.com', '$trongPassw0rd2', 'amandacruz', 'Amanda Cruz', '1995-05-26'), 
('ianribeiro@example.com', '$trongPassw0rd3', 'ianribeiro', 'Ian Ribeiro', '2000-02-01'),
('joaosilva@example.com', 'P@ssw0rd123', 'joaosilva', 'João Silva', '1990-09-12'),
('marianasantos@example.com', 'MyP@ssw0rd!', 'marianasantos', 'Mariana Santos', '1988-07-03'),
('pedrocosta@example.com', 'Passw0rd123!', 'pedrocosta', 'Pedro Costa', '1992-11-08'),
('larissasilva@example.com', 'Str0ngP@ss!', 'larissasilva', 'Larissa Silva', '1997-02-14'),
('joseoliveira@example.com', 'P@ssw0rd456', 'joseoliveira', 'José Oliveira', '1985-06-30'),
('carolinamartins@example.com', 'Passw0rd789!', 'carolinamartins', 'Carolina Martins', '1991-04-17'),
('felipesilveira@example.com', 'MyP@ssw0rd123', 'felipesilveira', 'Felipe Silveira', '1994-09-03'),
('fernandacampos@example.com', 'P@ssw0rd987', 'fernandacampos', 'Fernanda Campos', '1993-07-21'),
('gabrielsantana@example.com', 'Passw0rd!@#', 'gabrielsantana', 'Gabriel Santana', '1996-12-10'),
('isabelasouza@example.com', 'Str0ngP@ssw0rd', 'isabelasouza', 'Isabela Souza', '1989-03-25'),
('rafaelalmeida@example.com', 'P@ssw0rd654', 'rafaelalmeida', 'Rafael Almeida', '1998-08-07'),
('victormoreira@example.com', 'MyP@ssw0rd987', 'victormoreira', 'Victor Moreira', '1992-05-22'),
('julianalima@example.com', 'P@ssw0rd!@#', 'julianalima', 'Juliana Lima', '1993-10-12'),
('paulohenrique@example.com', 'Passw0rd123!', 'paulohenrique', 'Paulo Henrique', '1987-09-01'),
('marcosilva@example.com', 'P@ssw0rd456', 'marcosilva', 'Marco Silva', '1996-03-18'),
('fernandalima@example.com', 'Passw0rd789!', 'fernandalima', 'Fernanda Lima', '1991-11-27');
('luciamartins@example.com', 'P@ssw0rd789', 'luciamartins', 'Lúcia Martins', '1996-06-05'),
('gabrielsantos@example.com', 'P@ssw0rd!@#', 'gabrielsantos', 'Gabriel Santos', '1994-04-17'),
('anacosta@example.com', 'MyP@ssw0rd123', 'anacosta', 'Ana Costa', '1992-11-23'),
('rodrigofaria@example.com', 'P@ssw0rd987', 'rodrigofaria', 'Rodrigo Faria', '1989-10-07'),
('lauramendes@example.com', 'P@ssw0rd!@#', 'lauramendes', 'Laura Mendes', '1991-03-15'),
('joseferreira@example.com', 'Str0ngP@ssw0rd', 'joseferreira', 'José Ferreira', '1987-09-03'),
('amandasouza@example.com', 'Passw0rd123!', 'amandasouza', 'Amanda Souza', '1998-08-11'),
('ricardocarvalho@example.com', 'P@ssw0rd!@#', 'ricardocarvalho', 'Ricardo Carvalho', '1997-12-22'),
('amandalima@example.com', '$trongPassw0rd2', 'amandalima', 'Amanda Lima', '1990-01-04'),
('mariagomes@example.com', 'Gomes#2021', 'mariagomes', 'Maria Gomes', '1987-11-09'),
('pedroalmeida@example.com', 'Almeida@123', 'pedroalmeida', 'Pedro Almeida', '1993-07-12'),
('juliasantos@example.com', 'Santos@321', 'juliasantos', 'Julia Santos', '1998-03-21'),
('lucasrodrigues@example.com', 'Rodrigues2021!', 'lucasrodrigues', 'Lucas Rodrigues', '1991-09-02'),
('camilasilva@example.com', 'C@mil@2021', 'camilasilva', 'Camila Silva', '1996-12-05'),
('felipefernandes@example.com', 'F3rn@nd3s!', 'felipefernandes', 'Felipe Fernandes', '1988-06-25'),
('sabrinacosta@example.com', 'C0st@S@br1n@', 'sabrinacosta', 'Sabrina Costa', '1994-04-18'),
('ricardosilveira@example.com', 'S!lv3ir@2021', 'ricardosilveira', 'Ricardo Silveira', '1997-08-28');


insert into postagem values
('www.domain.com/ianribeiro/37', 'ianribeiro@example.com', 'O Diferentão', current_timestamp, 0),
('www.domain.com/georgelima/1', 'georgelima@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/amandacruz/2', 'amandacruz@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/ianribeiro/3', 'ianribeiro@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/joaosilva/4', 'joaosilva@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/marianasantos/5', 'marianasantos@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/pedrocosta/6', 'pedrocosta@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/larissasilva/7', 'larissasilva@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/joseoliveira/8', 'joseoliveira@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/carolinamartins/9', 'carolinamartins@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/felipesilveira/10', 'felipesilveira@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/fernandacampos/11', 'fernandacampos@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/gabrielsantana/12', 'gabrielsantana@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/isabelasouza/13', 'isabelasouza@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/rafaelalmeida/14', 'rafaelalmeida@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/victormoreira/15', 'victormoreira@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/julianalima/16', 'julianalima@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/paulohenrique/17', 'paulohenrique@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/marcosilva/18', 'marcosilva@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/fernandalima/19', 'fernandalima@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/luciamartins/20', 'luciamartins@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/gabrielsantos/21', 'gabrielsantos@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/anacosta/22', 'anacosta@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/rodrigofaria/23', 'rodrigofaria@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/lauramendes/24', 'lauramendes@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/joseferreira/25', 'joseferreira@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/amandasouza/26', 'amandasouza@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/ricardocarvalho/27', 'ricardocarvalho@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/amandalima/28', 'amandalima@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/mariagomes/29', 'mariagomes@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/pedroalmeida/30', 'pedroalmeida@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/juliasantos/31', 'juliasantos@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/lucasrodrigues/32', 'lucasrodrigues@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/camilasilva/33', 'camilasilva@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/felipefernandes/34', 'felipefernandes@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/sabrinacosta/35', 'sabrinacosta@example.com', 'Conteúdo da postagem', current_timestamp, 0),
('www.domain.com/ricardosilveira/36', 'ricardosilveira@example.com', 'Conteúdo da postagem', current_timestamp, 0);


insert into curte values
('georgelima@example.com', 'www.domain.com/amandacruz/2'),
('amandacruz@example.com', 'www.domain.com/ianribeiro/3'),
('ianribeiro@example.com', 'www.domain.com/joaosilva/4'),
('joaosilva@example.com', 'www.domain.com/marianasantos/5'),
('marianasantos@example.com', 'www.domain.com/pedrocosta/6'),
('pedrocosta@example.com', 'www.domain.com/larissasilva/7'),
('larissasilva@example.com', 'www.domain.com/joseoliveira/8'),
('joseoliveira@example.com', 'www.domain.com/carolinamartins/9'),
('carolinamartins@example.com', 'www.domain.com/felipesilveira/10'),
('felipesilveira@example.com', 'www.domain.com/fernandacampos/11'),
('fernandacampos@example.com', 'www.domain.com/gabrielsantana/12'),
('gabrielsantana@example.com', 'www.domain.com/isabelasouza/13'),
('isabelasouza@example.com', 'www.domain.com/rafaelalmeida/14'),
('rafaelalmeida@example.com', 'www.domain.com/victormoreira/15'),
('victormoreira@example.com', 'www.domain.com/julianalima/16'),
('julianalima@example.com', 'www.domain.com/paulohenrique/17'),
('paulohenrique@example.com', 'www.domain.com/marcosilva/18'),
('marcosilva@example.com', 'www.domain.com/fernandalima/19'),
('fernandalima@example.com', 'www.domain.com/luciamartins/20'),
('luciamartins@example.com', 'www.domain.com/gabrielsantos/21'),
('anacosta@example.com', 'www.domain.com/rodrigofaria/23'),
('rodrigofaria@example.com', 'www.domain.com/lauramendes/24'),
('lauramendes@example.com', 'www.domain.com/joseferreira/25'),
('joseferreira@example.com', 'www.domain.com/amandasouza/26'),
('amandasouza@example.com', 'www.domain.com/ricardocarvalho/27'),
('ricardocarvalho@example.com', 'www.domain.com/amandalima/28'),
('amandalima@example.com', 'www.domain.com/mariagomes/29'),
('mariagomes@example.com', 'www.domain.com/pedroalmeida/30'),
('pedroalmeida@example.com', 'www.domain.com/juliasantos/31'),
('juliasantos@example.com', 'www.domain.com/lucasrodrigues/32'),
('lucasrodrigues@example.com', 'www.domain.com/camilasilva/33'),
('felipefernandes@example.com', 'www.domain.com/sabrinacosta/35'),
('sabrinacosta@example.com', 'www.domain.com/ricardosilveira/36'),
('georgelima@example.com', 'www.domain.com/carolinamartins/9'),
('amandacruz@example.com', 'www.domain.com/gabrielsantana/12'),
('ianribeiro@example.com', 'www.domain.com/luciamartins/20'),
('joaosilva@example.com', 'www.domain.com/juliasantos/31'),
('marianasantos@example.com', 'www.domain.com/rodrigofaria/23'),
('pedrocosta@example.com', 'www.domain.com/fernandalima/19'),
('larissasilva@example.com', 'www.domain.com/ianribeiro/3'),
('joseoliveira@example.com', 'www.domain.com/pedrocosta/6'),
('carolinamartins@example.com', 'www.domain.com/victormoreira/15'),
('felipesilveira@example.com', 'www.domain.com/amandasouza/26'),
('fernandacampos@example.com', 'www.domain.com/paulohenrique/17'),
('gabrielsantana@example.com', 'www.domain.com/mariagomes/29'),
('isabelasouza@example.com', 'www.domain.com/fernandacampos/11'),
('rafaelalmeida@example.com', 'www.domain.com/ricardocarvalho/27'),
('julianalima@example.com', 'www.domain.com/joaosilva/4'),
('paulohenrique@example.com', 'www.domain.com/marianasantos/5'),
('marcosilva@example.com', 'www.domain.com/ianribeiro/3'),
('fernandalima@example.com', 'www.domain.com/joseoliveira/8'),
('luciamartins@example.com', 'www.domain.com/fernandalima/19'),
('gabrielsantos@example.com', 'www.domain.com/ianribeiro/3'),
('rodrigofaria@example.com', 'www.domain.com/fernandalima/19'),
('lauramendes@example.com', 'www.domain.com/juliasantos/31'),
('joseferreira@example.com', 'www.domain.com/rodrigofaria/23'),
('amandasouza@example.com', 'www.domain.com/pedroalmeida/30'),
('ricardocarvalho@example.com', 'www.domain.com/amandasouza/26'),
('felipefernandes@example.com', 'www.domain.com/gabrielsantana/12'),
('ricardosilveira@example.com', 'www.domain.com/felipefernandes/34'),
('amandacruz@example.com', 'www.domain.com/joaosilva/4'),
('ianribeiro@example.com', 'www.domain.com/carolinamartins/9'),
('joaosilva@example.com', 'www.domain.com/gabrielsantana/12'),
('marianasantos@example.com', 'www.domain.com/luciamartins/20'),
('pedrocosta@example.com', 'www.domain.com/juliasantos/31'),
('larissasilva@example.com', 'www.domain.com/rodrigofaria/23'),
('joseoliveira@example.com', 'www.domain.com/fernandalima/19'),
('carolinamartins@example.com', 'www.domain.com/ianribeiro/3'),
('felipesilveira@example.com', 'www.domain.com/pedrocosta/6'),
('fernandacampos@example.com', 'www.domain.com/victormoreira/15'),
('gabrielsantana@example.com', 'www.domain.com/amandasouza/26'),
('isabelasouza@example.com', 'www.domain.com/paulohenrique/17'),
('rafaelalmeida@example.com', 'www.domain.com/mariagomes/29'),
('victormoreira@example.com', 'www.domain.com/fernandalima/19'),
('julianalima@example.com', 'www.domain.com/ricardocarvalho/27'),
('paulohenrique@example.com', 'www.domain.com/julianalima/16'),
('marcosilva@example.com', 'www.domain.com/joaosilva/4'),
('fernandalima@example.com', 'www.domain.com/marianasantos/5'),
('luciamartins@example.com', 'www.domain.com/ianribeiro/3'),
('gabrielsantos@example.com', 'www.domain.com/joseoliveira/8'),
('anacosta@example.com', 'www.domain.com/fernandalima/19'),
('rodrigofaria@example.com', 'www.domain.com/juliasantos/31'),
('lauramendes@example.com', 'www.domain.com/rodrigofaria/23');


insert into segue values
('georgelima@example.com', 'amandacruz@example.com'),
('ianribeiro@example.com', 'joaosilva@example.com'),
('marianasantos@example.com', 'pedrocosta@example.com'),
('larissasilva@example.com', 'joseoliveira@example.com'),
('carolinamartins@example.com', 'felipesilveira@example.com'),
('fernandacampos@example.com', 'gabrielsantana@example.com'),
('isabelasouza@example.com', 'rafaelalmeida@example.com'),
('victormoreira@example.com', 'julianalima@example.com'),
('paulohenrique@example.com', 'marcosilva@example.com'),
('fernandalima@example.com', 'luciamartins@example.com'),
('anacosta@example.com', 'rodrigofaria@example.com'),
('lauramendes@example.com', 'joseferreira@example.com'),
('amandasouza@example.com', 'ricardocarvalho@example.com'),
('amandalima@example.com', 'mariagomes@example.com'),
('pedroalmeida@example.com', 'juliasantos@example.com'),
('lucasrodrigues@example.com', 'camilasilva@example.com'),
('felipefernandes@example.com', 'sabrinacosta@example.com'),
('ricardosilveira@example.com', 'georgelima@example.com'),
('amandacruz@example.com', 'ianribeiro@example.com'),
('joaosilva@example.com', 'larissasilva@example.com'),
('joseoliveira@example.com', 'carolinamartins@example.com'),
('gabrielsantana@example.com', 'fernandacampos@example.com'),
('rafaelalmeida@example.com', 'isabelasouza@example.com'),
('julianalima@example.com', 'paulohenrique@example.com'),
('marcosilva@example.com', 'fernandalima@example.com'),
('luciamartins@example.com', 'anacosta@example.com'),
('rodrigofaria@example.com', 'lauramendes@example.com'),
('joseferreira@example.com', 'amandasouza@example.com'),
('ricardocarvalho@example.com', 'amandalima@example.com'),
('mariagomes@example.com', 'pedroalmeida@example.com'),
('juliasantos@example.com', 'lucasrodrigues@example.com'),
('camilasilva@example.com', 'felipefernandes@example.com'),
('sabrinacosta@example.com', 'ricardosilveira@example.com'),
('georgelima@example.com', 'marianasantos@example.com'),
('ianribeiro@example.com', 'georgelima@example.com'),
('pedrocosta@example.com', 'amandalima@example.com'),
('joseoliveira@example.com', 'joaosilva@example.com'),
('carolinamartins@example.com', 'larissasilva@example.com'),
('felipesilveira@example.com', 'fernandalima@example.com'),
('gabrielsantana@example.com', 'ianribeiro@example.com'),
('rafaelalmeida@example.com', 'georgelima@example.com'),
('julianalima@example.com', 'joseoliveira@example.com'),
('paulohenrique@example.com', 'larissasilva@example.com'),
('marcosilva@example.com', 'ianribeiro@example.com'),
('fernandalima@example.com', 'carolinamartins@example.com'),
('luciamartins@example.com', 'pedrocosta@example.com'),
('anacosta@example.com', 'fernandacampos@example.com'),
('rodrigofaria@example.com', 'joseferreira@example.com'),
('lauramendes@example.com', 'amandasouza@example.com'),
('joseferreira@example.com', 'ricardocarvalho@example.com'),
('amandasouza@example.com', 'mariagomes@example.com'),
('ricardocarvalho@example.com', 'juliasantos@example.com'),
('amandalima@example.com', 'pedroalmeida@example.com'),
('mariagomes@example.com', 'lucasrodrigues@example.com'),
('pedroalmeida@example.com', 'camilasilva@example.com'),
('juliasantos@example.com', 'felipefernandes@example.com'),
('lucasrodrigues@example.com', 'sabrinacosta@example.com'),
('camilasilva@example.com', 'georgelima@example.com'),
('felipefernandes@example.com', 'marianasantos@example.com'),
('sabrinacosta@example.com', 'georgelima@example.com');


insert into comentario values
('teste/1', 'www.domain.com/amandacruz/2', 'georgelima@example.com', current_timestamp, false, 0, 'teste'),
('teste/2', 'www.domain.com/ianribeiro/3', 'amandacruz@example.com', current_timestamp, false, 0, 'teste'),
('teste/3', 'www.domain.com/joaosilva/4', 'ianribeiro@example.com', current_timestamp, false, 0, 'teste'),
('teste/4', 'www.domain.com/marianasantos/5', 'joaosilva@example.com', current_timestamp, false, 0, 'teste'),
('teste/5', 'www.domain.com/pedrocosta/6', 'marianasantos@example.com', current_timestamp, false, 0, 'teste'),
('teste/6', 'www.domain.com/larissasilva/7', 'pedrocosta@example.com', current_timestamp, false, 0, 'teste'),
('teste/7', 'www.domain.com/joseoliveira/8', 'larissasilva@example.com', current_timestamp, false, 0, 'teste'),
('teste/8', 'www.domain.com/carolinamartins/9', 'joseoliveira@example.com', current_timestamp, false, 0, 'teste'),
('teste/9', 'www.domain.com/felipesilveira/10', 'carolinamartins@example.com', current_timestamp, false, 0, 'teste'),
('teste/10', 'www.domain.com/fernandacampos/11', 'felipesilveira@example.com', current_timestamp, false, 0, 'teste'),
('teste/11', 'www.domain.com/gabrielsantana/12', 'fernandacampos@example.com', current_timestamp, false, 0, 'teste'),
('teste/12', 'www.domain.com/isabelasouza/13', 'gabrielsantana@example.com', current_timestamp, false, 0, 'teste'),
('teste/13', 'www.domain.com/rafaelalmeida/14', 'isabelasouza@example.com', current_timestamp, false, 0, 'teste'),
('teste/14', 'www.domain.com/victormoreira/15', 'rafaelalmeida@example.com', current_timestamp, false, 0, 'teste'),
('teste/15', 'www.domain.com/julianalima/16', 'victormoreira@example.com', current_timestamp, false, 0, 'teste'),
('teste/16', 'www.domain.com/paulohenrique/17', 'julianalima@example.com', current_timestamp, false, 0, 'teste'),
('teste/17', 'www.domain.com/marcosilva/18', 'paulohenrique@example.com', current_timestamp, false, 0, 'teste'),
('teste/18', 'www.domain.com/fernandalima/19', 'marcosilva@example.com', current_timestamp, false, 0, 'teste'),
('teste/19', 'www.domain.com/luciamartins/20', 'fernandalima@example.com', current_timestamp, false, 0, 'teste'),
('teste/20', 'www.domain.com/gabrielsantos/21', 'luciamartins@example.com', current_timestamp, false, 0, 'teste'),
('teste/34', 'www.domain.com/georgelima/1', 'ricardosilveira@example.com', current_timestamp, false, 0, 'teste'),
('teste/35', 'www.domain.com/amandacruz/2', 'georgelima@example.com', current_timestamp, false, 0, 'teste'),
('teste/36', 'www.domain.com/ianribeiro/3', 'amandacruz@example.com', current_timestamp, false, 0, 'teste'),
('teste/37', 'www.domain.com/joaosilva/4', 'ianribeiro@example.com', current_timestamp, false, 0, 'teste'),
('teste/38', 'www.domain.com/marianasantos/5', 'joaosilva@example.com', current_timestamp, false, 0, 'teste'),
('teste/39', 'www.domain.com/pedrocosta/6', 'marianasantos@example.com', current_timestamp, false, 0, 'teste'),
('teste/40', 'www.domain.com/larissasilva/7', 'pedrocosta@example.com', current_timestamp, false, 0, 'teste'),
('teste/41', 'www.domain.com/joseoliveira/8', 'larissasilva@example.com', current_timestamp, false, 0, 'teste'),
('teste/42', 'www.domain.com/carolinamartins/9', 'joseoliveira@example.com', current_timestamp, false, 0, 'teste'),
('teste/43', 'www.domain.com/felipesilveira/10', 'carolinamartins@example.com', current_timestamp, false, 0, 'teste'),
('teste/44', 'www.domain.com/fernandacampos/11', 'felipesilveira@example.com', current_timestamp, false, 0, 'teste'),
('teste/45', 'www.domain.com/gabrielsantana/12', 'fernandacampos@example.com', current_timestamp, false, 0, 'teste'),
('teste/46', 'www.domain.com/isabelasouza/13', 'gabrielsantana@example.com', current_timestamp, false, 0, 'teste'),
('teste/47', 'www.domain.com/rafaelalmeida/14', 'isabelasouza@example.com', current_timestamp, false, 0, 'teste'),
('teste/48', 'www.domain.com/victormoreira/15', 'rafaelalmeida@example.com', current_timestamp, false, 0, 'teste'),
('teste/49', 'www.domain.com/julianalima/16', 'victormoreira@example.com', current_timestamp, false, 0, 'teste'),
('teste/50', 'www.domain.com/paulohenrique/17', 'julianalima@example.com', current_timestamp, false, 0, 'teste'),
('teste/51', 'www.domain.com/marcosilva/18', 'paulohenrique@example.com', current_timestamp, false, 0, 'teste'),
('teste/52', 'www.domain.com/fernandalima/19', 'marcosilva@example.com', current_timestamp, false, 0, 'teste'),
('teste/53', 'www.domain.com/luciamartins/20', 'fernandalima@example.com', current_timestamp, false, 0, 'teste'),
('teste/54', 'www.domain.com/gabrielsantos/21', 'luciamartins@example.com', current_timestamp, false, 0, 'teste'),
('teste/64', 'www.domain.com/juliasantos/31', 'pedroalmeida@example.com', current_timestamp, false, 0, 'teste'),
('teste/65', 'www.domain.com/felipefernandes/34', 'juliasantos@example.com', current_timestamp, false, 0, 'teste'),
('teste/66', 'www.domain.com/sabrinacosta/35', 'felipefernandes@example.com', current_timestamp, false, 0, 'teste'),
('teste/67', 'www.domain.com/ricardosilveira/36', 'sabrinacosta@example.com', current_timestamp, false, 0, 'teste'),
('teste/68', 'www.domain.com/georgelima/1', 'ricardosilveira@example.com', current_timestamp, false, 0, 'teste'),
('teste/69', 'www.domain.com/amandacruz/2', 'georgelima@example.com', current_timestamp, false, 0, 'teste'),
('teste/70', 'www.domain.com/ianribeiro/3', 'amandacruz@example.com', current_timestamp, false, 0, 'teste'),
('teste/71', 'www.domain.com/joaosilva/4', 'ianribeiro@example.com', current_timestamp, false, 0, 'teste'),
('teste/72', 'www.domain.com/marianasantos/5', 'joaosilva@example.com', current_timestamp, false, 0, 'teste'),
('teste/73', 'www.domain.com/pedrocosta/6', 'marianasantos@example.com', current_timestamp, false, 0, 'teste'),
('teste/74', 'www.domain.com/larissasilva/7', 'pedrocosta@example.com', current_timestamp, false, 0, 'teste'),
('teste/75', 'www.domain.com/joseoliveira/8', 'larissasilva@example.com', current_timestamp, false, 0, 'teste'),
('teste/76', 'www.domain.com/carolinamartins/9', 'joseoliveira@example.com', current_timestamp, false, 0, 'teste'),
('teste/77', 'www.domain.com/felipesilveira/10', 'carolinamartins@example.com', current_timestamp, false, 0, 'teste'),
('teste/78', 'www.domain.com/fernandacampos/11', 'felipesilveira@example.com', current_timestamp, false, 0, 'teste'),
('teste/79', 'www.domain.com/gabrielsantana/12', 'fernandacampos@example.com', current_timestamp, false, 0, 'teste'),
('teste/80', 'www.domain.com/isabelasouza/13', 'gabrielsantana@example.com', current_timestamp, false, 0, 'teste');


--2)a)ii

select * from usuario;

select * from postagem
order by autor;

select * from segue;
select * from curte;
select * from comentario;

--Consulta que devolve a quantidade de comentários que um post teve
select p.autor, p.conteudo, count(c.url_com) --url, titulo, autor(nome), count
from postagem p left join comentario c
on p.url = c.url_post
group by p.autor, p.conteudo
order by p.autor;

--Devolve a quantidade de seguidores de cada usuário, ordenado do mais seguido para o menos
select u.nickname as usuario, count(s.seguidor) as seguidores
from segue s join usuario u
on s.seguido = u.email
group by usuario
order by seguidores desc;

--Devolve a quantidade de curtidas de cada post, ordenado do mais curtido para o menos
select postagem_curtida as post, count(quem_curtiu) as curtidas 
from curte
group by post
order by curtidas desc;
