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




--•1 consulta com left/right/full outer join na cláusula FROM

--Consulta que retorna a quantidade de comentários que os posts tiveram, do mais comentado para o menos
select p.url as post, p.titulo, u.nickname as autor, count(c.url_coment) as qtde_coments
from postagem p 
left join comentario c on p.url = c.url_post
join usuario u on p.autor = u.nickname
group by p.url, p.titulo, u.nickname
order by qtde_coments desc;


--•2 consultas usando Group By (e possivelmente o having)

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