-- drop table segue;
-- drop table curtidas_coment;
-- drop table curtidas_post;
-- drop table comentario;
-- drop table postagem;
-- drop table usuario;

--Grupo: Amanda, George e Ian

--2)a)i)Tabelas e constraints (PK, FK, UNIQUE, campos que não podem ter valores nulos, checks de validação) de acordo com as regras de negócio do projeto.

create table usuario(
nickname varchar(45),
email varchar(45) not null,
senha varchar(20) not null,
nome varchar(45) not null,
datanasc date not null);

alter table usuario
add constraint pk_usuario primary key(nickname),
add constraint uq_email unique(email),
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

--checkar se editado = false na inserção, provavel trigger
create table comentario(
url_coment varchar(500),
url_post varchar(500) not null,
comentador varchar(45) not null,
conteudo text not null,
datahora timestamp not null,
editado boolean not null default false);

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
('georgelima', 'georgelima@gmail.com', '$trongPassw0rd', 'George Lima', '1993-11-21'),
('amandacruz', 'amandacruz@gmail.com', '$trongPassw0rd2', 'Amanda Cruz', '1995-05-26'),
('ianribeiro', 'ianribeiro@gmail.com', '$trongPassw0rd3', 'Ian Ribeiro', '2000-02-01'),
('joaosilva', 'joaosilva@gmail.com', 'P@ssw0rd123', 'João Silva', '1990-09-12'),
('marianasantos', 'marianasantos@gmail.com', 'MyP@ssw0rd!', 'Mariana Santos', '1988-07-03'),
('pedrocosta', 'pedrocosta@gmail.com', 'Passw0rd123!', 'Pedro Costa', '1992-11-08'),
('larissasilva', 'larissasilva@gmail.com', 'Str0ngP@ss!', 'Larissa Silva', '1997-02-14'),
('joseoliveira', 'joseoliveira@gmail.com', 'P@ssw0rd456', 'José Oliveira', '1985-06-30'),
('carolinamartins', 'carolinamartins@gmail.com', 'Passw0rd789!', 'Carolina Martins', '1991-04-17'),
('felipesilveira', 'felipesilveira@gmail.com', 'MyP@ssw0rd123', 'Felipe Silveira', '1994-09-03'),
('fernandacampos', 'fernandacampos@gmail.com', 'P@ssw0rd987', 'Fernanda Campos', '1993-07-21'),
('gabrielsantana', 'gabrielsantana@gmail.com', 'Passw0rd!@#', 'Gabriel Santana', '1996-12-10'),
('isabelasouza', 'isabelasouza@gmail.com', 'Str0ngP@ssw0rd', 'Isabela Souza', '1989-03-25'),
('rafaelalmeida', 'rafaelalmeida@gmail.com', 'P@ssw0rd654', 'Rafael Almeida', '1998-08-07'),
('victormoreira', 'victormoreira@gmail.com', 'MyP@ssw0rd987', 'Victor Moreira', '1992-05-22'),
('julianalima', 'julianalima@gmail.com', 'P@ssw0rd!@#', 'Juliana Lima', '1993-10-12'),
('paulohenrique', 'paulohenrique@gmail.com', 'Passw0rd123!', 'Paulo Henrique', '1987-09-01'),
('marcosilva', 'marcosilva@gmail.com', 'P@ssw0rd456', 'Marco Silva', '1996-03-18'),
('fernandalima', 'fernandalima@gmail.com', 'Passw0rd789!', 'Fernanda Lima', '1991-11-27'),
('luciamartins', 'luciamartins@gmail.com', 'P@ssw0rd789', 'Lúcia Martins', '1996-06-05'),
('gabrielsantos', 'gabrielsantos@gmail.com', 'P@ssw0rd!@#', 'Gabriel Santos', '1994-04-17'),
('anacosta', 'anacosta@gmail.com', 'MyP@ssw0rd123', 'Ana Costa', '1992-11-23'),
('rodrigofaria', 'rodrigofaria@gmail.com', 'P@ssw0rd987', 'Rodrigo Faria', '1989-10-07'),
('lauramendes', 'lauramendes@gmail.com', 'P@ssw0rd!@#', 'Laura Mendes', '1991-03-15'),
('joseferreira', 'joseferreira@gmail.com', 'Str0ngP@ssw0rd', 'José Ferreira', '1987-09-03'),
('amandasouza', 'amandasouza@gmail.com', 'Passw0rd123!', 'Amanda Souza', '1998-08-11'),
('ricardocarvalho', 'ricardocarvalho@gmail.com', 'P@ssw0rd!@#', 'Ricardo Carvalho', '1997-12-22'),
('amandalima', 'amandalima@gmail.com', '$trongPassw0rd2', 'Amanda Lima', '1990-01-04'),
('mariagomes', 'mariagomes@gmail.com', 'Gomes#2021', 'Maria Gomes', '1987-11-09'),
('pedroalmeida', 'pedroalmeida@gmail.com', 'Almeida@123', 'Pedro Almeida', '1993-07-12'),
('juliasantos', 'juliasantos@gmail.com', 'Santos@321', 'Julia Santos', '1998-03-21'),
('lucasrodrigues', 'lucasrodrigues@gmail.com', 'Rodrigues2021!', 'Lucas Rodrigues', '1991-09-02'),
('camilasilva', 'camilasilva@gmail.com', 'C@mil@2021', 'Camila Silva', '1996-12-05'),
('felipefernandes', 'felipefernandes@gmail.com', 'F3rn@nd3s!', 'Felipe Fernandes', '1988-06-25'),
('sabrinacosta', 'sabrinacosta@gmail.com', 'C0st@S@br1n@', 'Sabrina Costa', '1994-04-18'),
('ricardosilveira', 'ricardosilveira@gmail.com', 'S!lv3ir@2021', 'Ricardo Silveira', '1997-08-28'),
('joaopaulo', 'joaopaulo@gmail.com', 'P@u!o', 'João Paulo', '1967-10-06');


