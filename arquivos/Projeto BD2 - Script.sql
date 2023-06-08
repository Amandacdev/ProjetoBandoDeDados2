-- drop table segue;
-- drop table curtidas_coment;
-- drop table curtidas_post;
-- drop table comentario;
-- drop table postagem;
-- drop table usuario;

--Grupo: Amanda, George e Ian

--2)a)i)Tabelas e constraints (PK, FK, UNIQUE, campos que não podem ter valores nulos, checks de validação) de acordo com as regras de negócio do projeto.

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
titulo varchar(50) not null,
conteudo text not null,
datahora timestamp not null);

alter table postagem
add constraint pk_postagem primary key(url),
add constraint fk_postagem_usuario foreign key(autor) references usuario;


create table comentario(
url_coment varchar(500),
url_post varchar(500) not null,
comentador varchar(45) not null,
conteudo text not null,
datahora timestamp not null,
editado boolean not null);

alter table comentario
add constraint pk_comentario primary key(url_coment),
add constraint fk_comentario_postagem foreign key(url_post) references postagem,
add constraint fk_comentario_usuario foreign key(comentador) references usuario;


create table segue(
seguidor varchar(45),
seguido varchar(45));

alter table segue
add constraint pk_segue primary key(seguidor, seguido),
add constraint fk_segue_usuario_seguidor foreign key(seguidor) references usuario,
add constraint fk_segue_usuario_seguido foreign key(seguido) references usuario;


create table curtidas_post(
quem_curtiu varchar(45),
postagem_curtida varchar(500));

alter table curtidas_post
add constraint pk_curtidas_post primary key(quem_curtiu, postagem_curtida),
add constraint fk_curtidas_post_usuario foreign key(quem_curtiu) references usuario,
add constraint fk_curtidas_post_postagem foreign key(postagem_curtida) references postagem;


create table curtidas_coment(
quem_curtiu varchar(45),
comentario_curtido varchar(500));

alter table curtidas_coment
add constraint pk_curtidas_coment primary key(quem_curtiu, comentario_curtido),
add constraint fk_curtidas_coment_usuario foreign key(quem_curtiu) references usuario,
add constraint fk_curtidas_coment_comentario foreign key(comentario_curtido) references comentario;



--Inserções

insert into usuario values
('georgelima@gmail.com', '$trongPassw0rd', 'georgelima', 'George Lima', '1993-11-21'),
('amandacruz@gmail.com', '$trongPassw0rd2', 'amandacruz', 'Amanda Cruz', '1995-05-26'),
('ianribeiro@gmail.com', '$trongPassw0rd3', 'ianribeiro', 'Ian Ribeiro', '2000-02-01'),
('joaosilva@gmail.com', 'P@ssw0rd123', 'joaosilva', 'João Silva', '1990-09-12'),
('marianasantos@gmail.com', 'MyP@ssw0rd!', 'marianasantos', 'Mariana Santos', '1988-07-03'),
('pedrocosta@gmail.com', 'Passw0rd123!', 'pedrocosta', 'Pedro Costa', '1992-11-08'),
('larissasilva@gmail.com', 'Str0ngP@ss!', 'larissasilva', 'Larissa Silva', '1997-02-14'),
('joseoliveira@gmail.com', 'P@ssw0rd456', 'joseoliveira', 'José Oliveira', '1985-06-30'),
('carolinamartins@gmail.com', 'Passw0rd789!', 'carolinamartins', 'Carolina Martins', '1991-04-17'),
('felipesilveira@gmail.com', 'MyP@ssw0rd123', 'felipesilveira', 'Felipe Silveira', '1994-09-03'),
('fernandacampos@gmail.com', 'P@ssw0rd987', 'fernandacampos', 'Fernanda Campos', '1993-07-21'),
('gabrielsantana@gmail.com', 'Passw0rd!@#', 'gabrielsantana', 'Gabriel Santana', '1996-12-10'),
('isabelasouza@gmail.com', 'Str0ngP@ssw0rd', 'isabelasouza', 'Isabela Souza', '1989-03-25'),
('rafaelalmeida@gmail.com', 'P@ssw0rd654', 'rafaelalmeida', 'Rafael Almeida', '1998-08-07'),
('victormoreira@gmail.com', 'MyP@ssw0rd987', 'victormoreira', 'Victor Moreira', '1992-05-22'),
('julianalima@gmail.com', 'P@ssw0rd!@#', 'julianalima', 'Juliana Lima', '1993-10-12'),
('paulohenrique@gmail.com', 'Passw0rd123!', 'paulohenrique', 'Paulo Henrique', '1987-09-01'),
('marcosilva@gmail.com', 'P@ssw0rd456', 'marcosilva', 'Marco Silva', '1996-03-18'),
('fernandalima@gmail.com', 'Passw0rd789!', 'fernandalima', 'Fernanda Lima', '1991-11-27'),
('luciamartins@gmail.com', 'P@ssw0rd789', 'luciamartins', 'Lúcia Martins', '1996-06-05'),
('gabrielsantos@gmail.com', 'P@ssw0rd!@#', 'gabrielsantos', 'Gabriel Santos', '1994-04-17'),
('anacosta@gmail.com', 'MyP@ssw0rd123', 'anacosta', 'Ana Costa', '1992-11-23'),
('rodrigofaria@gmail.com', 'P@ssw0rd987', 'rodrigofaria', 'Rodrigo Faria', '1989-10-07'),
('lauramendes@gmail.com', 'P@ssw0rd!@#', 'lauramendes', 'Laura Mendes', '1991-03-15'),
('joseferreira@gmail.com', 'Str0ngP@ssw0rd', 'joseferreira', 'José Ferreira', '1987-09-03'),
('amandasouza@gmail.com', 'Passw0rd123!', 'amandasouza', 'Amanda Souza', '1998-08-11'),
('ricardocarvalho@gmail.com', 'P@ssw0rd!@#', 'ricardocarvalho', 'Ricardo Carvalho', '1997-12-22'),
('amandalima@gmail.com', '$trongPassw0rd2', 'amandalima', 'Amanda Lima', '1990-01-04'),
('mariagomes@gmail.com', 'Gomes#2021', 'mariagomes', 'Maria Gomes', '1987-11-09'),
('pedroalmeida@gmail.com', 'Almeida@123', 'pedroalmeida', 'Pedro Almeida', '1993-07-12'),
('juliasantos@gmail.com', 'Santos@321', 'juliasantos', 'Julia Santos', '1998-03-21'),
('lucasrodrigues@gmail.com', 'Rodrigues2021!', 'lucasrodrigues', 'Lucas Rodrigues', '1991-09-02'),
('camilasilva@gmail.com', 'C@mil@2021', 'camilasilva', 'Camila Silva', '1996-12-05'),
('felipefernandes@gmail.com', 'F3rn@nd3s!', 'felipefernandes', 'Felipe Fernandes', '1988-06-25'),
('sabrinacosta@gmail.com', 'C0st@S@br1n@', 'sabrinacosta', 'Sabrina Costa', '1994-04-18'),
('ricardosilveira@gmail.com', 'S!lv3ir@2021', 'ricardosilveira', 'Ricardo Silveira', '1997-08-28');


