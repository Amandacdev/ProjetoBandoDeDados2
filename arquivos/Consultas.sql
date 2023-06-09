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