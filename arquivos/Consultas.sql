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