insert into postagem values
('www.domain.com/post/georgelima/1', 'georgelima@gmail.com', 'Título da postagem 1', 'Conteúdo da postagem 1', current_timestamp),
('www.domain.com/post/amandacruz/2', 'amandacruz@gmail.com', 'Título da postagem 2', 'Conteúdo da postagem 2', current_timestamp),
('www.domain.com/post/ianribeiro/3', 'ianribeiro@gmail.com', 'Título da postagem 3', 'Conteúdo da postagem 3', current_timestamp),
('www.domain.com/post/joaosilva/4', 'joaosilva@gmail.com', 'Título da postagem 4', 'Conteúdo da postagem 4', current_timestamp),
('www.domain.com/post/marianasantos/5', 'marianasantos@gmail.com', 'Título da postagem 5', 'Conteúdo da postagem 5', current_timestamp),
('www.domain.com/post/pedrocosta/6', 'pedrocosta@gmail.com', 'Título da postagem 6', 'Conteúdo da postagem 6', current_timestamp),
('www.domain.com/post/larissasilva/7', 'larissasilva@gmail.com', 'Título da postagem 7', 'Conteúdo da postagem 7', current_timestamp),
('www.domain.com/post/joseoliveira/8', 'joseoliveira@gmail.com', 'Título da postagem 8', 'Conteúdo da postagem 8', current_timestamp),
('www.domain.com/post/carolinamartins/9', 'carolinamartins@gmail.com', 'Título da postagem 9', 'Conteúdo da postagem 9', current_timestamp),
('www.domain.com/post/felipesilveira/10', 'felipesilveira@gmail.com', 'Título da postagem 10', 'Conteúdo da postagem 10', current_timestamp),
('www.domain.com/post/fernandacampos/11', 'fernandacampos@gmail.com', 'Título da postagem 11', 'Conteúdo da postagem 11', current_timestamp),
('www.domain.com/post/gabrielsantana/12', 'gabrielsantana@gmail.com', 'Título da postagem 12', 'Conteúdo da postagem 12', current_timestamp),
('www.domain.com/post/isabelasouza/13', 'isabelasouza@gmail.com', 'Título da postagem 13', 'Conteúdo da postagem 13', current_timestamp),
('www.domain.com/post/rafaelalmeida/14', 'rafaelalmeida@gmail.com', 'Título da postagem 14', 'Conteúdo da postagem 14', current_timestamp),
('www.domain.com/post/victormoreira/15', 'victormoreira@gmail.com', 'Título da postagem 15', 'Conteúdo da postagem 15', current_timestamp),
('www.domain.com/post/julianalima/16', 'julianalima@gmail.com', 'Título da postagem 16', 'Conteúdo da postagem 16', current_timestamp),
('www.domain.com/post/paulohenrique/17', 'paulohenrique@gmail.com', 'Título da postagem 17', 'Conteúdo da postagem 17', current_timestamp),
('www.domain.com/post/marcosilva/18', 'marcosilva@gmail.com', 'Título da postagem 18', 'Conteúdo da postagem 18', current_timestamp),
('www.domain.com/post/fernandalima/19', 'fernandalima@gmail.com', 'Título da postagem 19', 'Conteúdo da postagem 19', current_timestamp),
('www.domain.com/post/luciamartins/20', 'luciamartins@gmail.com', 'Título da postagem 20', 'Conteúdo da postagem 20', current_timestamp),
('www.domain.com/post/gabrielsantos/21', 'gabrielsantos@gmail.com', 'Título da postagem 21', 'Conteúdo da postagem 21', current_timestamp),
('www.domain.com/post/anacosta/22', 'anacosta@gmail.com', 'Título da postagem 22', 'Conteúdo da postagem 22', current_timestamp),
('www.domain.com/post/rodrigofaria/23', 'rodrigofaria@gmail.com', 'Título da postagem 23', 'Conteúdo da postagem 23', current_timestamp),
('www.domain.com/post/lauramendes/24', 'lauramendes@gmail.com', 'Título da postagem 24', 'Conteúdo da postagem 24', current_timestamp),
('www.domain.com/post/joseferreira/25', 'joseferreira@gmail.com', 'Título da postagem 25', 'Conteúdo da postagem 25', current_timestamp),
('www.domain.com/post/amandasouza/26', 'amandasouza@gmail.com', 'Título da postagem 26', 'Conteúdo da postagem 26', current_timestamp),
('www.domain.com/post/ricardocarvalho/27', 'ricardocarvalho@gmail.com', 'Título da postagem 27', 'Conteúdo da postagem 27', current_timestamp),
('www.domain.com/post/amandalima/28', 'amandalima@gmail.com', 'Título da postagem 28', 'Conteúdo da postagem 28', current_timestamp),
('www.domain.com/post/mariagomes/29', 'mariagomes@gmail.com', 'Título da postagem 29', 'Conteúdo da postagem 29', current_timestamp),
('www.domain.com/post/pedroalmeida/30', 'pedroalmeida@gmail.com', 'Título da postagem 30', 'Conteúdo da postagem 30', current_timestamp),
('www.domain.com/post/juliasantos/31', 'juliasantos@gmail.com', 'Título da postagem 31', 'Conteúdo da postagem 31', current_timestamp),
('www.domain.com/post/lucasrodrigues/32', 'lucasrodrigues@gmail.com', 'Título da postagem 32', 'Conteúdo da postagem 32', current_timestamp),
('www.domain.com/post/camilasilva/33', 'camilasilva@gmail.com', 'Título da postagem 33', 'Conteúdo da postagem 33', current_timestamp),
('www.domain.com/post/felipefernandes/34', 'felipefernandes@gmail.com', 'Título da postagem 34', 'Conteúdo da postagem 34', current_timestamp),
('www.domain.com/post/sabrinacosta/35', 'sabrinacosta@gmail.com', 'Título da postagem 35', 'Conteúdo da postagem 35', current_timestamp),
('www.domain.com/post/ricardosilveira/36', 'ricardosilveira@gmail.com', 'Título da postagem 36', 'Conteúdo da postagem 36', current_timestamp),
('www.domain.com/post/ianribeiro/37', 'ianribeiro@gmail.com', 'Título da postagem 37', 'Conteúdo da postagem 37', current_timestamp);


insert into segue values
('georgelima@gmail.com', 'amandacruz@gmail.com'),
('ianribeiro@gmail.com', 'joaosilva@gmail.com'),
('marianasantos@gmail.com', 'pedrocosta@gmail.com'),
('larissasilva@gmail.com', 'joseoliveira@gmail.com'),
('carolinamartins@gmail.com', 'felipesilveira@gmail.com'),
('fernandacampos@gmail.com', 'gabrielsantana@gmail.com'),
('isabelasouza@gmail.com', 'rafaelalmeida@gmail.com'),
('victormoreira@gmail.com', 'julianalima@gmail.com'),
('paulohenrique@gmail.com', 'marcosilva@gmail.com'),
('fernandalima@gmail.com', 'luciamartins@gmail.com'),
('anacosta@gmail.com', 'rodrigofaria@gmail.com'),
('lauramendes@gmail.com', 'joseferreira@gmail.com'),
('amandasouza@gmail.com', 'ricardocarvalho@gmail.com'),
('amandalima@gmail.com', 'mariagomes@gmail.com'),
('pedroalmeida@gmail.com', 'juliasantos@gmail.com'),
('lucasrodrigues@gmail.com', 'camilasilva@gmail.com'),
('felipefernandes@gmail.com', 'sabrinacosta@gmail.com'),
('ricardosilveira@gmail.com', 'georgelima@gmail.com'),
('amandacruz@gmail.com', 'ianribeiro@gmail.com'),
('joaosilva@gmail.com', 'larissasilva@gmail.com'),
('joseoliveira@gmail.com', 'carolinamartins@gmail.com'),
('gabrielsantana@gmail.com', 'fernandacampos@gmail.com'),
('rafaelalmeida@gmail.com', 'isabelasouza@gmail.com'),
('julianalima@gmail.com', 'paulohenrique@gmail.com'),
('marcosilva@gmail.com', 'fernandalima@gmail.com'),
('luciamartins@gmail.com', 'anacosta@gmail.com'),
('rodrigofaria@gmail.com', 'lauramendes@gmail.com'),
('joseferreira@gmail.com', 'amandasouza@gmail.com'),
('ricardocarvalho@gmail.com', 'amandalima@gmail.com'),
('mariagomes@gmail.com', 'pedroalmeida@gmail.com'),
('juliasantos@gmail.com', 'lucasrodrigues@gmail.com'),
('camilasilva@gmail.com', 'felipefernandes@gmail.com'),
('sabrinacosta@gmail.com', 'ricardosilveira@gmail.com'),
('georgelima@gmail.com', 'marianasantos@gmail.com'),
('ianribeiro@gmail.com', 'georgelima@gmail.com'),
('pedrocosta@gmail.com', 'amandalima@gmail.com'),
('joseoliveira@gmail.com', 'joaosilva@gmail.com'),
('carolinamartins@gmail.com', 'larissasilva@gmail.com'),
('felipesilveira@gmail.com', 'fernandalima@gmail.com'),
('gabrielsantana@gmail.com', 'ianribeiro@gmail.com'),
('rafaelalmeida@gmail.com', 'georgelima@gmail.com'),
('julianalima@gmail.com', 'joseoliveira@gmail.com'),
('paulohenrique@gmail.com', 'larissasilva@gmail.com'),
('marcosilva@gmail.com', 'ianribeiro@gmail.com'),
('fernandalima@gmail.com', 'carolinamartins@gmail.com'),
('luciamartins@gmail.com', 'pedrocosta@gmail.com'),
('anacosta@gmail.com', 'fernandacampos@gmail.com'),
('rodrigofaria@gmail.com', 'joseferreira@gmail.com'),
('lauramendes@gmail.com', 'amandasouza@gmail.com'),
('joseferreira@gmail.com', 'ricardocarvalho@gmail.com'),
('amandasouza@gmail.com', 'mariagomes@gmail.com'),
('ricardocarvalho@gmail.com', 'juliasantos@gmail.com'),
('amandalima@gmail.com', 'pedroalmeida@gmail.com'),
('mariagomes@gmail.com', 'lucasrodrigues@gmail.com'),
('pedroalmeida@gmail.com', 'camilasilva@gmail.com'),
('juliasantos@gmail.com', 'felipefernandes@gmail.com'),
('lucasrodrigues@gmail.com', 'sabrinacosta@gmail.com'),
('camilasilva@gmail.com', 'georgelima@gmail.com'),
('felipefernandes@gmail.com', 'marianasantos@gmail.com'),
('sabrinacosta@gmail.com', 'georgelima@gmail.com');


insert into comentario values
('www.domain.com/coment/1', 'www.domain.com/post/amandacruz/2', 'georgelima@gmail.com', 'Conteúdo do comentário 1', current_timestamp, true),
('www.domain.com/coment/2', 'www.domain.com/post/ianribeiro/3', 'amandacruz@gmail.com', 'Conteúdo do comentário 2', current_timestamp, false),
('www.domain.com/coment/3', 'www.domain.com/post/joaosilva/4', 'ianribeiro@gmail.com', 'Conteúdo do comentário 3', current_timestamp, false),
('www.domain.com/coment/4', 'www.domain.com/post/marianasantos/5', 'joaosilva@gmail.com', 'Conteúdo do comentário 4', current_timestamp, false),
('www.domain.com/coment/5', 'www.domain.com/post/pedrocosta/6', 'marianasantos@gmail.com', 'Conteúdo do comentário 5', current_timestamp, false),
('www.domain.com/coment/6', 'www.domain.com/post/larissasilva/7', 'pedrocosta@gmail.com', 'Conteúdo do comentário 6', current_timestamp, false),
('www.domain.com/coment/7', 'www.domain.com/post/joseoliveira/8', 'larissasilva@gmail.com', 'Conteúdo do comentário 7', current_timestamp, false),
('www.domain.com/coment/8', 'www.domain.com/post/carolinamartins/9', 'joseoliveira@gmail.com', 'Conteúdo do comentário 8', current_timestamp, false),
('www.domain.com/coment/9', 'www.domain.com/post/felipesilveira/10', 'carolinamartins@gmail.com', 'Conteúdo do comentário 9', current_timestamp, false),
('www.domain.com/coment/10', 'www.domain.com/post/fernandacampos/11', 'felipesilveira@gmail.com', 'Conteúdo do comentário 10', current_timestamp, false),
('www.domain.com/coment/11', 'www.domain.com/post/gabrielsantana/12', 'fernandacampos@gmail.com', 'Conteúdo do comentário 11', current_timestamp, false),
('www.domain.com/coment/12', 'www.domain.com/post/isabelasouza/13', 'gabrielsantana@gmail.com', 'Conteúdo do comentário 12', current_timestamp, false),
('www.domain.com/coment/13', 'www.domain.com/post/rafaelalmeida/14', 'isabelasouza@gmail.com', 'Conteúdo do comentário 13', current_timestamp, false),
('www.domain.com/coment/14', 'www.domain.com/post/victormoreira/15', 'rafaelalmeida@gmail.com', 'Conteúdo do comentário 14', current_timestamp, false),
('www.domain.com/coment/15', 'www.domain.com/post/julianalima/16', 'victormoreira@gmail.com', 'Conteúdo do comentário 15', current_timestamp, false),
('www.domain.com/coment/16', 'www.domain.com/post/paulohenrique/17', 'julianalima@gmail.com', 'Conteúdo do comentário 16', current_timestamp, false),
('www.domain.com/coment/17', 'www.domain.com/post/marcosilva/18', 'paulohenrique@gmail.com', 'Conteúdo do comentário 17', current_timestamp, false),
('www.domain.com/coment/18', 'www.domain.com/post/fernandalima/19', 'marcosilva@gmail.com', 'Conteúdo do comentário 18', current_timestamp, false),
('www.domain.com/coment/19', 'www.domain.com/post/luciamartins/20', 'fernandalima@gmail.com', 'Conteúdo do comentário 19', current_timestamp, false),
('www.domain.com/coment/20', 'www.domain.com/post/gabrielsantos/21', 'luciamartins@gmail.com', 'Conteúdo do comentário 20', current_timestamp, false),
('www.domain.com/coment/21', 'www.domain.com/post/georgelima/1', 'ricardosilveira@gmail.com', 'Conteúdo do comentário 21', current_timestamp, false),
('www.domain.com/coment/22', 'www.domain.com/post/amandacruz/2', 'georgelima@gmail.com', 'Conteúdo do comentário 22', current_timestamp, false),
('www.domain.com/coment/23', 'www.domain.com/post/ianribeiro/3', 'amandacruz@gmail.com', 'Conteúdo do comentário 23', current_timestamp, false),
('www.domain.com/coment/24', 'www.domain.com/post/joaosilva/4', 'ianribeiro@gmail.com', 'Conteúdo do comentário 24', current_timestamp, false),
('www.domain.com/coment/25', 'www.domain.com/post/marianasantos/5', 'joaosilva@gmail.com', 'Conteúdo do comentário 25', current_timestamp, false),
('www.domain.com/coment/26', 'www.domain.com/post/pedrocosta/6', 'marianasantos@gmail.com', 'Conteúdo do comentário 26', current_timestamp, false),
('www.domain.com/coment/27', 'www.domain.com/post/larissasilva/7', 'pedrocosta@gmail.com', 'Conteúdo do comentário 27', current_timestamp, false),
('www.domain.com/coment/28', 'www.domain.com/post/joseoliveira/8', 'larissasilva@gmail.com', 'Conteúdo do comentário 28', current_timestamp, false),
('www.domain.com/coment/29', 'www.domain.com/post/carolinamartins/9', 'joseoliveira@gmail.com', 'Conteúdo do comentário 29', current_timestamp, false),
('www.domain.com/coment/30', 'www.domain.com/post/felipesilveira/10', 'carolinamartins@gmail.com', 'Conteúdo do comentário 30', current_timestamp, false),
('www.domain.com/coment/31', 'www.domain.com/post/fernandacampos/11', 'felipesilveira@gmail.com', 'Conteúdo do comentário 31', current_timestamp, false),
('www.domain.com/coment/32', 'www.domain.com/post/gabrielsantana/12', 'fernandacampos@gmail.com', 'Conteúdo do comentário 32', current_timestamp, false),
('www.domain.com/coment/33', 'www.domain.com/post/isabelasouza/13', 'gabrielsantana@gmail.com', 'Conteúdo do comentário 33', current_timestamp, false),
('www.domain.com/coment/34', 'www.domain.com/post/rafaelalmeida/14', 'isabelasouza@gmail.com', 'Conteúdo do comentário 34', current_timestamp, false),
('www.domain.com/coment/35', 'www.domain.com/post/victormoreira/15', 'rafaelalmeida@gmail.com', 'Conteúdo do comentário 35', current_timestamp, false),
('www.domain.com/coment/36', 'www.domain.com/post/julianalima/16', 'victormoreira@gmail.com', 'Conteúdo do comentário 36', current_timestamp, false),
('www.domain.com/coment/37', 'www.domain.com/post/paulohenrique/17', 'julianalima@gmail.com', 'Conteúdo do comentário 37', current_timestamp, false),
('www.domain.com/coment/38', 'www.domain.com/post/marcosilva/18', 'paulohenrique@gmail.com', 'Conteúdo do comentário 38', current_timestamp, false),
('www.domain.com/coment/39', 'www.domain.com/post/fernandalima/19', 'marcosilva@gmail.com', 'Conteúdo do comentário 39', current_timestamp, false),
('www.domain.com/coment/40', 'www.domain.com/post/luciamartins/20', 'fernandalima@gmail.com', 'Conteúdo do comentário 40', current_timestamp, false),
('www.domain.com/coment/41', 'www.domain.com/post/gabrielsantos/21', 'luciamartins@gmail.com', 'Conteúdo do comentário 41', current_timestamp, false),
('www.domain.com/coment/42', 'www.domain.com/post/georgelima/1', 'ricardosilveira@gmail.com', 'Conteúdo do comentário 42', current_timestamp, false),
('www.domain.com/coment/43', 'www.domain.com/post/amandacruz/2', 'georgelima@gmail.com', 'Conteúdo do comentário 43', current_timestamp, false),
('www.domain.com/coment/44', 'www.domain.com/post/ianribeiro/3', 'amandacruz@gmail.com', 'Conteúdo do comentário 44', current_timestamp, false),
('www.domain.com/coment/45', 'www.domain.com/post/joaosilva/4', 'ianribeiro@gmail.com', 'Conteúdo do comentário 45', current_timestamp, true),
('www.domain.com/coment/46', 'www.domain.com/post/marianasantos/5', 'joaosilva@gmail.com', 'Conteúdo do comentário 46', current_timestamp, false),
('www.domain.com/coment/47', 'www.domain.com/post/pedrocosta/6', 'marianasantos@gmail.com', 'Conteúdo do comentário 47', current_timestamp, false),
('www.domain.com/coment/48', 'www.domain.com/post/larissasilva/7', 'pedrocosta@gmail.com', 'Conteúdo do comentário 48', current_timestamp, false),
('www.domain.com/coment/49', 'www.domain.com/post/joseoliveira/8', 'larissasilva@gmail.com', 'Conteúdo do comentário 49', current_timestamp, false),
('www.domain.com/coment/50', 'www.domain.com/post/carolinamartins/9', 'joseoliveira@gmail.com', 'Conteúdo do comentário 50', current_timestamp, false),
('www.domain.com/coment/51', 'www.domain.com/post/marcosilva/18', 'paulohenrique@gmail.com', 'Conteúdo do comentário 51', current_timestamp, false),
('www.domain.com/coment/52', 'www.domain.com/post/fernandalima/19', 'marcosilva@gmail.com', 'Conteúdo do comentário 52', current_timestamp, false),
('www.domain.com/coment/53', 'www.domain.com/post/luciamartins/20', 'fernandalima@gmail.com', 'Conteúdo do comentário 53', current_timestamp, false),
('www.domain.com/coment/54', 'www.domain.com/post/gabrielsantos/21', 'luciamartins@gmail.com', 'Conteúdo do comentário 54', current_timestamp, false),
('www.domain.com/coment/55', 'www.domain.com/post/juliasantos/31', 'pedroalmeida@gmail.com', 'Conteúdo do comentário 55', current_timestamp, false),
('www.domain.com/coment/56', 'www.domain.com/post/felipefernandes/34', 'juliasantos@gmail.com', 'Conteúdo do comentário 56', current_timestamp, false),
('www.domain.com/coment/57', 'www.domain.com/post/sabrinacosta/35', 'felipefernandes@gmail.com', 'Conteúdo do comentário 57', current_timestamp, false),
('www.domain.com/coment/58', 'www.domain.com/post/ricardosilveira/36', 'sabrinacosta@gmail.com', 'Conteúdo do comentário 58', current_timestamp, false),
('www.domain.com/coment/59', 'www.domain.com/post/georgelima/1', 'ricardosilveira@gmail.com', 'Conteúdo do comentário 59', current_timestamp, false),
('www.domain.com/coment/60', 'www.domain.com/post/amandacruz/2', 'georgelima@gmail.com', 'Conteúdo do comentário 60', current_timestamp, false),
('www.domain.com/coment/61', 'www.domain.com/post/ianribeiro/3', 'amandacruz@gmail.com', 'Conteúdo do comentário 61', current_timestamp, false),
('www.domain.com/coment/62', 'www.domain.com/post/joaosilva/4', 'ianribeiro@gmail.com', 'Conteúdo do comentário 62', current_timestamp, false),
('www.domain.com/coment/63', 'www.domain.com/post/marianasantos/5', 'joaosilva@gmail.com', 'Conteúdo do comentário 63', current_timestamp, false),
('www.domain.com/coment/64', 'www.domain.com/post/pedrocosta/6', 'marianasantos@gmail.com', 'Conteúdo do comentário 64', current_timestamp, false),
('www.domain.com/coment/65', 'www.domain.com/post/larissasilva/7', 'pedrocosta@gmail.com', 'Conteúdo do comentário 65', current_timestamp, false),
('www.domain.com/coment/66', 'www.domain.com/post/joseoliveira/8', 'larissasilva@gmail.com', 'Conteúdo do comentário 66', current_timestamp, false),
('www.domain.com/coment/67', 'www.domain.com/post/carolinamartins/9', 'joseoliveira@gmail.com', 'Conteúdo do comentário 67', current_timestamp, false),
('www.domain.com/coment/68', 'www.domain.com/post/felipesilveira/10', 'carolinamartins@gmail.com', 'Conteúdo do comentário 68', current_timestamp, false),
('www.domain.com/coment/69', 'www.domain.com/post/fernandacampos/11', 'felipesilveira@gmail.com', 'Conteúdo do comentário 69', current_timestamp, false),
('www.domain.com/coment/70', 'www.domain.com/post/gabrielsantana/12', 'fernandacampos@gmail.com', 'Conteúdo do comentário 70', current_timestamp, false),
('www.domain.com/coment/71', 'www.domain.com/post/isabelasouza/13', 'gabrielsantana@gmail.com', 'Conteúdo do comentário 71', current_timestamp, false),
('www.domain.com/coment/72', 'www.domain.com/post/rafaelalmeida/14', 'isabelasouza@gmail.com', 'Conteúdo do comentário 72', current_timestamp, false),
('www.domain.com/coment/73', 'www.domain.com/post/victormoreira/15', 'rafaelalmeida@gmail.com', 'Conteúdo do comentário 73', current_timestamp, false),
('www.domain.com/coment/74', 'www.domain.com/post/julianalima/16', 'victormoreira@gmail.com', 'Conteúdo do comentário 74', current_timestamp, false),
('www.domain.com/coment/75', 'www.domain.com/post/paulohenrique/17', 'julianalima@gmail.com', 'Conteúdo do comentário 75', current_timestamp, false),
('www.domain.com/coment/76', 'www.domain.com/post/marcosilva/18', 'paulohenrique@gmail.com', 'Conteúdo do comentário 76', current_timestamp, false),
('www.domain.com/coment/77', 'www.domain.com/post/fernandalima/19', 'marcosilva@gmail.com', 'Conteúdo do comentário 77', current_timestamp, false),
('www.domain.com/coment/78', 'www.domain.com/post/luciamartins/20', 'fernandalima@gmail.com', 'Conteúdo do comentário 78', current_timestamp, false),
('www.domain.com/coment/79', 'www.domain.com/post/gabrielsantos/21', 'luciamartins@gmail.com', 'Conteúdo do comentário 79', current_timestamp, false),
('www.domain.com/coment/80', 'www.domain.com/post/juliasantos/31', 'pedroalmeida@gmail.com', 'Conteúdo do comentário 80', current_timestamp, false),
('www.domain.com/coment/81', 'www.domain.com/post/felipefernandes/34', 'juliasantos@gmail.com', 'Conteúdo do comentário 81', current_timestamp, false),
('www.domain.com/coment/82', 'www.domain.com/post/sabrinacosta/35', 'felipefernandes@gmail.com', 'Conteúdo do comentário 82', current_timestamp, false),
('www.domain.com/coment/83', 'www.domain.com/post/ricardosilveira/36', 'sabrinacosta@gmail.com', 'Conteúdo do comentário 83', current_timestamp, false),
('www.domain.com/coment/84', 'www.domain.com/post/georgelima/1', 'ricardosilveira@gmail.com', 'Conteúdo do comentário 84', current_timestamp, false),
('www.domain.com/coment/85', 'www.domain.com/post/amandacruz/2', 'georgelima@gmail.com', 'Conteúdo do comentário 85', current_timestamp, false),
('www.domain.com/coment/86', 'www.domain.com/post/ianribeiro/3', 'amandacruz@gmail.com', 'Conteúdo do comentário 86', current_timestamp, false),
('www.domain.com/coment/87', 'www.domain.com/post/joaosilva/4', 'ianribeiro@gmail.com', 'Conteúdo do comentário 87', current_timestamp, false),
('www.domain.com/coment/88', 'www.domain.com/post/marianasantos/5', 'joaosilva@gmail.com', 'Conteúdo do comentário 88', current_timestamp, false),
('www.domain.com/coment/89', 'www.domain.com/post/pedrocosta/6', 'marianasantos@gmail.com', 'Conteúdo do comentário 89', current_timestamp, false),
('www.domain.com/coment/90', 'www.domain.com/post/larissasilva/7', 'pedrocosta@gmail.com', 'Conteúdo do comentário 90', current_timestamp, false),
('www.domain.com/coment/91', 'www.domain.com/post/joseoliveira/8', 'larissasilva@gmail.com', 'Conteúdo do comentário 91', current_timestamp, false),
('www.domain.com/coment/92', 'www.domain.com/post/carolinamartins/9', 'joseoliveira@gmail.com', 'Conteúdo do comentário 92', current_timestamp, false),
('www.domain.com/coment/93', 'www.domain.com/post/felipesilveira/10', 'carolinamartins@gmail.com', 'Conteúdo do comentário 93', current_timestamp, false),
('www.domain.com/coment/94', 'www.domain.com/post/fernandacampos/11', 'felipesilveira@gmail.com', 'Conteúdo do comentário 94', current_timestamp, false),
('www.domain.com/coment/95', 'www.domain.com/post/gabrielsantana/12', 'fernandacampos@gmail.com', 'Conteúdo do comentário 95', current_timestamp, false),
('www.domain.com/coment/96', 'www.domain.com/post/isabelasouza/13', 'gabrielsantana@gmail.com', 'Conteúdo do comentário 96', current_timestamp, false),
('www.domain.com/coment/97', 'www.domain.com/post/rafaelalmeida/14', 'isabelasouza@gmail.com', 'Conteúdo do comentário 97', current_timestamp, false),
('www.domain.com/coment/98', 'www.domain.com/post/victormoreira/15', 'rafaelalmeida@gmail.com', 'Conteúdo do comentário 98', current_timestamp, false),
('www.domain.com/coment/99', 'www.domain.com/post/julianalima/16', 'victormoreira@gmail.com', 'Conteúdo do comentário 99', current_timestamp, false),
('www.domain.com/coment/100', 'www.domain.com/post/paulohenrique/17', 'julianalima@gmail.com', 'Conteúdo do comentário 100', current_timestamp, false);


insert into curtidas_post values
('georgelima@gmail.com', 'www.domain.com/post/amandacruz/2'),
('amandacruz@gmail.com', 'www.domain.com/post/ianribeiro/3'),
('ianribeiro@gmail.com', 'www.domain.com/post/joaosilva/4'),
('joaosilva@gmail.com', 'www.domain.com/post/marianasantos/5'),
('marianasantos@gmail.com', 'www.domain.com/post/pedrocosta/6'),
('pedrocosta@gmail.com', 'www.domain.com/post/larissasilva/7'),
('larissasilva@gmail.com', 'www.domain.com/post/joseoliveira/8'),
('joseoliveira@gmail.com', 'www.domain.com/post/carolinamartins/9'),
('carolinamartins@gmail.com', 'www.domain.com/post/felipesilveira/10'),
('felipesilveira@gmail.com', 'www.domain.com/post/fernandacampos/11'),
('fernandacampos@gmail.com', 'www.domain.com/post/gabrielsantana/12'),
('gabrielsantana@gmail.com', 'www.domain.com/post/isabelasouza/13'),
('isabelasouza@gmail.com', 'www.domain.com/post/rafaelalmeida/14'),
('rafaelalmeida@gmail.com', 'www.domain.com/post/victormoreira/15'),
('victormoreira@gmail.com', 'www.domain.com/post/julianalima/16'),
('julianalima@gmail.com', 'www.domain.com/post/paulohenrique/17'),
('paulohenrique@gmail.com', 'www.domain.com/post/marcosilva/18'),
('marcosilva@gmail.com', 'www.domain.com/post/fernandalima/19'),
('fernandalima@gmail.com', 'www.domain.com/post/luciamartins/20'),
('luciamartins@gmail.com', 'www.domain.com/post/gabrielsantos/21'),
('anacosta@gmail.com', 'www.domain.com/post/rodrigofaria/23'),
('rodrigofaria@gmail.com', 'www.domain.com/post/lauramendes/24'),
('lauramendes@gmail.com', 'www.domain.com/post/joseferreira/25'),
('joseferreira@gmail.com', 'www.domain.com/post/amandasouza/26'),
('amandasouza@gmail.com', 'www.domain.com/post/ricardocarvalho/27'),
('ricardocarvalho@gmail.com', 'www.domain.com/post/amandalima/28'),
('amandalima@gmail.com', 'www.domain.com/post/mariagomes/29'),
('mariagomes@gmail.com', 'www.domain.com/post/pedroalmeida/30'),
('pedroalmeida@gmail.com', 'www.domain.com/post/juliasantos/31'),
('juliasantos@gmail.com', 'www.domain.com/post/lucasrodrigues/32'),
('lucasrodrigues@gmail.com', 'www.domain.com/post/camilasilva/33'),
('felipefernandes@gmail.com', 'www.domain.com/post/sabrinacosta/35'),
('sabrinacosta@gmail.com', 'www.domain.com/post/ricardosilveira/36'),
('georgelima@gmail.com', 'www.domain.com/post/carolinamartins/9'),
('amandacruz@gmail.com', 'www.domain.com/post/gabrielsantana/12'),
('ianribeiro@gmail.com', 'www.domain.com/post/luciamartins/20'),
('joaosilva@gmail.com', 'www.domain.com/post/juliasantos/31'),
('marianasantos@gmail.com', 'www.domain.com/post/rodrigofaria/23'),
('pedrocosta@gmail.com', 'www.domain.com/post/fernandalima/19'),
('larissasilva@gmail.com', 'www.domain.com/post/ianribeiro/3'),
('joseoliveira@gmail.com', 'www.domain.com/post/pedrocosta/6'),
('carolinamartins@gmail.com', 'www.domain.com/post/victormoreira/15'),
('felipesilveira@gmail.com', 'www.domain.com/post/amandasouza/26'),
('fernandacampos@gmail.com', 'www.domain.com/post/paulohenrique/17'),
('gabrielsantana@gmail.com', 'www.domain.com/post/mariagomes/29'),
('isabelasouza@gmail.com', 'www.domain.com/post/fernandacampos/11'),
('rafaelalmeida@gmail.com', 'www.domain.com/post/ricardocarvalho/27'),
('julianalima@gmail.com', 'www.domain.com/post/joaosilva/4'),
('paulohenrique@gmail.com', 'www.domain.com/post/marianasantos/5'),
('marcosilva@gmail.com', 'www.domain.com/post/ianribeiro/3'),
('fernandalima@gmail.com', 'www.domain.com/post/joseoliveira/8'),
('luciamartins@gmail.com', 'www.domain.com/post/fernandalima/19'),
('gabrielsantos@gmail.com', 'www.domain.com/post/ianribeiro/3'),
('rodrigofaria@gmail.com', 'www.domain.com/post/fernandalima/19'),
('lauramendes@gmail.com', 'www.domain.com/post/juliasantos/31'),
('joseferreira@gmail.com', 'www.domain.com/post/rodrigofaria/23'),
('amandasouza@gmail.com', 'www.domain.com/post/pedroalmeida/30'),
('ricardocarvalho@gmail.com', 'www.domain.com/post/amandasouza/26'),
('felipefernandes@gmail.com', 'www.domain.com/post/gabrielsantana/12'),
('ricardosilveira@gmail.com', 'www.domain.com/post/felipefernandes/34'),
('amandacruz@gmail.com', 'www.domain.com/post/joaosilva/4'),
('ianribeiro@gmail.com', 'www.domain.com/post/carolinamartins/9'),
('joaosilva@gmail.com', 'www.domain.com/post/gabrielsantana/12'),
('marianasantos@gmail.com', 'www.domain.com/post/luciamartins/20'),
('pedrocosta@gmail.com', 'www.domain.com/post/juliasantos/31'),
('larissasilva@gmail.com', 'www.domain.com/post/rodrigofaria/23'),
('joseoliveira@gmail.com', 'www.domain.com/post/fernandalima/19'),
('carolinamartins@gmail.com', 'www.domain.com/post/ianribeiro/3'),
('felipesilveira@gmail.com', 'www.domain.com/post/pedrocosta/6'),
('fernandacampos@gmail.com', 'www.domain.com/post/victormoreira/15'),
('gabrielsantana@gmail.com', 'www.domain.com/post/amandasouza/26'),
('isabelasouza@gmail.com', 'www.domain.com/post/paulohenrique/17'),
('rafaelalmeida@gmail.com', 'www.domain.com/post/mariagomes/29'),
('victormoreira@gmail.com', 'www.domain.com/post/fernandalima/19'),
('julianalima@gmail.com', 'www.domain.com/post/ricardocarvalho/27'),
('paulohenrique@gmail.com', 'www.domain.com/post/julianalima/16'),
('marcosilva@gmail.com', 'www.domain.com/post/joaosilva/4'),
('fernandalima@gmail.com', 'www.domain.com/post/marianasantos/5'),
('luciamartins@gmail.com', 'www.domain.com/post/ianribeiro/3'),
('gabrielsantos@gmail.com', 'www.domain.com/post/joseoliveira/8'),
('anacosta@gmail.com', 'www.domain.com/post/fernandalima/19'),
('rodrigofaria@gmail.com', 'www.domain.com/post/juliasantos/31'),
('lauramendes@gmail.com', 'www.domain.com/post/rodrigofaria/23');


insert into curtidas_coment values
('georgelima@gmail.com', 'www.domain.com/coment/1'),
('amandacruz@gmail.com', 'www.domain.com/coment/2'),
('ianribeiro@gmail.com', 'www.domain.com/coment/3'),
('joaosilva@gmail.com', 'www.domain.com/coment/4'),
('marianasantos@gmail.com', 'www.domain.com/coment/5'),
('pedrocosta@gmail.com', 'www.domain.com/coment/6'),
('larissasilva@gmail.com', 'www.domain.com/coment/7'),
('joseoliveira@gmail.com', 'www.domain.com/coment/8'),
('carolinamartins@gmail.com', 'www.domain.com/coment/9'),
('felipesilveira@gmail.com', 'www.domain.com/coment/10'),
('fernandacampos@gmail.com', 'www.domain.com/coment/11'),
('gabrielsantana@gmail.com', 'www.domain.com/coment/12'),
('isabelasouza@gmail.com', 'www.domain.com/coment/13'),
('rafaelalmeida@gmail.com', 'www.domain.com/coment/14'),
('victormoreira@gmail.com', 'www.domain.com/coment/15'),
('julianalima@gmail.com', 'www.domain.com/coment/16'),
('paulohenrique@gmail.com', 'www.domain.com/coment/17'),
('marcosilva@gmail.com', 'www.domain.com/coment/18'),
('fernandalima@gmail.com', 'www.domain.com/coment/19'),
('luciamartins@gmail.com', 'www.domain.com/coment/20'),
('gabrielsantos@gmail.com', 'www.domain.com/coment/21'),
('anacosta@gmail.com', 'www.domain.com/coment/22'),
('rodrigofaria@gmail.com', 'www.domain.com/coment/23'),
('lauramendes@gmail.com', 'www.domain.com/coment/24'),
('joseferreira@gmail.com', 'www.domain.com/coment/25'),
('amandasouza@gmail.com', 'www.domain.com/coment/26'),
('ricardocarvalho@gmail.com', 'www.domain.com/coment/27'),
('amandalima@gmail.com', 'www.domain.com/coment/28'),
('mariagomes@gmail.com', 'www.domain.com/coment/29'),
('pedroalmeida@gmail.com', 'www.domain.com/coment/30'),
('juliasantos@gmail.com', 'www.domain.com/coment/31'),
('lucasrodrigues@gmail.com', 'www.domain.com/coment/32'),
('camilasilva@gmail.com', 'www.domain.com/coment/33'),
('felipefernandes@gmail.com', 'www.domain.com/coment/34'),
('sabrinacosta@gmail.com', 'www.domain.com/coment/35'),
('ricardosilveira@gmail.com', 'www.domain.com/coment/36'),
('georgelima@gmail.com', 'www.domain.com/coment/37'),
('amandacruz@gmail.com', 'www.domain.com/coment/38'),
('ianribeiro@gmail.com', 'www.domain.com/coment/39'),
('joaosilva@gmail.com', 'www.domain.com/coment/40'),
('marianasantos@gmail.com', 'www.domain.com/coment/41'),
('pedrocosta@gmail.com', 'www.domain.com/coment/42'),
('larissasilva@gmail.com', 'www.domain.com/coment/43'),
('joseoliveira@gmail.com', 'www.domain.com/coment/44'),
('carolinamartins@gmail.com', 'www.domain.com/coment/45'),
('felipesilveira@gmail.com', 'www.domain.com/coment/46'),
('fernandacampos@gmail.com', 'www.domain.com/coment/47'),
('gabrielsantana@gmail.com', 'www.domain.com/coment/48'),
('isabelasouza@gmail.com', 'www.domain.com/coment/49'),
('rafaelalmeida@gmail.com', 'www.domain.com/coment/50'),
('victormoreira@gmail.com', 'www.domain.com/coment/51'),
('julianalima@gmail.com', 'www.domain.com/coment/52'),
('paulohenrique@gmail.com', 'www.domain.com/coment/53'),
('marcosilva@gmail.com', 'www.domain.com/coment/54'),
('fernandalima@gmail.com', 'www.domain.com/coment/55'),
('luciamartins@gmail.com', 'www.domain.com/coment/56'),
('gabrielsantos@gmail.com', 'www.domain.com/coment/57'),
('anacosta@gmail.com', 'www.domain.com/coment/58'),
('rodrigofaria@gmail.com', 'www.domain.com/coment/59'),
('lauramendes@gmail.com', 'www.domain.com/coment/60'),
('joseferreira@gmail.com', 'www.domain.com/coment/61'),
('amandasouza@gmail.com', 'www.domain.com/coment/62'),
('ricardocarvalho@gmail.com', 'www.domain.com/coment/63'),
('amandalima@gmail.com', 'www.domain.com/coment/64'),
('mariagomes@gmail.com', 'www.domain.com/coment/65'),
('pedroalmeida@gmail.com', 'www.domain.com/coment/66'),
('juliasantos@gmail.com', 'www.domain.com/coment/67'),
('lucasrodrigues@gmail.com', 'www.domain.com/coment/68'),
('camilasilva@gmail.com', 'www.domain.com/coment/69'),
('felipefernandes@gmail.com', 'www.domain.com/coment/70'),
('sabrinacosta@gmail.com', 'www.domain.com/coment/71'),
('ricardosilveira@gmail.com', 'www.domain.com/coment/72'),
('georgelima@gmail.com', 'www.domain.com/coment/73'),
('amandacruz@gmail.com', 'www.domain.com/coment/74'),
('ianribeiro@gmail.com', 'www.domain.com/coment/75'),
('joaosilva@gmail.com', 'www.domain.com/coment/76'),
('marianasantos@gmail.com', 'www.domain.com/coment/77'),
('pedrocosta@gmail.com', 'www.domain.com/coment/78'),
('larissasilva@gmail.com', 'www.domain.com/coment/79'),
('joseoliveira@gmail.com', 'www.domain.com/coment/80'),
('carolinamartins@gmail.com', 'www.domain.com/coment/81'),
('felipesilveira@gmail.com', 'www.domain.com/coment/82'),
('fernandacampos@gmail.com', 'www.domain.com/coment/83'),
('gabrielsantana@gmail.com', 'www.domain.com/coment/84'),
('isabelasouza@gmail.com', 'www.domain.com/coment/85'),
('rafaelalmeida@gmail.com', 'www.domain.com/coment/86'),
('victormoreira@gmail.com', 'www.domain.com/coment/87'),
('julianalima@gmail.com', 'www.domain.com/coment/88'),
('paulohenrique@gmail.com', 'www.domain.com/coment/89'),
('marcosilva@gmail.com', 'www.domain.com/coment/90'),
('fernandalima@gmail.com', 'www.domain.com/coment/91'),
('luciamartins@gmail.com', 'www.domain.com/coment/92'),
('gabrielsantos@gmail.com', 'www.domain.com/coment/93'),
('anacosta@gmail.com', 'www.domain.com/coment/94'),
('rodrigofaria@gmail.com', 'www.domain.com/coment/95'),
('lauramendes@gmail.com', 'www.domain.com/coment/96'),
('joseferreira@gmail.com', 'www.domain.com/coment/97'),
('amandasouza@gmail.com', 'www.domain.com/coment/98'),
('ricardocarvalho@gmail.com', 'www.domain.com/coment/99'),
('amandalima@gmail.com', 'www.domain.com/coment/100'),
('georgelima@gmail.com', 'www.domain.com/coment/4'),
('amandacruz@gmail.com', 'www.domain.com/coment/5'),
('ianribeiro@gmail.com', 'www.domain.com/coment/1'),
('joaosilva@gmail.com', 'www.domain.com/coment/9'),
('marianasantos@gmail.com', 'www.domain.com/coment/2'),
('pedrocosta@gmail.com', 'www.domain.com/coment/10'),
('larissasilva@gmail.com', 'www.domain.com/coment/6'),
('joseoliveira@gmail.com', 'www.domain.com/coment/2'),
('carolinamartins@gmail.com', 'www.domain.com/coment/8'),
('felipesilveira@gmail.com', 'www.domain.com/coment/3'),
('fernandacampos@gmail.com', 'www.domain.com/coment/6'),
('gabrielsantana@gmail.com', 'www.domain.com/coment/4'),
('isabelasouza@gmail.com', 'www.domain.com/coment/1'),
('rafaelalmeida@gmail.com', 'www.domain.com/coment/3'),
('victormoreira@gmail.com', 'www.domain.com/coment/7'),
('julianalima@gmail.com', 'www.domain.com/coment/9'),
('paulohenrique@gmail.com', 'www.domain.com/coment/5'),
('marcosilva@gmail.com', 'www.domain.com/coment/10'),
('fernandalima@gmail.com', 'www.domain.com/coment/1'),
('luciamartins@gmail.com', 'www.domain.com/coment/7'),
('gabrielsantos@gmail.com', 'www.domain.com/coment/8'),
('anacosta@gmail.com', 'www.domain.com/coment/4'),
('rodrigofaria@gmail.com', 'www.domain.com/coment/5'),
('lauramendes@gmail.com', 'www.domain.com/coment/10'),
('joseferreira@gmail.com', 'www.domain.com/coment/3'),
('amandasouza@gmail.com', 'www.domain.com/coment/1'),
('ricardocarvalho@gmail.com', 'www.domain.com/coment/6'),
('amandalima@gmail.com', 'www.domain.com/coment/7'),
('mariagomes@gmail.com', 'www.domain.com/coment/2'),
('pedroalmeida@gmail.com', 'www.domain.com/coment/9'),
('juliasantos@gmail.com', 'www.domain.com/coment/10'),
('lucasrodrigues@gmail.com', 'www.domain.com/coment/8'),
('camilasilva@gmail.com', 'www.domain.com/coment/5'),
('felipefernandes@gmail.com', 'www.domain.com/coment/4'),
('sabrinacosta@gmail.com', 'www.domain.com/coment/3'),
('ricardosilveira@gmail.com', 'www.domain.com/coment/2'),
('amandacruz@gmail.com', 'www.domain.com/coment/6'),
('ianribeiro@gmail.com', 'www.domain.com/coment/7'),
('joaosilva@gmail.com', 'www.domain.com/coment/8'),
('marianasantos@gmail.com', 'www.domain.com/coment/9'),
('larissasilva@gmail.com', 'www.domain.com/coment/3'),
('joseoliveira@gmail.com', 'www.domain.com/coment/5'),
('carolinamartins@gmail.com', 'www.domain.com/coment/6'),
('felipesilveira@gmail.com', 'www.domain.com/coment/2'),
('fernandacampos@gmail.com', 'www.domain.com/coment/1'),
('gabrielsantana@gmail.com', 'www.domain.com/coment/7'),
('isabelasouza@gmail.com', 'www.domain.com/coment/10'),
('rafaelalmeida@gmail.com', 'www.domain.com/coment/8'),
('victormoreira@gmail.com', 'www.domain.com/coment/4');



