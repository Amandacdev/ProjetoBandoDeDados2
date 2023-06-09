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

--• 1 função que use SUM, MAX, MIN, AVG ou COUNT
--Função que retorna o número de comentários de um determinado post
Create or replace function somaComentarios(post varchar)
Returns integer
As $$
Declare qtde_comentarios varchar(25);
Begin	
	SELECT COUNT(c.url_coment) into qtde_comentarios
	FROM postagem p
	JOIN comentario c ON p.url = c.url_post
	WHERE p.url = post
	GROUP BY p.url, p.titulo;
return qtde_comentarios;
End; $$ LANGUAGE 'plpgsql';

select somaComentarios('www.domain.com/post/ianribeiro/3');

--Função que retorna a quantidade de postagens feitas em determinado período
Create or replace function post_por_data(data1 date, data2 date)
Returns table(
		url2 varchar,
		autor2 varchar,
		titulo2 varchar,
		conteudo2 text,
		datahora2 timestamp) As $$
BEGIN
	return query
		select *
		from postagem 
		where datahora between data1 and data2;
End; $$ 
LANGUAGE 'plpgsql';

select post_por_data('2011-10-08 ','2023-10-16');

--Função que retorna o número de postagens de usuários de uma determinada idade (informação importante para estudo de usuários)
Create or replace function post_por_idade(idade integer)
Returns integer
As $$
Declare qtde_posts varchar(25);
Begin
	select count(u.email) into qtde_posts
	from usuario u
	inner join postagem p
	on p.autor = u.email
	where (select round((current_date - datanasc)/365)) = idade;
return qtde_posts;
End; $$ LANGUAGE 'plpgsql';

select post_por_idade(32);

-- Triggers:

