--in,not null, etc.

--Consulta que retorna a quantidade de postagens feitas no mês de junho do ano 2023.
select count(*) as qtde_posts
from postagem
where datahora between '2023-06-01 00:00:00.201758' and '2023-06-30 00:00:00.201758';


--join

--Consulta que retorna o número de postagens de usuários com mais de 32 anos
select count(u.nickname) as qtde_posts
from usuario u
inner join postagem p
on p.autor = u.nickname
where (select round((current_date - datanasc)/365)) > 32;


--Consulta que retorna comentarios editados, o nickname de quem comentou e o post que foi comentado
--Essa consulta não precisou de join
select c.url_coment as comentario, c.comentador as autor, c.url_post as post 
from comentario c
join usuario u
on c.comentador = u.nickname
where c.editado = true;


--consultas soltas

--todas as curidas dos comentarios
select comentario_curtido, count(quem_curtiu)
from curtidas_coment
group by comentario_curtido
