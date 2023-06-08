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