insert into postagem values
('www.domain.com/post/georgelima/1', 'georgelima', 'Título da postagem 1', 'Conteúdo da postagem 1', current_timestamp),
('www.domain.com/post/amandacruz/2', 'amandacruz', 'Título da postagem 2', 'Conteúdo da postagem 2', current_timestamp),
('www.domain.com/post/ianribeiro/3', 'ianribeiro', 'Título da postagem 3', 'Conteúdo da postagem 3', current_timestamp),
('www.domain.com/post/joaosilva/4', 'joaosilva', 'Título da postagem 4', 'Conteúdo da postagem 4', current_timestamp),
('www.domain.com/post/marianasantos/5', 'marianasantos', 'Título da postagem 5', 'Conteúdo da postagem 5', current_timestamp),
('www.domain.com/post/pedrocosta/6', 'pedrocosta', 'Título da postagem 6', 'Conteúdo da postagem 6', current_timestamp),
('www.domain.com/post/larissasilva/7', 'larissasilva', 'Título da postagem 7', 'Conteúdo da postagem 7', current_timestamp),
('www.domain.com/post/joseoliveira/8', 'joseoliveira', 'Título da postagem 8', 'Conteúdo da postagem 8', current_timestamp),
('www.domain.com/post/carolinamartins/9', 'carolinamartins', 'Título da postagem 9', 'Conteúdo da postagem 9', current_timestamp),
('www.domain.com/post/felipesilveira/10', 'felipesilveira', 'Título da postagem 10', 'Conteúdo da postagem 10', current_timestamp),
('www.domain.com/post/fernandacampos/11', 'fernandacampos', 'Título da postagem 11', 'Conteúdo da postagem 11', current_timestamp),
('www.domain.com/post/gabrielsantana/12', 'gabrielsantana', 'Título da postagem 12', 'Conteúdo da postagem 12', current_timestamp),
('www.domain.com/post/isabelasouza/13', 'isabelasouza', 'Título da postagem 13', 'Conteúdo da postagem 13', current_timestamp),
('www.domain.com/post/rafaelalmeida/14', 'rafaelalmeida', 'Título da postagem 14', 'Conteúdo da postagem 14', current_timestamp),
('www.domain.com/post/victormoreira/15', 'victormoreira', 'Título da postagem 15', 'Conteúdo da postagem 15', current_timestamp),
('www.domain.com/post/julianalima/16', 'julianalima', 'Título da postagem 16', 'Conteúdo da postagem 16', current_timestamp),
('www.domain.com/post/paulohenrique/17', 'paulohenrique', 'Título da postagem 17', 'Conteúdo da postagem 17', current_timestamp),
('www.domain.com/post/marcosilva/18', 'marcosilva', 'Título da postagem 18', 'Conteúdo da postagem 18', current_timestamp),
('www.domain.com/post/fernandalima/19', 'fernandalima', 'Título da postagem 19', 'Conteúdo da postagem 19', current_timestamp),
('www.domain.com/post/luciamartins/20', 'luciamartins', 'Título da postagem 20', 'Conteúdo da postagem 20', current_timestamp),
('www.domain.com/post/gabrielsantos/21', 'gabrielsantos', 'Título da postagem 21', 'Conteúdo da postagem 21', current_timestamp),
('www.domain.com/post/anacosta/22', 'anacosta', 'Título da postagem 22', 'Conteúdo da postagem 22', current_timestamp),
('www.domain.com/post/rodrigofaria/23', 'rodrigofaria', 'Título da postagem 23', 'Conteúdo da postagem 23', current_timestamp),
('www.domain.com/post/lauramendes/24', 'lauramendes', 'Título da postagem 24', 'Conteúdo da postagem 24', current_timestamp),
('www.domain.com/post/joseferreira/25', 'joseferreira', 'Título da postagem 25', 'Conteúdo da postagem 25', current_timestamp),
('www.domain.com/post/amandasouza/26', 'amandasouza', 'Título da postagem 26', 'Conteúdo da postagem 26', current_timestamp),
('www.domain.com/post/ricardocarvalho/27', 'ricardocarvalho', 'Título da postagem 27', 'Conteúdo da postagem 27', current_timestamp),
('www.domain.com/post/amandalima/28', 'amandalima', 'Título da postagem 28', 'Conteúdo da postagem 28', current_timestamp),
('www.domain.com/post/mariagomes/29', 'mariagomes', 'Título da postagem 29', 'Conteúdo da postagem 29', current_timestamp),
('www.domain.com/post/pedroalmeida/30', 'pedroalmeida', 'Título da postagem 30', 'Conteúdo da postagem 30', current_timestamp),
('www.domain.com/post/juliasantos/31', 'juliasantos', 'Título da postagem 31', 'Conteúdo da postagem 31', current_timestamp),
('www.domain.com/post/lucasrodrigues/32', 'lucasrodrigues', 'Título da postagem 32', 'Conteúdo da postagem 32', current_timestamp),
('www.domain.com/post/camilasilva/33', 'camilasilva', 'Título da postagem 33', 'Conteúdo da postagem 33', current_timestamp),
('www.domain.com/post/felipefernandes/34', 'felipefernandes', 'Título da postagem 34', 'Conteúdo da postagem 34', current_timestamp),
('www.domain.com/post/sabrinacosta/35', 'sabrinacosta', 'Título da postagem 35', 'Conteúdo da postagem 35', current_timestamp),
('www.domain.com/post/ricardosilveira/36', 'ricardosilveira', 'Título da postagem 36', 'Conteúdo da postagem 36', current_timestamp),
('www.domain.com/post/ianribeiro/37', 'ianribeiro', 'Título da postagem 37', 'Conteúdo da postagem 37', current_timestamp);

/*
insert into segue values
('georgelima', 'amandacruz'),
('ianribeiro', 'joaosilva'),
('marianasantos', 'pedrocosta'),
('larissasilva', 'joseoliveira'),
('carolinamartins', 'felipesilveira'),
('fernandacampos', 'gabrielsantana'),
('isabelasouza', 'rafaelalmeida'),
('victormoreira', 'julianalima'),
('paulohenrique', 'marcosilva'),
('fernandalima', 'luciamartins'),
('anacosta', 'rodrigofaria'),
('lauramendes', 'joseferreira'),
('amandasouza', 'ricardocarvalho'),
('amandalima', 'mariagomes'),
('pedroalmeida', 'juliasantos'),
('lucasrodrigues', 'camilasilva'),
('felipefernandes', 'sabrinacosta'),
('ricardosilveira', 'georgelima'),
('amandacruz', 'ianribeiro'),
('joaosilva', 'larissasilva'),
('joseoliveira', 'carolinamartins'),
('gabrielsantana', 'fernandacampos'),
('rafaelalmeida', 'isabelasouza'),
('julianalima', 'paulohenrique'),
('marcosilva', 'fernandalima'),
('luciamartins', 'anacosta'),
('rodrigofaria', 'lauramendes'),
('joseferreira', 'amandasouza'),
('ricardocarvalho', 'amandalima'),
('mariagomes', 'pedroalmeida'),
('juliasantos', 'lucasrodrigues'),
('camilasilva', 'felipefernandes'),
('sabrinacosta', 'ricardosilveira'),
('georgelima', 'marianasantos'),
('ianribeiro', 'georgelima'),
('pedrocosta', 'amandalima'),
('joseoliveira', 'joaosilva'),
('carolinamartins', 'larissasilva'),
('felipesilveira', 'fernandalima'),
('gabrielsantana', 'ianribeiro'),
('rafaelalmeida', 'georgelima'),
('julianalima', 'joseoliveira'),
('paulohenrique', 'larissasilva'),
('marcosilva', 'ianribeiro'),
('fernandalima', 'carolinamartins'),
('luciamartins', 'pedrocosta'),
('anacosta', 'fernandacampos'),
('rodrigofaria', 'joseferreira'),
('lauramendes', 'amandasouza'),
('joseferreira', 'ricardocarvalho'),
('amandasouza', 'mariagomes'),
('ricardocarvalho', 'juliasantos'),
('amandalima', 'pedroalmeida'),
('mariagomes', 'lucasrodrigues'),
('pedroalmeida', 'camilasilva'),
('juliasantos', 'felipefernandes'),
('lucasrodrigues', 'sabrinacosta'),
('camilasilva', 'georgelima'),
('felipefernandes', 'marianasantos'),
('sabrinacosta', 'georgelima');
*/

insert into segue values
('georgelima', 'sabrinacosta'),
('georgelima', 'felipefernandes'),
('georgelima', 'camilasilva'),
('georgelima', 'marianasantos'),
('georgelima', 'juliasantos'),
('georgelima', 'lucasrodrigues'),
('georgelima', 'ianribeiro'),
('amandacruz', 'ianribeiro'),
('ianribeiro', 'georgelima');

