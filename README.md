# Projeto Banco de Dados
## Sobre

Este projeto tem como objetivo construir um banco de dados que sirva como base para qualquer protótipo de rede social. 

O banco contém três entidades principais: usuário, postagem e comentário.

Os modelos conceituais foram desenvolvidos utilizando o brModelo v3.2, já o lógico foi desenvolvido com o MySQL Workbench.

Possui tanto versão SQL como NoSQL.

## Regras de Negócio

- O sistema deve permitir o cadastro de usuários. O usuário é identificado pelo seu nickname e possui seu nome, email (único), data de nascimento e senha registrados, só podendo ter um cadastro por email. É possível que os usuários sigam e sejam seguidos por seus amigos (seguidores).

- Cada usuário pode realizar suas próprias postagens, que podem gerar interações em sua rede, por meio de curtidas e comentários. As postagens são identificadas pela URL e possuem conteúdo, data e hora de publicação. São registradas tanto as curtidas em postagens quanto em comentários.

- Ao optar por Interagir com um Comentário (identificado por uma URL) na postagem, é armazenado o nickname do autor do comentário, a data do mesmo (incluindo o horário do comentário), o seu conteúdo, e se ele foi ou não editado.

## Requisitos Funcionais da Aplicação

- Criar conta (cadastro de usuário)
- Seguir usuários
- Criar postagens
- Comentar
- Curtir postagens ou comentários
