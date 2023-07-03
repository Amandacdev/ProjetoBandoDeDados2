//b.i. Criando e alimentando as coleções:

//Inserindo Usuários:
db.Usuário.insertOne({Nickname: "Jorgin", Email: "george@mail.com", Senha: "password", Nome: {"Primeiro nome": "George", "Sobrenome": "Lima"}, Nascimento: "21/11/1993", Gênero: "Masculino"})
db.Usuário.insertOne({Nickname: "Amandinha", Email: "amanda@mail.com", Senha: "password", Nome: {"Primeiro nome": "Amanda", "Sobrenome": "Cruz"}, Nascimento: "26/05/1995", Gênero: "Feminino"})
db.Usuário.insertOne({Nickname: "YanzinDaQuebrada", Email: "ian@mail.com", Senha: "password", Nome: {"Primeiro nome": "Ian", "Sobrenome": "Ribeiro"}, Nascimento: "01/02/2000", Gênero: null})
db.Usuário.insertOne({Nickname: "admin", Email: "admin@mail.com", Senha: "password", Nome: {"Primeiro nome": "System", "Sobrenome": "Admin"}, Nascimento: "01/01/2001", Gênero: null})
db.Usuário.insertOne({Nickname: "user", Email: "user@mail.com", Senha: "password", Nome: {"Primeiro nome": "An", "Sobrenome": "User"}, Nascimento: "12/12/2012", Gênero: null})

//Inserindo seguidas entre os Usuários:
db.Usuário.update({Nickname: "Amandinha"}, {$set: {Segue: ["Jorgin"]}})
db.Usuário.update({Nickname: "YanzinDaQuebrada"}, {$set: {Segue: ["Jorgin"]}})
db.Usuário.update({Nickname: "Jorgin"}, {$set: {Seguidores: ["Amandinha", "YanzinDaQuebrada"]}})
db.Usuário.update({Nickname: "Jorgin"}, {$set: {Segue: ["Amandinha", "YanzinDaQuebrada"]}})
db.Usuário.update({Nickname: "Amandinha"}, {$set: {Seguidores: ["Jorgin"]}})
db.Usuário.update({Nickname: "YanzinDaQuebrada"}, {$set: {Seguidores: ["Jorgin"]}})

//Inserindo Postagens:
db.Postagem.insertOne({URL: "www.domain.com/001", Título: "My first post", Conteúdo: "Hello, world!", Datahora: "01/07/2023 - 16:09", Tag: ["New"]})
db.Postagem.insertOne({URL: "www.domain.com/002", Título: "Título da postagem 2", Conteúdo: "Conteúdo da postagem 2", Datahora: "01/07/2023 - 13:08", Tags: ["New"]})
db.Postagem.insertOne({URL: "www.domain.com/003", Título: "Título da postagem 3", Conteúdo: "Conteúdo da postagem 3", Datahora: "15/06/2023 - 19:03", Tags: ["Arte","Desenhos"]})
db.Postagem.insertOne({URL: "www.domain.com/004", Título: "Título da postagem 4", Conteúdo: "Conteúdo da postagem 4", Datahora: "28/06/2023 - 10:01", Tags: ["Cinema","Marvel"]})
db.Postagem.insertOne({URL: "www.domain.com/005", Título: "Título da postagem 5", Conteúdo: "Conteúdo da postagem 5", Datahora: "01/06/2023 - 22:40", Tags: ["Netflix","Black Mirror"]})

//Atribuindo autores para as Postagens: 
db.Usuário.update({Nickname: "Jorgin"}, {$set: {Postagens: ["www.domain.com/001"]}})
db.Usuário.update({Nickname: "Amandinha"}, {$set: {Postagens: ["www.domain.com/002"]}})
db.Usuário.update({Nickname: "YanzinDaQuebrada"}, {$set: {Postagens: ["www.domain.com/003"]}})
db.Usuário.update({Nickname: "admin"}, {$set: {Postagens: ["www.domain.com/004"]}})
db.Usuário.update({Nickname: "user"}, {$set: {Postagens: ["www.domain.com/005"]}})

//Atribuindo Postagens curtidas a Usuários:
db.Usuário.update({Nickname: "Jorgin"}, {$set: {"Postagens curtidas": ["www.domain.com/002"]}})
db.Usuário.update({Nickname: "Amandinha"}, {$set: {"Postagens curtidas": ["www.domain.com/003"]}})
db.Usuário.update({Nickname: "YanzinDaQuebrada"}, {$set: {"Postagens curtidas": ["www.domain.com/004"]}})
db.Usuário.update({Nickname: "admin"}, {$set: {"Postagens curtidas": ["www.domain.com/005"]}})
db.Usuário.update({Nickname: "user"}, {$set: {"Postagens curtidas": ["www.domain.com/001"]}})

//Atribuindo Usuários para as Postagens curtidas:
db.Postagem.update({URL: "www.domain.com/001"}, {$set: {"Curtida por": ["user"]}})
db.Postagem.update({URL: "www.domain.com/002"}, {$set: {"Curtida por": ["Jorgin"]}})
db.Postagem.update({URL: "www.domain.com/003"}, {$set: {"Curtida por": ["Amandinha"]}})
db.Postagem.update({URL: "www.domain.com/004"}, {$set: {"Curtida por": ["YanzinDaQuebrada"]}})
db.Postagem.update({URL: "www.domain.com/005"}, {$set: {"Curtida por": ["admin"]}})

//Inserindo comentários:
db.Comentário.insertOne({URL: "www.domain.com/001/comment/001", Datahora: "01/07/2023 - 17:44", Conteúdo: "Comentário 1", Editado: false})
db.Comentário.insertOne({URL: "www.domain.com/002/comment/002", Datahora: "01/07/2023 - 14:09", Conteúdo: "Comentário 2", Editado: false})
db.Comentário.insertOne({URL: "www.domain.com/003/comment/003", Datahora: "15/06/2023 - 19:30", Conteúdo: "Comentário 3", Editado: false})
db.Comentário.insertOne({URL: "www.domain.com/004/comment/004", Datahora: "28/06/2023 - 11:59", Conteúdo: "Comentário 4", Editado: false})
db.Comentário.insertOne({URL: "www.domain.com/005/comment/005", Datahora: "01/06/2023 - 22:43", Conteúdo: "Comentário 5", Editado: false})

//Atribuindo autoria aos Comentários:
db.Usuário.update({Nickname: "Jorgin"}, {$set: {Comentários: ["www.domain.com/005/comment/005"]}})
db.Usuário.update({Nickname: "Amandinha"}, {$set: {Comentários: ["www.domain.com/001/comment/001"]}})
db.Usuário.update({Nickname: "YanzinDaQuebrada"}, {$set: {Comentários: ["www.domain.com/002/comment/002"]}})
db.Usuário.update({Nickname: "admin"}, {$set: {Comentários: ["www.domain.com/003/comment/003"]}})
db.Usuário.update({Nickname: "user"}, {$set: {Comentários: ["www.domain.com/004/comment/004"]}})

//Atribuindo Comentários às Postagens:
db.Postagem.update({URL: "www.domain.com/001"}, {$set: {Comentários: ["www.domain.com/001/comment/001"]}})
db.Postagem.update({URL: "www.domain.com/002"}, {$set: {Comentários: ["www.domain.com/002/comment/002"]}})
db.Postagem.update({URL: "www.domain.com/003"}, {$set: {Comentários: ["www.domain.com/003/comment/003"]}})
db.Postagem.update({URL: "www.domain.com/004"}, {$set: {Comentários: ["www.domain.com/004/comment/004"]}})
db.Postagem.update({URL: "www.domain.com/005"}, {$set: {Comentários: ["www.domain.com/005/comment/005"]}})

//Atribuindo Curtidas aos Comentários:
db.Comentário.update({URL: "www.domain.com/001/comment/001"}, {$set: {"Curtido por": ["YanzinDaQuebrada"]}})
db.Comentário.update({URL: "www.domain.com/002/comment/002"}, {$set: {"Curtido por": ["admin"]}})
db.Comentário.update({URL: "www.domain.com/003/comment/003"}, {$set: {"Curtido por": ["Jorgin"]}})
db.Comentário.update({URL: "www.domain.com/004/comment/004"}, {$set: {"Curtido por": ["user"]}})
db.Comentário.update({URL: "www.domain.com/005/comment/005"}, {$set: {"Curtido por": ["Amandinha"]}})

//Atribuindo autores às Curtidas nos Comentários:
db.Usuário.update({Nickname: "Jorgin"}, {$set: {"Comentários curtidos": ["www.domain.com/003/comment/003"]}})
db.Usuário.update({Nickname: "Amandinha"}, {$set: {"Comentários curtidos": ["www.domain.com/005/comment/005"]}})
db.Usuário.update({Nickname: "admin"}, {$set: {"Comentários curtidos": ["www.domain.com/002/comment/002"]}})
db.Usuário.update({Nickname: "user"}, {$set: {"Comentários curtidos": ["www.domain.com/004/comment/004"]}})
db.Usuário.update({Nickname: "YanzinDaQuebrada"}, {$set: {"Comentários curtidos": ["www.domain.com/001/comment/001"]}})

//b.ii. Consultas

//➢ 2 consultas com pelo menos filtros diversos (IN, GT, etc), sem projeção; 
//Consulta que retorna os usuários que se identificam como Feminino ou Masculino
db.Usuário.find({ Gênero: { $in: ["Feminino", "Masculino"] } })


//➢ 2 consultas com pelo menos filtros diversos e com projeção; 
//Consulta que retorna as duas primeiras postagens que possuem a tag linkUp
db.Postagem.find({ Tag: { $in: ["linkUp"] } }, { Tag: { $slice: 2 } })



//➢ 1 consulta com pelo menos acesso a elemento de array; 
//Consulta que retorna as postagens que não tiveram curtidas (baixo engajamento)
db.Postagem.find({ "Curtida por": { $size: 0 } })
//OU
//Consulta que retorna os comentários curtidos por um determinado usuário
db.Comentário.find({ "Curtido por": { $elemMatch: { $eq: "Amandinha" } } })

//➢ 1 consulta com pelo menos acesso a estrutura/objeto embutido; 
//➢ 1 consulta com pelo menos sort e limit e filtros e projeções;  

//➢ 1 consulta com pelo menos aggregate e group by; 
//Consulta que retorna a média de curtidas dos comentários
db.Comentário.aggregate([
    {
      $group: {
        _id: null,
        médiaCurtidasporComent: { $avg: { $size: "$Curtido por" } }
      }
    }
])

//ou
//Consulta que retorna os usuários, informando seu número de seguidores, de usuários seguidos, e número de postagens
db.Usuário.aggregate([
  {
    $group: {
      _id: "$_id",
      Nickname: { $first: "$Nickname" },
      somaSeguindo: { $size: "$Segue" },
      somaSeguidores: { $size: "$Seguidores" },
      numPostagens: { $size: "$Postagens" }
    }
  }
])

//➢ 1 consulta com pelo menos aggregate e match ou project ou ambos; 
//➢ 1 consulta com pelo menos aggregate e lookup; 
//➢ 1 outra consulta (robusta) a seu critério, dentro do contexto da aplicação. 