/*
insert into comentario values
('www.domain.com/coment/1', 'www.domain.com/post/amandacruz/2', 'georgelima', 'Conteúdo do comentário 1', current_timestamp, false),
('www.domain.com/coment/2', 'www.domain.com/post/ianribeiro/3', 'amandacruz', 'Conteúdo do comentário 2', current_timestamp, false),
('www.domain.com/coment/3', 'www.domain.com/post/joaosilva/4', 'ianribeiro', 'Conteúdo do comentário 3', current_timestamp, false),
('www.domain.com/coment/4', 'www.domain.com/post/marianasantos/5', 'joaosilva', 'Conteúdo do comentário 4', current_timestamp, false),
('www.domain.com/coment/5', 'www.domain.com/post/pedrocosta/6', 'marianasantos', 'Conteúdo do comentário 5', current_timestamp, false),
('www.domain.com/coment/6', 'www.domain.com/post/larissasilva/7', 'pedrocosta', 'Conteúdo do comentário 6', current_timestamp, false),
('www.domain.com/coment/7', 'www.domain.com/post/joseoliveira/8', 'larissasilva', 'Conteúdo do comentário 7', current_timestamp, false),
('www.domain.com/coment/8', 'www.domain.com/post/carolinamartins/9', 'joseoliveira', 'Conteúdo do comentário 8', current_timestamp, false),
('www.domain.com/coment/9', 'www.domain.com/post/felipesilveira/10', 'carolinamartins', 'Conteúdo do comentário 9', current_timestamp, false),
('www.domain.com/coment/10', 'www.domain.com/post/fernandacampos/11', 'felipesilveira', 'Conteúdo do comentário 10', current_timestamp, false),
('www.domain.com/coment/11', 'www.domain.com/post/gabrielsantana/12', 'fernandacampos', 'Conteúdo do comentário 11', current_timestamp, false),
('www.domain.com/coment/12', 'www.domain.com/post/isabelasouza/13', 'gabrielsantana', 'Conteúdo do comentário 12', current_timestamp, false),
('www.domain.com/coment/13', 'www.domain.com/post/rafaelalmeida/14', 'isabelasouza', 'Conteúdo do comentário 13', current_timestamp, false),
('www.domain.com/coment/14', 'www.domain.com/post/victormoreira/15', 'rafaelalmeida', 'Conteúdo do comentário 14', current_timestamp, false),
('www.domain.com/coment/15', 'www.domain.com/post/julianalima/16', 'victormoreira', 'Conteúdo do comentário 15', current_timestamp, false),
('www.domain.com/coment/16', 'www.domain.com/post/paulohenrique/17', 'julianalima', 'Conteúdo do comentário 16', current_timestamp, false),
('www.domain.com/coment/17', 'www.domain.com/post/marcosilva/18', 'paulohenrique', 'Conteúdo do comentário 17', current_timestamp, false),
('www.domain.com/coment/18', 'www.domain.com/post/fernandalima/19', 'marcosilva', 'Conteúdo do comentário 18', current_timestamp, false),
('www.domain.com/coment/19', 'www.domain.com/post/luciamartins/20', 'fernandalima', 'Conteúdo do comentário 19', current_timestamp, false),
('www.domain.com/coment/20', 'www.domain.com/post/gabrielsantos/21', 'luciamartins', 'Conteúdo do comentário 20', current_timestamp, false),
('www.domain.com/coment/21', 'www.domain.com/post/georgelima/1', 'ricardosilveira', 'Conteúdo do comentário 21', current_timestamp, false),
('www.domain.com/coment/22', 'www.domain.com/post/amandacruz/2', 'georgelima', 'Conteúdo do comentário 22', current_timestamp, false),
('www.domain.com/coment/23', 'www.domain.com/post/ianribeiro/3', 'amandacruz', 'Conteúdo do comentário 23', current_timestamp, false),
('www.domain.com/coment/24', 'www.domain.com/post/joaosilva/4', 'ianribeiro', 'Conteúdo do comentário 24', current_timestamp, false),
('www.domain.com/coment/25', 'www.domain.com/post/marianasantos/5', 'joaosilva', 'Conteúdo do comentário 25', current_timestamp, false),
('www.domain.com/coment/26', 'www.domain.com/post/pedrocosta/6', 'marianasantos', 'Conteúdo do comentário 26', current_timestamp, false),
('www.domain.com/coment/27', 'www.domain.com/post/larissasilva/7', 'pedrocosta', 'Conteúdo do comentário 27', current_timestamp, false),
('www.domain.com/coment/28', 'www.domain.com/post/joseoliveira/8', 'larissasilva', 'Conteúdo do comentário 28', current_timestamp, false),
('www.domain.com/coment/29', 'www.domain.com/post/carolinamartins/9', 'joseoliveira', 'Conteúdo do comentário 29', current_timestamp, false),
('www.domain.com/coment/30', 'www.domain.com/post/felipesilveira/10', 'carolinamartins', 'Conteúdo do comentário 30', current_timestamp, false),
('www.domain.com/coment/31', 'www.domain.com/post/fernandacampos/11', 'felipesilveira', 'Conteúdo do comentário 31', current_timestamp, false),
('www.domain.com/coment/32', 'www.domain.com/post/gabrielsantana/12', 'fernandacampos', 'Conteúdo do comentário 32', current_timestamp, false),
('www.domain.com/coment/33', 'www.domain.com/post/isabelasouza/13', 'gabrielsantana', 'Conteúdo do comentário 33', current_timestamp, false),
('www.domain.com/coment/34', 'www.domain.com/post/rafaelalmeida/14', 'isabelasouza', 'Conteúdo do comentário 34', current_timestamp, false),
('www.domain.com/coment/35', 'www.domain.com/post/victormoreira/15', 'rafaelalmeida', 'Conteúdo do comentário 35', current_timestamp, false),
('www.domain.com/coment/36', 'www.domain.com/post/julianalima/16', 'victormoreira', 'Conteúdo do comentário 36', current_timestamp, false),
('www.domain.com/coment/37', 'www.domain.com/post/paulohenrique/17', 'julianalima', 'Conteúdo do comentário 37', current_timestamp, false),
('www.domain.com/coment/38', 'www.domain.com/post/marcosilva/18', 'paulohenrique', 'Conteúdo do comentário 38', current_timestamp, false),
('www.domain.com/coment/39', 'www.domain.com/post/fernandalima/19', 'marcosilva', 'Conteúdo do comentário 39', current_timestamp, false),
('www.domain.com/coment/40', 'www.domain.com/post/luciamartins/20', 'fernandalima', 'Conteúdo do comentário 40', current_timestamp, false),
('www.domain.com/coment/41', 'www.domain.com/post/gabrielsantos/21', 'luciamartins', 'Conteúdo do comentário 41', current_timestamp, false),
('www.domain.com/coment/42', 'www.domain.com/post/georgelima/1', 'ricardosilveira', 'Conteúdo do comentário 42', current_timestamp, false),
('www.domain.com/coment/43', 'www.domain.com/post/amandacruz/2', 'georgelima', 'Conteúdo do comentário 43', current_timestamp, false),
('www.domain.com/coment/44', 'www.domain.com/post/ianribeiro/3', 'amandacruz', 'Conteúdo do comentário 44', current_timestamp, false),
('www.domain.com/coment/45', 'www.domain.com/post/joaosilva/4', 'ianribeiro', 'Conteúdo do comentário 45', current_timestamp, false),
('www.domain.com/coment/46', 'www.domain.com/post/marianasantos/5', 'joaosilva', 'Conteúdo do comentário 46', current_timestamp, false),
('www.domain.com/coment/47', 'www.domain.com/post/pedrocosta/6', 'marianasantos', 'Conteúdo do comentário 47', current_timestamp, false),
('www.domain.com/coment/48', 'www.domain.com/post/larissasilva/7', 'pedrocosta', 'Conteúdo do comentário 48', current_timestamp, false),
('www.domain.com/coment/49', 'www.domain.com/post/joseoliveira/8', 'larissasilva', 'Conteúdo do comentário 49', current_timestamp, false),
('www.domain.com/coment/50', 'www.domain.com/post/carolinamartins/9', 'joseoliveira', 'Conteúdo do comentário 50', current_timestamp, false),
('www.domain.com/coment/51', 'www.domain.com/post/marcosilva/18', 'paulohenrique', 'Conteúdo do comentário 51', current_timestamp, false),
('www.domain.com/coment/52', 'www.domain.com/post/fernandalima/19', 'marcosilva', 'Conteúdo do comentário 52', current_timestamp, false),
('www.domain.com/coment/53', 'www.domain.com/post/luciamartins/20', 'fernandalima', 'Conteúdo do comentário 53', current_timestamp, false),
('www.domain.com/coment/54', 'www.domain.com/post/gabrielsantos/21', 'luciamartins', 'Conteúdo do comentário 54', current_timestamp, false),
('www.domain.com/coment/55', 'www.domain.com/post/juliasantos/31', 'pedroalmeida', 'Conteúdo do comentário 55', current_timestamp, false),
('www.domain.com/coment/56', 'www.domain.com/post/felipefernandes/34', 'juliasantos', 'Conteúdo do comentário 56', current_timestamp, false),
('www.domain.com/coment/57', 'www.domain.com/post/sabrinacosta/35', 'felipefernandes', 'Conteúdo do comentário 57', current_timestamp, false),
('www.domain.com/coment/58', 'www.domain.com/post/ricardosilveira/36', 'sabrinacosta', 'Conteúdo do comentário 58', current_timestamp, false),
('www.domain.com/coment/59', 'www.domain.com/post/georgelima/1', 'ricardosilveira', 'Conteúdo do comentário 59', current_timestamp, false),
('www.domain.com/coment/60', 'www.domain.com/post/amandacruz/2', 'georgelima', 'Conteúdo do comentário 60', current_timestamp, false),
('www.domain.com/coment/61', 'www.domain.com/post/ianribeiro/3', 'amandacruz', 'Conteúdo do comentário 61', current_timestamp, false),
('www.domain.com/coment/62', 'www.domain.com/post/joaosilva/4', 'ianribeiro', 'Conteúdo do comentário 62', current_timestamp, false),
('www.domain.com/coment/63', 'www.domain.com/post/marianasantos/5', 'joaosilva', 'Conteúdo do comentário 63', current_timestamp, false),
('www.domain.com/coment/64', 'www.domain.com/post/pedrocosta/6', 'marianasantos', 'Conteúdo do comentário 64', current_timestamp, false),
('www.domain.com/coment/65', 'www.domain.com/post/larissasilva/7', 'pedrocosta', 'Conteúdo do comentário 65', current_timestamp, false),
('www.domain.com/coment/66', 'www.domain.com/post/joseoliveira/8', 'larissasilva', 'Conteúdo do comentário 66', current_timestamp, false),
('www.domain.com/coment/67', 'www.domain.com/post/carolinamartins/9', 'joseoliveira', 'Conteúdo do comentário 67', current_timestamp, false),
('www.domain.com/coment/68', 'www.domain.com/post/felipesilveira/10', 'carolinamartins', 'Conteúdo do comentário 68', current_timestamp, false),
('www.domain.com/coment/69', 'www.domain.com/post/fernandacampos/11', 'felipesilveira', 'Conteúdo do comentário 69', current_timestamp, false),
('www.domain.com/coment/70', 'www.domain.com/post/gabrielsantana/12', 'fernandacampos', 'Conteúdo do comentário 70', current_timestamp, false),
('www.domain.com/coment/71', 'www.domain.com/post/isabelasouza/13', 'gabrielsantana', 'Conteúdo do comentário 71', current_timestamp, false),
('www.domain.com/coment/72', 'www.domain.com/post/rafaelalmeida/14', 'isabelasouza', 'Conteúdo do comentário 72', current_timestamp, false),
('www.domain.com/coment/73', 'www.domain.com/post/victormoreira/15', 'rafaelalmeida', 'Conteúdo do comentário 73', current_timestamp, false),
('www.domain.com/coment/74', 'www.domain.com/post/julianalima/16', 'victormoreira', 'Conteúdo do comentário 74', current_timestamp, false),
('www.domain.com/coment/75', 'www.domain.com/post/paulohenrique/17', 'julianalima', 'Conteúdo do comentário 75', current_timestamp, false),
('www.domain.com/coment/76', 'www.domain.com/post/marcosilva/18', 'paulohenrique', 'Conteúdo do comentário 76', current_timestamp, false),
('www.domain.com/coment/77', 'www.domain.com/post/fernandalima/19', 'marcosilva', 'Conteúdo do comentário 77', current_timestamp, false),
('www.domain.com/coment/78', 'www.domain.com/post/luciamartins/20', 'fernandalima', 'Conteúdo do comentário 78', current_timestamp, false),
('www.domain.com/coment/79', 'www.domain.com/post/gabrielsantos/21', 'luciamartins', 'Conteúdo do comentário 79', current_timestamp, false),
('www.domain.com/coment/80', 'www.domain.com/post/juliasantos/31', 'pedroalmeida', 'Conteúdo do comentário 80', current_timestamp, false),
('www.domain.com/coment/81', 'www.domain.com/post/felipefernandes/34', 'juliasantos', 'Conteúdo do comentário 81', current_timestamp, false),
('www.domain.com/coment/82', 'www.domain.com/post/sabrinacosta/35', 'felipefernandes', 'Conteúdo do comentário 82', current_timestamp, false),
('www.domain.com/coment/83', 'www.domain.com/post/ricardosilveira/36', 'sabrinacosta', 'Conteúdo do comentário 83', current_timestamp, false),
('www.domain.com/coment/84', 'www.domain.com/post/georgelima/1', 'ricardosilveira', 'Conteúdo do comentário 84', current_timestamp, false),
('www.domain.com/coment/85', 'www.domain.com/post/amandacruz/2', 'georgelima', 'Conteúdo do comentário 85', current_timestamp, false),
('www.domain.com/coment/86', 'www.domain.com/post/ianribeiro/3', 'amandacruz', 'Conteúdo do comentário 86', current_timestamp, false),
('www.domain.com/coment/87', 'www.domain.com/post/joaosilva/4', 'ianribeiro', 'Conteúdo do comentário 87', current_timestamp, false),
('www.domain.com/coment/88', 'www.domain.com/post/marianasantos/5', 'joaosilva', 'Conteúdo do comentário 88', current_timestamp, false),
('www.domain.com/coment/89', 'www.domain.com/post/pedrocosta/6', 'marianasantos', 'Conteúdo do comentário 89', current_timestamp, false),
('www.domain.com/coment/90', 'www.domain.com/post/larissasilva/7', 'pedrocosta', 'Conteúdo do comentário 90', current_timestamp, false),
('www.domain.com/coment/91', 'www.domain.com/post/joseoliveira/8', 'larissasilva', 'Conteúdo do comentário 91', current_timestamp, false),
('www.domain.com/coment/92', 'www.domain.com/post/carolinamartins/9', 'joseoliveira', 'Conteúdo do comentário 92', current_timestamp, false),
('www.domain.com/coment/93', 'www.domain.com/post/felipesilveira/10', 'carolinamartins', 'Conteúdo do comentário 93', current_timestamp, false),
('www.domain.com/coment/94', 'www.domain.com/post/fernandacampos/11', 'felipesilveira', 'Conteúdo do comentário 94', current_timestamp, false),
('www.domain.com/coment/95', 'www.domain.com/post/gabrielsantana/12', 'fernandacampos', 'Conteúdo do comentário 95', current_timestamp, false),
('www.domain.com/coment/96', 'www.domain.com/post/isabelasouza/13', 'gabrielsantana', 'Conteúdo do comentário 96', current_timestamp, false),
('www.domain.com/coment/97', 'www.domain.com/post/rafaelalmeida/14', 'isabelasouza', 'Conteúdo do comentário 97', current_timestamp, false),
('www.domain.com/coment/98', 'www.domain.com/post/victormoreira/15', 'rafaelalmeida', 'Conteúdo do comentário 98', current_timestamp, false),
('www.domain.com/coment/99', 'www.domain.com/post/julianalima/16', 'victormoreira', 'Conteúdo do comentário 99', current_timestamp, false),
('www.domain.com/coment/100', 'www.domain.com/post/paulohenrique/17', 'julianalima', 'Conteúdo do comentário 100', current_timestamp, false);
*/

insert into comentario values
('www.domain.com/coment/1', 'www.domain.com/post/ianribeiro/37', 'georgelima', 'Conteúdo do comentário 1', current_timestamp, true),
('www.domain.com/coment/2', 'www.domain.com/post/ianribeiro/37', 'amandacruz', 'Conteúdo do comentário 2', current_timestamp, false),
('www.domain.com/coment/3', 'www.domain.com/post/ianribeiro/37', 'ianribeiro', 'Conteúdo do comentário 3', current_timestamp, false);

/*
insert into curtidas_post values
('georgelima', 'www.domain.com/post/amandacruz/2'),
('amandacruz', 'www.domain.com/post/ianribeiro/3'),
('ianribeiro', 'www.domain.com/post/joaosilva/4'),
('joaosilva', 'www.domain.com/post/marianasantos/5'),
('marianasantos', 'www.domain.com/post/pedrocosta/6'),
('pedrocosta', 'www.domain.com/post/larissasilva/7'),
('larissasilva', 'www.domain.com/post/joseoliveira/8'),
('joseoliveira', 'www.domain.com/post/carolinamartins/9'),
('carolinamartins', 'www.domain.com/post/felipesilveira/10'),
('felipesilveira', 'www.domain.com/post/fernandacampos/11'),
('fernandacampos', 'www.domain.com/post/gabrielsantana/12'),
('gabrielsantana', 'www.domain.com/post/isabelasouza/13'),
('isabelasouza', 'www.domain.com/post/rafaelalmeida/14'),
('rafaelalmeida', 'www.domain.com/post/victormoreira/15'),
('victormoreira', 'www.domain.com/post/julianalima/16'),
('julianalima', 'www.domain.com/post/paulohenrique/17'),
('paulohenrique', 'www.domain.com/post/marcosilva/18'),
('marcosilva', 'www.domain.com/post/fernandalima/19'),
('fernandalima', 'www.domain.com/post/luciamartins/20'),
('luciamartins', 'www.domain.com/post/gabrielsantos/21'),
('anacosta', 'www.domain.com/post/rodrigofaria/23'),
('rodrigofaria', 'www.domain.com/post/lauramendes/24'),
('lauramendes', 'www.domain.com/post/joseferreira/25'),
('joseferreira', 'www.domain.com/post/amandasouza/26'),
('amandasouza', 'www.domain.com/post/ricardocarvalho/27'),
('ricardocarvalho', 'www.domain.com/post/amandalima/28'),
('amandalima', 'www.domain.com/post/mariagomes/29'),
('mariagomes', 'www.domain.com/post/pedroalmeida/30'),
('pedroalmeida', 'www.domain.com/post/juliasantos/31'),
('juliasantos', 'www.domain.com/post/lucasrodrigues/32'),
('lucasrodrigues', 'www.domain.com/post/camilasilva/33'),
('felipefernandes', 'www.domain.com/post/sabrinacosta/35'),
('sabrinacosta', 'www.domain.com/post/ricardosilveira/36'),
('georgelima', 'www.domain.com/post/carolinamartins/9'),
('amandacruz', 'www.domain.com/post/gabrielsantana/12'),
('ianribeiro', 'www.domain.com/post/luciamartins/20'),
('joaosilva', 'www.domain.com/post/juliasantos/31'),
('marianasantos', 'www.domain.com/post/rodrigofaria/23'),
('pedrocosta', 'www.domain.com/post/fernandalima/19'),
('larissasilva', 'www.domain.com/post/ianribeiro/3'),
('joseoliveira', 'www.domain.com/post/pedrocosta/6'),
('carolinamartins', 'www.domain.com/post/victormoreira/15'),
('felipesilveira', 'www.domain.com/post/amandasouza/26'),
('fernandacampos', 'www.domain.com/post/paulohenrique/17'),
('gabrielsantana', 'www.domain.com/post/mariagomes/29'),
('isabelasouza', 'www.domain.com/post/fernandacampos/11'),
('rafaelalmeida', 'www.domain.com/post/ricardocarvalho/27'),
('julianalima', 'www.domain.com/post/joaosilva/4'),
('paulohenrique', 'www.domain.com/post/marianasantos/5'),
('marcosilva', 'www.domain.com/post/ianribeiro/3'),
('fernandalima', 'www.domain.com/post/joseoliveira/8'),
('luciamartins', 'www.domain.com/post/fernandalima/19'),
('gabrielsantos', 'www.domain.com/post/ianribeiro/3'),
('rodrigofaria', 'www.domain.com/post/fernandalima/19'),
('lauramendes', 'www.domain.com/post/juliasantos/31'),
('joseferreira', 'www.domain.com/post/rodrigofaria/23'),
('amandasouza', 'www.domain.com/post/pedroalmeida/30'),
('ricardocarvalho', 'www.domain.com/post/amandasouza/26'),
('felipefernandes', 'www.domain.com/post/gabrielsantana/12'),
('ricardosilveira', 'www.domain.com/post/felipefernandes/34'),
('amandacruz', 'www.domain.com/post/joaosilva/4'),
('ianribeiro', 'www.domain.com/post/carolinamartins/9'),
('joaosilva', 'www.domain.com/post/gabrielsantana/12'),
('marianasantos', 'www.domain.com/post/luciamartins/20'),
('pedrocosta', 'www.domain.com/post/juliasantos/31'),
('larissasilva', 'www.domain.com/post/rodrigofaria/23'),
('joseoliveira', 'www.domain.com/post/fernandalima/19'),
('carolinamartins', 'www.domain.com/post/ianribeiro/3'),
('felipesilveira', 'www.domain.com/post/pedrocosta/6'),
('fernandacampos', 'www.domain.com/post/victormoreira/15'),
('gabrielsantana', 'www.domain.com/post/amandasouza/26'),
('isabelasouza', 'www.domain.com/post/paulohenrique/17'),
('rafaelalmeida', 'www.domain.com/post/mariagomes/29'),
('victormoreira', 'www.domain.com/post/fernandalima/19'),
('julianalima', 'www.domain.com/post/ricardocarvalho/27'),
('paulohenrique', 'www.domain.com/post/julianalima/16'),
('marcosilva', 'www.domain.com/post/joaosilva/4'),
('fernandalima', 'www.domain.com/post/marianasantos/5'),
('luciamartins', 'www.domain.com/post/ianribeiro/3'),
('gabrielsantos', 'www.domain.com/post/joseoliveira/8'),
('anacosta', 'www.domain.com/post/fernandalima/19'),
('rodrigofaria', 'www.domain.com/post/juliasantos/31'),
('lauramendes', 'www.domain.com/post/rodrigofaria/23');
*/

insert into curtidas_post values
('georgelima', 'www.domain.com/post/ianribeiro/37'),
('amandacruz', 'www.domain.com/post/ianribeiro/37'),
('ianribeiro', 'www.domain.com/post/ianribeiro/37'),
('ianribeiro', 'www.domain.com/post/ianribeiro/3');

/*
insert into curtidas_coment values
('georgelima', 'www.domain.com/coment/1'),
('amandacruz', 'www.domain.com/coment/2'),
('ianribeiro', 'www.domain.com/coment/3'),
('joaosilva', 'www.domain.com/coment/4'),
('marianasantos', 'www.domain.com/coment/5'),
('pedrocosta', 'www.domain.com/coment/6'),
('larissasilva', 'www.domain.com/coment/7'),
('joseoliveira', 'www.domain.com/coment/8'),
('carolinamartins', 'www.domain.com/coment/9'),
('felipesilveira', 'www.domain.com/coment/10'),
('fernandacampos', 'www.domain.com/coment/11'),
('gabrielsantana', 'www.domain.com/coment/12'),
('isabelasouza', 'www.domain.com/coment/13'),
('rafaelalmeida', 'www.domain.com/coment/14'),
('victormoreira', 'www.domain.com/coment/15'),
('julianalima', 'www.domain.com/coment/16'),
('paulohenrique', 'www.domain.com/coment/17'),
('marcosilva', 'www.domain.com/coment/18'),
('fernandalima', 'www.domain.com/coment/19'),
('luciamartins', 'www.domain.com/coment/20'),
('gabrielsantos', 'www.domain.com/coment/21'),
('anacosta', 'www.domain.com/coment/22'),
('rodrigofaria', 'www.domain.com/coment/23'),
('lauramendes', 'www.domain.com/coment/24'),
('joseferreira', 'www.domain.com/coment/25'),
('amandasouza', 'www.domain.com/coment/26'),
('ricardocarvalho', 'www.domain.com/coment/27'),
('amandalima', 'www.domain.com/coment/28'),
('mariagomes', 'www.domain.com/coment/29'),
('pedroalmeida', 'www.domain.com/coment/30'),
('juliasantos', 'www.domain.com/coment/31'),
('lucasrodrigues', 'www.domain.com/coment/32'),
('camilasilva', 'www.domain.com/coment/33'),
('felipefernandes', 'www.domain.com/coment/34'),
('sabrinacosta', 'www.domain.com/coment/35'),
('ricardosilveira', 'www.domain.com/coment/36'),
('georgelima', 'www.domain.com/coment/37'),
('amandacruz', 'www.domain.com/coment/38'),
('ianribeiro', 'www.domain.com/coment/39'),
('joaosilva', 'www.domain.com/coment/40'),
('marianasantos', 'www.domain.com/coment/41'),
('pedrocosta', 'www.domain.com/coment/42'),
('larissasilva', 'www.domain.com/coment/43'),
('joseoliveira', 'www.domain.com/coment/44'),
('carolinamartins', 'www.domain.com/coment/45'),
('felipesilveira', 'www.domain.com/coment/46'),
('fernandacampos', 'www.domain.com/coment/47'),
('gabrielsantana', 'www.domain.com/coment/48'),
('isabelasouza', 'www.domain.com/coment/49'),
('rafaelalmeida', 'www.domain.com/coment/50'),
('victormoreira', 'www.domain.com/coment/51'),
('julianalima', 'www.domain.com/coment/52'),
('paulohenrique', 'www.domain.com/coment/53'),
('marcosilva', 'www.domain.com/coment/54'),
('fernandalima', 'www.domain.com/coment/55'),
('luciamartins', 'www.domain.com/coment/56'),
('gabrielsantos', 'www.domain.com/coment/57'),
('anacosta', 'www.domain.com/coment/58'),
('rodrigofaria', 'www.domain.com/coment/59'),
('lauramendes', 'www.domain.com/coment/60'),
('joseferreira', 'www.domain.com/coment/61'),
('amandasouza', 'www.domain.com/coment/62'),
('ricardocarvalho', 'www.domain.com/coment/63'),
('amandalima', 'www.domain.com/coment/64'),
('mariagomes', 'www.domain.com/coment/65'),
('pedroalmeida', 'www.domain.com/coment/66'),
('juliasantos', 'www.domain.com/coment/67'),
('lucasrodrigues', 'www.domain.com/coment/68'),
('camilasilva', 'www.domain.com/coment/69'),
('felipefernandes', 'www.domain.com/coment/70'),
('sabrinacosta', 'www.domain.com/coment/71'),
('ricardosilveira', 'www.domain.com/coment/72'),
('georgelima', 'www.domain.com/coment/73'),
('amandacruz', 'www.domain.com/coment/74'),
('ianribeiro', 'www.domain.com/coment/75'),
('joaosilva', 'www.domain.com/coment/76'),
('marianasantos', 'www.domain.com/coment/77'),
('pedrocosta', 'www.domain.com/coment/78'),
('larissasilva', 'www.domain.com/coment/79'),
('joseoliveira', 'www.domain.com/coment/80'),
('carolinamartins', 'www.domain.com/coment/81'),
('felipesilveira', 'www.domain.com/coment/82'),
('fernandacampos', 'www.domain.com/coment/83'),
('gabrielsantana', 'www.domain.com/coment/84'),
('isabelasouza', 'www.domain.com/coment/85'),
('rafaelalmeida', 'www.domain.com/coment/86'),
('victormoreira', 'www.domain.com/coment/87'),
('julianalima', 'www.domain.com/coment/88'),
('paulohenrique', 'www.domain.com/coment/89'),
('marcosilva', 'www.domain.com/coment/90'),
('fernandalima', 'www.domain.com/coment/91'),
('luciamartins', 'www.domain.com/coment/92'),
('gabrielsantos', 'www.domain.com/coment/93'),
('anacosta', 'www.domain.com/coment/94'),
('rodrigofaria', 'www.domain.com/coment/95'),
('lauramendes', 'www.domain.com/coment/96'),
('joseferreira', 'www.domain.com/coment/97'),
('amandasouza', 'www.domain.com/coment/98'),
('ricardocarvalho', 'www.domain.com/coment/99'),
('amandalima', 'www.domain.com/coment/100'),
('georgelima', 'www.domain.com/coment/4'),
('amandacruz', 'www.domain.com/coment/5'),
('ianribeiro', 'www.domain.com/coment/1'),
('joaosilva', 'www.domain.com/coment/9'),
('marianasantos', 'www.domain.com/coment/2'),
('pedrocosta', 'www.domain.com/coment/10'),
('larissasilva', 'www.domain.com/coment/6'),
('joseoliveira', 'www.domain.com/coment/2'),
('carolinamartins', 'www.domain.com/coment/8'),
('felipesilveira', 'www.domain.com/coment/3'),
('fernandacampos', 'www.domain.com/coment/6'),
('gabrielsantana', 'www.domain.com/coment/4'),
('isabelasouza', 'www.domain.com/coment/1'),
('rafaelalmeida', 'www.domain.com/coment/3'),
('victormoreira', 'www.domain.com/coment/7'),
('julianalima', 'www.domain.com/coment/9'),
('paulohenrique', 'www.domain.com/coment/5'),
('marcosilva', 'www.domain.com/coment/10'),
('fernandalima', 'www.domain.com/coment/1'),
('luciamartins', 'www.domain.com/coment/7'),
('gabrielsantos', 'www.domain.com/coment/8'),
('anacosta', 'www.domain.com/coment/2'),
('rodrigofaria', 'www.domain.com/coment/3'),
('lauramendes', 'www.domain.com/coment/4'),
('joseferreira', 'www.domain.com/coment/5'),
('amandasouza', 'www.domain.com/coment/6'),
('ricardocarvalho', 'www.domain.com/coment/7'),
('amandalima', 'www.domain.com/coment/8'),
('mariagomes', 'www.domain.com/coment/9'),
('pedroalmeida', 'www.domain.com/coment/10'),
('juliasantos', 'www.domain.com/coment/1'),
('lucasrodrigues', 'www.domain.com/coment/2'),
('camilasilva', 'www.domain.com/coment/3'),
('felipefernandes', 'www.domain.com/coment/4'),
('sabrinacosta', 'www.domain.com/coment/5'),
('ricardosilveira', 'www.domain.com/coment/6'),
('joseoliveira', 'www.domain.com/coment/7'),
('felipesilveira', 'www.domain.com/coment/9'),
('fernandacampos', 'www.domain.com/coment/10'),
('gabrielsantana', 'www.domain.com/coment/1'),
('isabelasouza', 'www.domain.com/coment/2'),
('victormoreira', 'www.domain.com/coment/4'),
('julianalima', 'www.domain.com/coment/5'),
('paulohenrique', 'www.domain.com/coment/6'),
('marcosilva', 'www.domain.com/coment/7'),
('fernandalima', 'www.domain.com/coment/8'),
('luciamartins', 'www.domain.com/coment/9'),
('gabrielsantos', 'www.domain.com/coment/10'),
('anacosta', 'www.domain.com/coment/1'),
('rodrigofaria', 'www.domain.com/coment/2'),
('lauramendes', 'www.domain.com/coment/3'),
('joseferreira', 'www.domain.com/coment/4'),
('amandasouza', 'www.domain.com/coment/5'),
('ricardocarvalho', 'www.domain.com/coment/6'),
('amandalima', 'www.domain.com/coment/7'),
('mariagomes', 'www.domain.com/coment/8'),
('pedroalmeida', 'www.domain.com/coment/9'),
('juliasantos', 'www.domain.com/coment/10'),
('lucasrodrigues', 'www.domain.com/coment/1'),
('camilasilva', 'www.domain.com/coment/2'),
('felipefernandes', 'www.domain.com/coment/3'),
('sabrinacosta', 'www.domain.com/coment/4'),
('ricardosilveira', 'www.domain.com/coment/5');
*/

