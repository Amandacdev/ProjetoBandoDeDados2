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
('marianasantos', 'marianasantos@gmail.com', 'MyP@ssw0rd!', 'Mariana Santos', '1988-07-03');


insert into postagem values
('www.domain.com/post/georgelima/1', 'georgelima', 'Título da postagem 1', 'Conteúdo da postagem 1', '2023-01-30 13:50:11.049573'),
('www.domain.com/post/amandacruz/2', 'amandacruz', 'Título da postagem 2', 'Conteúdo da postagem 2', '2023-05-14 15:20:45.203835'),
('www.domain.com/post/ianribeiro/3', 'ianribeiro', 'Título da postagem 3', 'Conteúdo da postagem 3', '2023-05-14 20:45:27.019283'),
('www.domain.com/post/joaosilva/4', 'joaosilva', 'Título da postagem 4', 'Conteúdo da postagem 4', current_timestamp),
('www.domain.com/post/marianasantos/5', 'marianasantos', 'Título da postagem 5', 'Conteúdo da postagem 5', current_timestamp),
('www.domain.com/post/ianribeiro/6', 'ianribeiro', 'Título da postagem 6', 'Conteúdo da postagem 6', current_timestamp);


insert into segue values
('georgelima', 'amandacruz'),
('georgelima', 'joaosilva'),
('georgelima', 'marianasantos'),
('georgelima', 'ianribeiro'),
('amandacruz', 'ianribeiro'),
('amandacruz', 'georgelima'),
('ianribeiro', 'georgelima'),
('ianribeiro', 'marianasantos'),
('ianribeiro', 'amandacruz');


insert into comentario values
('www.domain.com/coment/1', 'www.domain.com/post/ianribeiro/3', 'georgelima', 'Conteúdo do comentário 1', current_timestamp, default),
('www.domain.com/coment/2', 'www.domain.com/post/ianribeiro/3', 'amandacruz', 'Conteúdo do comentário 2', current_timestamp, default),
('www.domain.com/coment/3', 'www.domain.com/post/ianribeiro/3', 'ianribeiro', 'Conteúdo do comentário 3', current_timestamp, default),
('www.domain.com/coment/4', 'www.domain.com/post/ianribeiro/6', 'amandacruz', 'Conteúdo do comentário 4', current_timestamp, default),
('www.domain.com/coment/5', 'www.domain.com/post/ianribeiro/6', 'marianasantos', 'Conteúdo do comentário 5', current_timestamp, default),
('www.domain.com/coment/6', 'www.domain.com/post/ianribeiro/6', 'georgelima', 'Conteúdo do comentário 6', current_timestamp, default),
('www.domain.com/coment/7', 'www.domain.com/post/ianribeiro/6', 'marianasantos', 'Conteúdo do comentário 7', current_timestamp, default),
('www.domain.com/coment/8', 'www.domain.com/post/georgelima/1', 'marianasantos', 'Conteúdo do comentário 8', current_timestamp, default),
('www.domain.com/coment/9', 'www.domain.com/post/georgelima/1', 'amandacruz', 'Conteúdo do comentário 9', current_timestamp, default),
('www.domain.com/coment/10', 'www.domain.com/post/georgelima/1', 'ianribeiro', 'Conteúdo do comentário 10', current_timestamp, default);


insert into curtidas_post values
('georgelima', 'www.domain.com/post/ianribeiro/3'),
('amandacruz', 'www.domain.com/post/ianribeiro/3'),
('ianribeiro', 'www.domain.com/post/ianribeiro/3'),
('ianribeiro', 'www.domain.com/post/ianribeiro/6'),
('ianribeiro', 'www.domain.com/post/marianasantos/5'),
('amandacruz', 'www.domain.com/post/georgelima/1'),
('ianribeiro', 'www.domain.com/post/georgelima/1'),
('marianasantos', 'www.domain.com/post/georgelima/1'),
('joaosilva', 'www.domain.com/post/georgelima/1');


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
('joaosilva', 'www.domain.com/coment/1'),
('amandacruz', 'www.domain.com/coment/4'),
('joaosilva', 'www.domain.com/coment/4'),
('amandacruz', 'www.domain.com/coment/5'),
('georgelima', 'www.domain.com/coment/5'),
('amandacruz', 'www.domain.com/coment/6'),
('georgelima', 'www.domain.com/coment/6');


select * from usuario;	
select * from postagem;
select * from segue;
select * from comentario;
select * from curtidas_post;
select * from curtidas_coment;



--2)a)ii)10 consultas variadas de acordo com requisitos da aplicação, com justificativa semântica e conforme critérios seguintes:

--•1 consulta com uma tabela usando operadores básicos de filtro (e.g., IN, between, is null, etc).

-- Consulta que retorna os comentários que não tiveram curtidas e seus autores
select url_coment as comentario, comentador as autor
from comentario
where url_coment not in (select distinct comentario_curtido
						 from curtidas_coment);



--• 3 consultas com inner JOIN na cláusula FROM (pode ser self join, caso o domínio indique esse uso).

--Consulta que mostra as postagens e seus comentários.
select p.url as post, p.autor, p.titulo, p.conteudo as conteudo_post,
c.url_coment as comentario, c.comentador, c.conteudo as conteudo_coment
from postagem p
join comentario c on p.url = c.url_post;


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
--inicio
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
--fim



--•1 consulta com left/right/full outer join na cláusula FROM

--Consulta que retorna a quantidade de comentários que os posts tiveram, do mais comentado para o menos
select p.url as post, p.titulo, u.nickname as autor, count(c.url_coment) as qtde_coments
from postagem p 
left join comentario c on p.url = c.url_post
join usuario u on p.autor = u.nickname
group by p.url, p.titulo, u.nickname
order by qtde_coments desc;



--•2 consultas usando Group By (e possivelmente o having)

-- Consulta que retorna o número de postagens agrupadas por dia, do dia mais publicado para o menos
SELECT DATE_TRUNC('day', CAST(datahora AS DATE)) AS dia_publicacao, COUNT(*) AS total_publicacoes
FROM postagem
GROUP BY dia_publicacao
ORDER BY total_publicacoes desc;


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

--Para fazer a inserção, é necessário ativar o trigger da linha 720
insert into postagens_comentarios values
('www.domain.com/post/georgelima/7', 'georgelima', 'Titulo da postagem 7', 'Conteúdo da postagem 7', 'www.domain.com/coment/11', 'georgelima', 'Conteúdo do comentário 11');



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
--inicio
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
--fim

select * from metricas_usuarios;



--2)c)Índices
--3 índices para campos indicados com justificativa dentro do contexto das consultas formuladas na questão 2a.

--Indexando chaves estrangeiras para consultas com join:
create index comentador_comentario on comentario(comentador);
create index autor_postagem on postagem(autor);

-- Indexando data de nascimento para consultas por intervalos:
create index datanasc_usuario on usuario(datanasc);



--2)d)Reescrita de consultas
--Identificar 2 exemplos de consultas dentro do contexto da aplicação (questão 2.a) que possam e devam ser melhoradas. Reescrevê-las. Justificar a reescrita.

--Consulta que retorna os usuários que interagiram com a rede de todas as formas(comentaram, postaram, curtiram e seguiram)(sinal de atividade na rede)
--Agora que temos uma view com diferentes métricas dos usuários, podemos ampliar essa consulta exibindo métricas dos top usuários
select usuario, segue, posts_curtidos, coments_curtidos, posts_realizados, coments_realizados
from metricas_usuarios
where usuario in(select seguidor as top_users 
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
				from comentario);


-- Consulta que retorna os comentários que não tiveram curtidas e seus autores
-- Essa consulta pode ser reescrita com um left anti join, que é mais eficiente do que utilizar uma subconsulta
select c.url_coment as comentario, c.comentador as autor
from comentario c
left join curtidas_coment cc on c.url_coment = cc.comentario_curtido
where comentario_curtido is null;

						 
						 
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

select soma_comentarios('www.domain.com/post/ianribeiro/3');



--• 2 funções e 1 procedure com justificativa semântica, conforme os requisitos da aplicação

--Função que retorna a quantidade de postagens feitas em determinado período
create or replace function posts_no_periodo(data1 date, data2 date)
returns integer as $$
Declare qtde_posts integer;
begin 
	if (select age(data1) < age(data2)) then
		raise Exception 'O intervalo veio ao contrário.';
	end if;
	
	if (select age(data1) = age(data2)) then
		raise data_exception using message = 'O intervalo informado começa e termina no mesmo dia.';
	end if;	
		
	select count(*) into qtde_posts
	from postagem
	where datahora between data1 and data2;
	return qtde_posts;
	
	exception
		when raise_exception then				
			raise notice 'O intervalo veio ao contrario, segue o resultado trocando os campos de posição.';
			
			select count(*) into qtde_posts
			from postagem
			where datahora between data2 and data1;
			return qtde_posts as posts_no_periodo_invertido;
			
end; $$ language plpgsql;

insert into postagem values
('www.domain.com/post/joaosilva/8', 'joaosilva', 'Título da postagem 8', 'Conteúdo da postagem 8', '2023-05-02 14:14:14'),
('www.domain.com/post/joaosilva/9', 'joaosilva', 'Título da postagem 9', 'Conteúdo da postagem 9', '2023-06-09 14:14:14');

select posts_no_periodo('2023-05-02', '2023-06-10'); --ordem certa
select posts_no_periodo('2023-06-10', '2023-05-02'); --ordem contrária
select posts_no_periodo('2023-01-01', '2023-01-01'); --mesmo dia


--Função que retorna o número de postagens de usuários de uma determinada idade (informação importante para estudo de usuários)
Create or replace function post_por_idade(idade integer)
Returns integer
As $$
Declare qtde_posts integer;
Begin
	if (idade < 0) then
		raise exception 'Idade informada não pode ser negativa';
	end if;
	
	select count(u.email) into qtde_posts
	from usuario u
	inner join postagem p
	on p.autor = u.nickname
	where (select extract(year from age (datanasc))) = idade;
return qtde_posts;
End; $$ LANGUAGE 'plpgsql';

select post_por_idade(32);
select post_por_idade(-32);

insert into usuario values
('marquinhos', 'marquinhos@gmail.com', 'f0f0', 'Marcos Neto', '2022-06-09');

select post_por_idade(1);

insert into postagem values
('www.domain.com/post/marquinhos/10', 'marquinhos', 'Título da postagem 10', 'Conteúdo da postagem 10', current_timestamp);

select post_por_idade(1);

insert into postagem values
('www.domain.com/post/marquinhos/11', 'marquinhos', 'Título da postagem 11', 'Conteúdo da postagem 11', current_timestamp);

select post_por_idade(1);

insert into postagem values
('www.domain.com/post/marquinhos/12', 'marquinhos', 'Título da postagem 12', 'Conteúdo da postagem 12', current_timestamp);

select post_por_idade(1);


--Procedure que deleta usuário
CREATE OR REPLACE PROCEDURE desativar_conta(conta usuario.nickname%type)
AS $$
BEGIN
    DELETE FROM segue WHERE seguidor = conta OR seguido = conta;
	DELETE FROM curtidas_coment WHERE quem_curtiu = conta;
	DELETE FROM curtidas_coment WHERE comentario_curtido IN ((SELECT comentario_curtido FROM usuario u 
   														JOIN comentario c ON u.nickname = c.comentador 
   														JOIN curtidas_coment cc ON c.url_coment = cc.comentario_curtido 
   														WHERE u.nickname= conta));
	delete from curtidas_coment cc where (comentario_curtido) in (select url_coment from usuario u
																join postagem p on u.nickname = p.autor
																join comentario c on c.url_post = p.url
																where u.nickname = conta);
	DELETE FROM comentario WHERE comentador = conta;
    DELETE FROM curtidas_post WHERE quem_curtiu = conta;
	DELETE FROM curtidas_post WHERE postagem_curtida IN ((SELECT postagem_curtida FROM usuario u 
   														JOIN postagem p ON u.nickname = p.autor 
   														JOIN curtidas_post cp ON p.url = cp.postagem_curtida 
   														WHERE u.nickname= conta));
    DELETE FROM comentario WHERE url_coment in (select url_coment from usuario u
												join postagem p on u.nickname = p.autor
												join comentario c on p.url = c.url_post
											   where u.nickname = conta);
    DELETE FROM postagem WHERE autor = conta;
    DELETE FROM usuario WHERE nickname = conta;

	IF NOT FOUND THEN
        RAISE EXCEPTION 'Usuário não existe.';
    END IF;

    RAISE NOTICE 'Todos os dados do usuário % foram deletados da rede.', conta;

END;
$$
LANGUAGE 'plpgsql';

call desativar_conta('ianribeiro');

select * from usuario;	
select * from postagem;
select * from segue;
select * from comentario;
select * from curtidas_post;
select * from curtidas_coment;

call desativar_conta('ajsajshajshajsh');



--2)f)Triggers
--3 diferentes triggers com justificativa semântica, de acordo com os requisitos da aplicação.

--Trigger para não permitir que usuários sigam a si mesmos
create or replace function prevenir_auto_seguir()
returns trigger 
as $$
begin
	if (new.seguido = new.seguidor) then
		raise exception 'Usuários não podem seguir a si mesmos!';
	end if;
	return new;
end; $$ language plpgsql;

create trigger tr_prevenir_auto_seguir
before insert on segue
for each row execute procedure prevenir_auto_seguir();

insert into segue values('amandacruz', 'amandacruz');


--Trigger para quando for fazer inserção em comentário, o campo editado sempre ser false
CREATE OR REPLACE FUNCTION verifica_editado() 
RETURNS TRIGGER AS $$
BEGIN
	IF (new.editado != false) THEN
		new.editado = false;
		raise notice 'Valor do campo EDITADO foi alterado e inserido como FALSE, pois não faz sentido um comentário que acabou de ser inserido ser considerado editado.';
	END IF;
RETURN new;
END;
$$ language plpgsql;

CREATE TRIGGER tr_verifica_campo_editado
BEFORE INSERT ON comentario
FOR EACH ROW EXECUTE
PROCEDURE verifica_editado();

insert into comentario values
('www.domain.com/coment/12', 'www.domain.com/post/amandacruz/2', 'georgelima', 'Conteúdo do comentário 12', current_timestamp, true);

Select * from comentario;


--Trigger para inserção na view
CREATE OR REPLACE FUNCTION insert_postagens_comentarios()
RETURNS TRIGGER AS $$
BEGIN
    -- Inserir na tabela "postagem" com base nos valores inseridos
    INSERT INTO postagem(url, autor, titulo, conteudo, datahora)
    VALUES (NEW.post, NEW.autor, NEW.titulo, NEW.conteudo_post, current_timestamp);
	
    -- Inserir na tabela "comentario" com base nos valores inseridos
    INSERT INTO comentario(url_coment, url_post, comentador, conteudo, datahora, editado)
    VALUES (NEW.comentario, NEW.post, NEW.autor, NEW.conteudo_coment, current_timestamp, FALSE);

    RETURN NULL; -- Retorna NULL para evitar duplicação de dados na tabela subjacente
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_insert_postagens_comentarios
INSTEAD OF INSERT ON postagens_comentarios
FOR EACH ROW
EXECUTE PROCEDURE insert_postagens_comentarios();

insert into postagens_comentarios values
('www.domain.com/post/georgelima/13', 'georgelima', 'Titulo da postagem 13', 'Conteúdo da postagem 13', 'www.domain.com/coment/13', null, 'Conteúdo do comentário 13');

select * from postagem;
select * from comentario;
select * from postagens_comentarios;