--2)a)ii)10 consultas variadas de acordo com requisitos da aplicação, com justificativa semântica e conforme critérios seguintes:

select * from usuario;	
select * from postagem;
select * from segue;
select * from comentario;
select * from curtidas_post;
select * from curtidas_coment;

--•1 consulta com uma tabela usando operadores básicos de filtro (e.g., IN, between, is null, etc).

--Consulta que retorna a quantidade de postagens feitas no mês de junho do ano 2023.
select count(*) as qtde_posts
from postagem
where datahora between '2023-06-01 00:00:00.201758' and '2023-06-30 00:00:00.201758';


--• 3 consultas com inner JOIN na cláusula FROM (pode ser self join, caso o domínio indique esse uso).

--Consulta que retorna o número de postagens de usuários com mais de 32 anos
select count(u.email) as qtde_posts
from usuario u
inner join postagem p
on p.autor = u.email
where (select round((current_date - datanasc)/365)) > 32;

--Consulta que retorna comentarios editados e o email de quem comentou
/*
UPDATE comentario
SET editado = true
WHERE url_coment = 'www.domain.com/coment/1';

UPDATE comentario
SET editado = true
WHERE url_coment = 'www.domain.com/coment/45';
*/
select c.url_coment, c.url_post, u.email as autor, c.conteudo
from comentario c
join usuario u
on c.comentador = u.email
where c.editado=true;

