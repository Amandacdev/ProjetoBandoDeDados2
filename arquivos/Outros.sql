-- Views, Índices, Reescritas, Procedures, Functions e Triggers.

--Views:

--• 1 visão que permita inserção

--Visão que mostra postagem e seus comentários. Caso inserção seja feita nela, é presumido que o autor está comentando no seu próprio post
select p.url as post, p.autor, p.titulo, p.conteudo as conteudo_post,
c.url_coment as comentario, c.comentador, c.conteudo as conteudo_coment
from postagem p
join comentario c on p.url = c.url_post;


select url, conteudo
from postagem
union
select url_coment, conteudo
from comentario

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


--Vou fazer minha versão e depois a gente conversa em reunião melhor sobre qual incluir.

create or replace function posts_no_periodo(data1 date, data2 date)
returns integer as $$
Declare qtde_posts integer;
begin
	select count(*) into qtde_posts
	from postagem
	where datahora between data1 and data2;
	return qtde_posts;
end; $$ language plpgsql;

select posts_no_periodo('2023-06-27', '2023-07-03');


insert into postagem values
('teste', 'ianribeiro', 'teste', 'teste', '2023-06-02 14:14:14'),
('teste2', 'ianribeiro', 'teste', 'teste', '2023-06-02 14:14:14'),
('teste3', 'ianribeiro', 'teste', 'teste', '2023-07-02 14:14:14'),
('teste4', 'ianribeiro', 'teste', 'teste', '2023-06-27 14:14:14');
select * from postagem

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

-- Triggers:

--Trigger que verifica antes de inserir um comentário se o campo editado está como false, pois não faz sentido um comentário já ser inserido com editado true. 
--A função altera o valor de editado para false antes da inserção na tabela comentario.

CREATE TRIGGER verifica_comentario
BEFORE INSERT ON comentario
FOR EACH ROW EXECUTE
PROCEDURE verificacao_Comentario();

CREATE OR REPLACE FUNCTION verificacao_Comentario(); 
RETURNS TRIGGER AS $$
BEGIN
	IF (new.editado = 'true') THEN
	new.editado = 'false';
	RETURN new;
END IF;
END;
$$ language plpgsql;

Select * from comentario;
/* Inserts para teste
insert into comentario values
('www.domain.com/coment/103', 'www.domain.com/post/amandacruz/2', 'georgelima@gmail.com', 'Conteúdo do comentário 103', current_timestamp, true),
('www.domain.com/coment/104', 'www.domain.com/post/ianribeiro/3', 'amandacruz@gmail.com', 'Conteúdo do comentário 104', current_timestamp, true);
*/