insert into curtidas_coment values
('georgelima', 'www.domain.com/coment/3'),
('amandacruz', 'www.domain.com/coment/3'),
('ianribeiro', 'www.domain.com/coment/3'),
('joaosilva', 'www.domain.com/coment/3'),
('georgelima', 'www.domain.com/coment/2'),
('amandacruz', 'www.domain.com/coment/2'),
('ianribeiro', 'www.domain.com/coment/2'),
('joaosilva', 'www.domain.com/coment/2'),
('georgelima', 'www.domain.com/coment/1'),
('amandacruz', 'www.domain.com/coment/1'),
('ianribeiro', 'www.domain.com/coment/1'),
('joaosilva', 'www.domain.com/coment/1');



--2)a)ii)10 consultas variadas de acordo com requisitos da aplicação, com justificativa semântica e conforme critérios seguintes:

select * from usuario;	
select * from postagem;
select * from segue;
select * from comentario;
select * from curtidas_post;
select * from curtidas_coment;

--•1 consulta com uma tabela usando operadores básicos de filtro (e.g., IN, between, is null, etc).

-- Consulta que retorna os comentários que não tiveram curtidas e seus autores
select url_coment as comentario, comentador as autor
from comentario
where url_coment not in (select distinct comentario_curtido
						 from curtidas_coment);


--• 3 consultas com inner JOIN na cláusula FROM (pode ser self join, caso o domínio indique esse uso).

--Consulta que devolve os posts com quantidade de comentários acima da média (posts que geraram mais engajamento)
with count_comentarios as
(select p.url as post, count(c.url_coment) as qtde_coments
from comentario c
right join postagem p on c.url_post = p.url
group by post)
select p.url, p.autor, p.titulo, cc.qtde_coments
from postagem p 
inner join count_comentarios cc on p.url = cc.post
where cc.qtde_coments > (select avg(qtde_coments) from count_comentarios)
order by cc.qtde_coments desc;

--Consulta que retorna um relatório numérico de cada usuário.
with seguidores as --quantidade de seguidores que cada usuário tem
(select u.nickname, count(s.seguidor) as seguidores
from usuario u
left join segue s on u.nickname = s.seguido 
group by u.nickname),

seguindo as --quantidade de usuários que cada usuário segue
(select u.nickname, count(s.seguido) as segue
from usuario u
left join segue s on u.nickname = s.seguidor 
group by u.nickname),

posts_curtidos as --quantidade de posts que cada usuário curtiu
(select u.nickname, count(cp.quem_curtiu) as posts_curtidos
from usuario u
left join curtidas_post cp on u.nickname = cp.quem_curtiu
group by u.nickname),

coments_curtidos as --quantidade de comentários que cada usuário curtiu
(select u.nickname, count(cc.quem_curtiu) as coments_curtidos
from usuario u
left join curtidas_coment cc on u.nickname = cc.quem_curtiu
group by u.nickname),

posts_feitos as --quantidade de posts criados por cada usuário
(select u.nickname, count(p.autor) as posts_realizados
from usuario u
left join postagem p on u.nickname = p.autor
group by u.nickname),

coments_feitos as --quantidade de comentários criados por cada usuário
(select u.nickname, count(c.comentador) as coments_realizados
from usuario u
left join comentario c on u.nickname = c.comentador
group by u.nickname),

curtidas_posts_usuario as --curtidas acumuladas de todos os posts da autoria do usuário
(select u.nickname, count(cp.quem_curtiu) as curtidas_posts_do_usuario
from postagem p
right join usuario u on p.autor = u.nickname
left join curtidas_post cp on p.url = cp.postagem_curtida
group by u.nickname),

curtidas_coments_usuario as --curtidas acumuladas de todos os comentários da autoria do usuário
(select u.nickname, count(cc.quem_curtiu) as curtidas_coments_do_usuario
from comentario c
right join usuario u on c.comentador = u.nickname
left join curtidas_coment cc on c.url_coment = cc.comentario_curtido
group by u.nickname)

select u.nickname as usuario, ss.seguidores, so.segue, pc.posts_curtidos, cc.coments_curtidos,
pf.posts_realizados, cf.coments_realizados, cpu.curtidas_posts_do_usuario, ccu.curtidas_coments_do_usuario
from usuario u
join seguidores ss on u.nickname = ss.nickname
join seguindo so on u.nickname = so.nickname
join posts_curtidos pc on u.nickname = pc.nickname
join coments_curtidos cc on u.nickname = cc.nickname
join posts_feitos pf on u.nickname = pf.nickname
join coments_feitos cf on u.nickname = cf.nickname
join curtidas_posts_usuario cpu on u.nickname = cpu.nickname
join curtidas_coments_usuario ccu on u.nickname = ccu.nickname
order by seguidores desc;


--•1 consulta com left/right/full outer join na cláusula FROM

--Consulta que retorna a quantidade de comentários que os posts tiveram, do mais comentado para o menos
select p.url as post, p.titulo, u.nickname as autor, count(c.url_coment) as qtde_coments
from postagem p 
left join comentario c on p.url = c.url_post
join usuario u on p.autor = u.nickname
group by p.url, p.titulo, u.nickname
order by qtde_coments desc;


--•2 consultas usando Group By (e possivelmente o having)


--ALTERAR

--Consulta que retorna a quantidade de seguidores de cada usuário, ordenado do mais seguido para o menos
select u.nickname as usuario, count(s.seguidor) as seguidores
from segue s 
right join usuario u on s.seguido = u.nickname
group by usuario
order by seguidores desc;

--Consulta que retorna a quantidade de curtidas de cada post, ordenado do mais curtido para o menos
select p.url as post, p.autor, count(cp.quem_curtiu) as curtidas 
from curtidas_post cp 
right join postagem p on cp.postagem_curtida = p.url
group by post, p.autor
order by curtidas desc;


--• 1 consulta usando alguma operação de conjunto (union, except ou intersect)

--Consulta que retorna os usuários que interagiram com a rede de todas as formas(comentaram, postaram, curtiram e seguiram)(sinal de atividade na rede)
select seguidor as top_users
from segue
intersect
select quem_curtiu
from curtidas_post
intersect
select quem_curtiu
from curtidas_coment
intersect
select autor
from postagem
intersect
select comentador
from comentario;


--• 2 consultas que usem subqueries.

--Consulta que retorna as postagens com número de curtidas 70% acima da média (postagens de alto engajamento)
with count_curtidas as
(select p.url as post, count(cp.quem_curtiu) as curtidas
from curtidas_post cp
right join postagem p on cp.postagem_curtida = p.url
group by post)
select p.url, p.titulo, u.nickname as autor, c.curtidas, p.datahora
from postagem p 
join usuario u on p.autor = u.nickname
join count_curtidas c on p.url = c.post
where c.curtidas > (select avg(curtidas) * 1.7 from count_curtidas)
order by c.curtidas desc;

--Consulta que devolve comentários que tiveram mais curtidas do que o próprio post
with qtde_curtidas_coments as
(select comentario_curtido, count(quem_curtiu) as curtidas
from curtidas_coment
group by comentario_curtido),
qtde_curtidas_posts as
(select p.url as posts, count(cp.quem_curtiu) as curtidas
from curtidas_post cp
right join postagem p on cp.postagem_curtida = p.url
group by posts)
select p.url as post, p.titulo as titulo_post, 
c.url_coment as comentario, c.conteudo as conteudo_comentario, 
qcc.curtidas as curtidas_comentario, qcp.curtidas as curtidas_post
from postagem p
inner join comentario c on p.url = c.url_post
left join qtde_curtidas_coments qcc on c.url_coment = qcc.comentario_curtido
right join qtde_curtidas_posts qcp on p.url = qcp.posts
where qcc.curtidas > qcp.curtidas;

--2)b)Visões

--• 1 visão que permita inserção

--Visão que mostra postagem e seus comentários. Caso inserção seja feita nela, é presumido que o autor está comentando no seu próprio post
create or replace view postagens_comentarios as
select p.url as post, p.autor, p.titulo, p.conteudo as conteudo_post,
c.url_coment as comentario, c.comentador, c.conteudo as conteudo_coment
from postagem p
join comentario c on p.url = c.url_post;

select * from postagens_comentarios;
select * from comentario;

insert into postagens_comentarios values
('www.domain.com/post/georgelima/38', 'georgelima', 'Titulo da postagem 38', 'Conteúdo da postagem 38', 'www.domain.com/coment/4', 'georgelima', 'Conteúdo do comentário 4');


--• 2 visões robustas (e.g., com vários joins) com justificativa semântica, de acordo com os requisitos da aplicação.

--Visão que retorna posts polêmicos e potencialente tóxicos, que talvez devam ser removidos
--Métrica utilizada para um post ser considerado polêmico é se a quantidade de comentários com mais curtidas do que o próprio post for pelo menos 3
create or replace view posts_polemicos as
with qtde_curtidas_coments as
(select comentario_curtido, count(quem_curtiu) as curtidas
from curtidas_coment
group by comentario_curtido),
qtde_curtidas_posts as
(select p.url as posts, count(cp.quem_curtiu) as curtidas
from curtidas_post cp
right join postagem p on cp.postagem_curtida = p.url
group by posts),
posts_arriscados as
(select p.url as post, p.titulo as titulo_post, 
c.url_coment as comentario, c.conteudo as conteudo_comentario, 
qcc.curtidas as curtidas_comentario, qcp.curtidas as curtidas_post
from postagem p
inner join comentario c on p.url = c.url_post
left join qtde_curtidas_coments qcc on c.url_coment = qcc.comentario_curtido
right join qtde_curtidas_posts qcp on p.url = qcp.posts
where qcc.curtidas > qcp.curtidas)
select post as post_polemico, titulo_post, count(comentario) as qtde_coments_com_mais_curtidas
from posts_arriscados
group by post_polemico, titulo_post
having count(comentario) >= 3;

select * from posts_polemicos;

--Visão que retorna um relatório numérico de cada usuário.
create or replace view metricas_usuarios as
with seguidores as --quantidade de seguidores que cada usuário tem
(select u.nickname, count(s.seguidor) as seguidores
from usuario u
left join segue s on u.nickname = s.seguido 
group by u.nickname),

seguindo as --quantidade de usuários que cada usuário segue
(select u.nickname, count(s.seguido) as segue
from usuario u
left join segue s on u.nickname = s.seguidor 
group by u.nickname),

posts_curtidos as --quantidade de posts que cada usuário curtiu
(select u.nickname, count(cp.quem_curtiu) as posts_curtidos
from usuario u
left join curtidas_post cp on u.nickname = cp.quem_curtiu
group by u.nickname),

coments_curtidos as --quantidade de comentários que cada usuário curtiu
(select u.nickname, count(cc.quem_curtiu) as coments_curtidos
from usuario u
left join curtidas_coment cc on u.nickname = cc.quem_curtiu
group by u.nickname),

posts_feitos as --quantidade de posts criados por cada usuário
(select u.nickname, count(p.autor) as posts_realizados
from usuario u
left join postagem p on u.nickname = p.autor
group by u.nickname),

coments_feitos as --quantidade de comentários criados por cada usuário
(select u.nickname, count(c.comentador) as coments_realizados
from usuario u
left join comentario c on u.nickname = c.comentador
group by u.nickname),

curtidas_posts_usuario as --curtidas acumuladas de todos os posts da autoria do usuário
(select u.nickname, count(cp.quem_curtiu) as curtidas_posts_do_usuario
from postagem p
right join usuario u on p.autor = u.nickname
left join curtidas_post cp on p.url = cp.postagem_curtida
group by u.nickname),

curtidas_coments_usuario as --curtidas acumuladas de todos os comentários da autoria do usuário
(select u.nickname, count(cc.quem_curtiu) as curtidas_coments_do_usuario
from comentario c
right join usuario u on c.comentador = u.nickname
left join curtidas_coment cc on c.url_coment = cc.comentario_curtido
group by u.nickname)

select u.nickname as usuario, ss.seguidores, so.segue, pc.posts_curtidos, cc.coments_curtidos,
pf.posts_realizados, cf.coments_realizados, cpu.curtidas_posts_do_usuario, ccu.curtidas_coments_do_usuario
from usuario u
join seguidores ss on u.nickname = ss.nickname
join seguindo so on u.nickname = so.nickname
join posts_curtidos pc on u.nickname = pc.nickname
join coments_curtidos cc on u.nickname = cc.nickname
join posts_feitos pf on u.nickname = pf.nickname
join coments_feitos cf on u.nickname = cf.nickname
join curtidas_posts_usuario cpu on u.nickname = cpu.nickname
join curtidas_coments_usuario ccu on u.nickname = ccu.nickname
order by seguidores desc;

select * from metricas_usuarios;


--2)c)Índices
--3 índices para campos indicados com justificativa dentro do contexto das consultas formuladas na questão 2a.

--Indexando chaves estrangeiras:
create index comentador_comentario on comentario(comentador);
create index autor_postagem on postagem(autor);
-- Indexando data de nascimento para consultas por intervalos:
create index datanasc_usuario on usuario(datanasc); --replace


--2)d)Reescrita de consultas
--Identificar 2 exemplos de consultas dentro do contexto da aplicação (questão 2.a) que possam e devam ser melhoradas. Reescrevê-las. Justificar a reescrita.


--2)e)Funções e procedures armazenadas

--• 1 função que use SUM, MAX, MIN, AVG ou COUNT

--Função que retorna o número de comentários de um determinado post
Create or replace function soma_comentarios(post postagem.url%type)
Returns integer
As $$
Declare qtde_comentarios integer;
Begin	
	SELECT COUNT(url_coment) into qtde_comentarios
	FROM comentario
	WHERE url_post = post;
return qtde_comentarios;
End; $$ LANGUAGE 'plpgsql';

select soma_comentarios('www.domain.com/post/ianribeiro/37');


--• 2 funções e 1 procedure com justificativa semântica, conforme os requisitos da aplicação

--Função que retorna a quantidade de postagens feitas em determinado período
create or replace function posts_no_periodo(data1 date, data2 date)
returns integer as $$
Declare qtde_posts integer;
begin
	select count(*) into qtde_posts
	from postagem
	where datahora between data1 and data2;
	return qtde_posts;
end; $$ language plpgsql;

insert into postagem values
('teste', 'ianribeiro', 'teste', 'teste', '2023-07-02 14:14:14'),
('teste2', 'ianribeiro', 'teste', 'teste', '2023-06-27 14:14:14');

select posts_no_periodo('2023-06-27', '2023-07-03');

--Função que retorna o número de postagens de usuários de uma determinada idade (informação importante para estudo de usuários)
Create or replace function post_por_idade(idade integer)
Returns integer
As $$
Declare qtde_posts integer;
Begin
	select count(u.email) into qtde_posts
	from usuario u
	inner join postagem p
	on p.autor = u.nickname
	where (select round((current_date - datanasc)/365)) = idade;
return qtde_posts;
End; $$ LANGUAGE 'plpgsql';

select post_por_idade(1);

insert into usuario values
('teste', 'teste@gmail.com', 'teste', 'teste', '2022-06-09');

select post_por_idade(1);

insert into postagem values
('1teste', 'teste', 'teste', 'teste', '2023-06-02 14:14:14');

select post_por_idade(1);

insert into postagem values
('2teste', 'teste', 'teste', 'teste', '2023-06-02 14:14:14');

select post_por_idade(1);

insert into postagem values
('3teste', 'teste', 'teste', 'teste', '2023-06-02 14:14:14');

select post_por_idade(1);

insert into postagem values
('4teste', 'teste', 'teste', 'teste', '2023-06-02 14:14:14');

select post_por_idade(1);

--Procedure que desabilita comentários em um post
--Ela salva todos os comentários que já haviam sido feitos em uma tabela log, e depois os deleta
--Adiciona um trigger para garantir que mais nenhum comentário seja inserido nesse post
create trigger fulano
before insert on sicrano
for each row execute beltrano()

--2)f)Triggers
--3 diferentes triggers com justificativa semântica, de acordo com os requisitos da aplicação.

--Trigger para nao permitir mais inserçao em um comentario especifico

--Trigger para quando for fazer inserção em comentario, o campo editado sempre ser false

--Trigger instead of insert para a view