-- Consulta que retorna os comentários que não tiveram curtidas
select c.url_coment,c.comentador as autor 
from comentario c
join curtidas_coment u
on u.comentario_curtido=c.url_coment
group by c.url_coment
having count(u.quem_curtiu) = 6;

/*Para verificar consulta acima, uma consulta que retorna o numero de curtidas dos comentarios
select c.url_coment,c.comentador as autor, count(u.quem_curtiu) as numero_curtidas
from comentario c
join curtidas_coment u
on u.comentario_curtido=c.url_coment
group by c.url_coment;
*/


--•1 consulta com left/right/full outer join na cláusula FROM

--Consulta que retorna a quantidade de comentários que os posts tiveram, do mais comentado para o menos
select p.url as post, p.titulo, u.nickname as autor, count(c.url_coment) as qtde_coments
from postagem p left join comentario c
on p.url = c.url_post
join usuario u
on p.autor = u.email
group by p.url, p.titulo, u.nickname
order by qtde_coments desc;


--•2 consultas usando Group By (e possivelmente o having)

--Consulta que retorna a quantidade de seguidores de cada usuário, ordenado do mais seguido para o menos
select u.nickname as usuario, count(s.seguidor) as seguidores
from segue s right join usuario u
on s.seguido = u.email
group by usuario
order by seguidores desc;

--Consulta que retorna a quantidade de curtidas de cada post, ordenado do mais curtido para o menos
select p.url as post, count(c.quem_curtiu) as curtidas 
from curtidas_post c right join postagem p
on c.postagem_curtida = p.url
group by post
order by curtidas desc;

--• 1 consulta usando alguma operação de conjunto (union, except ou intersect)
--Consulta que retorna os usuarios que comentaram algum post e que curtiram algum post(sinal de atividade na rede)
select u.nome,u.email
from usuario u
join curtidas_coment cc
on cc.quem_curtiu = u.email
INTERSECT
select u.nome,u.email
from usuario u
join curtidas_post cp
on cp.quem_curtiu = u.email;


--• 2 consultas que usem subqueries.

--Consulta que retorna as postagens com número de curtidas abaixo da média (postagens de baixo engajamento)
with count_curtidas as
(select postagem_curtida, count(quem_curtiu) as curtidas
from curtidas_post
group by postagem_curtida)
select p.url, p.titulo, u.nickname as autor, c.curtidas, p.datahora
from postagem p join usuario u
on p.autor = u.email
join count_curtidas c
on p.url = c.postagem_curtida
where c.curtidas < (select avg(curtidas) from count_curtidas)
order by c.curtidas desc;

--






--2)b)Visões
--• 1 visão que permita inserção
--• 2 visões robustas (e.g., com vários joins) com justificativa semântica, de acordo com os requisitos da aplicação.

-- Uma view chamada Métricas de usuários retornando um relatório numérico de cada usuário.
create or replace view metricas_gerais as
select u.nome, u.email, count(s1.seguido) as "Num. de seguidores", 
count(s2.seguidor) as "Num. de seguidos", count(p.url) as "Num. de postagens", count(c.quem_curtiu) as "Total de curtidas"
from usuario u
join segue s1 on u.email = s1.seguido
join segue s2 on u.email = s2.seguidor
join postagem p on u.email = p.autor
join curtidas_post c on u.email = c.quem_curtiu
group by u.email
order by u.nome;
--A CORRIGIR: A contagem de seguidores e seguidos está dando igual, acho que por conta do group by. Como corrigir?
select * from metricas_gerais;

--2)c)Índices
--3 índices para campos indicados com justificativa dentro do contexto das consultas formuladas na questão 3a.

--2)d)Reescrita de consultas
--Identificar 2 exemplos de consultas dentro do contexto da aplicação (questão 2.a) que possam e devam ser melhoradas. Reescrevê-las. Justificar a reescrita.

--2)e)Funções e procedures armazenadas
--• 1 função que use SUM, MAX, MIN, AVG ou COUNT
--• 2 funções e 1 procedure com justificativa semântica, conforme os requisitos da aplicação

--2)f)Triggers
--3 diferentes triggers com justificativa semântica, de acordo com os requisitos da aplicação.