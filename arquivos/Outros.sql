-- Views, Índices, Reescritas, Procedures, Functions e Triggers.

--Views:


-- Índices:

--Indexando chaves estrangeiras:
create index comentador_comentario on comentario(comentador);
create index autor_postagem on postagem(autor);
-- Indexando data de nascimento para consultas por intervalos:
create index datanasc_usuario on usuario(datanasc);

-- Reescritas:

-- Procedures:

create or replace procedure monitorarAtividades(usu usuario.nickname%type)
as $$
declare
seguidores int;
segue int;
posts int;
begin
select count(segue.seguido) into seguidores from segue where segue.seguido = usu;
select count(segue.seguidor) into segue from segue where segue.seguidor = usu;
select count(postagem.autor) into posts from postagem where postagem.autor = usu;
raise notice 'Usuário: %,   Num. de seguidores: %,  Num. de seguidos pelo usuário: %,   Num. de postagens: %', usu, seguidores, segue, posts;
end; $$
language 'plpgsql';

call monitorarAtividades('georgelima');

-- Functions:


-- Triggers:

