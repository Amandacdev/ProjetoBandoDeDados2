//3) a.i e 3)b.i => Criando e alimentando as coleções (com 5 inserções para cada coleção):

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
db.Postagem.insertOne({URL: "www.domain.com/001", Título: "My first post", Conteúdo: "Hello, world! This is LinkUp!", Datahora: "01/07/2023 - 16:09", Tags: ["New", "LinkUp"]})
db.Postagem.insertOne({URL: "www.domain.com/002", Título: "Título da postagem 2", Conteúdo: "Conteúdo da postagem 2", Datahora: "01/07/2023 - 13:08", Tags: ["New"]})
db.Postagem.insertOne({URL: "www.domain.com/003", Título: "Título da postagem 3", Conteúdo: "Conteúdo da postagem 3", Datahora: "15/06/2023 - 19:03", Tags: ["Arte","Desenhos"]})
db.Postagem.insertOne({URL: "www.domain.com/004", Título: "Título da postagem 4", Conteúdo: "Conteúdo da postagem 4", Datahora: "28/06/2023 - 10:01", Tags: ["Cinema","Marvel"]})
db.Postagem.insertOne({URL: "www.domain.com/005", Título: "Título da postagem 5", Conteúdo: "Conteúdo da postagem 5", Datahora: "01/06/2023 - 22:40", Tags: ["Netflix","Black Mirror"]})
db.Postagem.insertOne({URL: "www.domain.com/006", Título: "Título da postagem 6", Conteúdo: "Amei a LinkUp, parece o Threads!", Datahora: "05/07/2023 - 22:40", Tags: ["Internet","Threads"]})
db.Postagem.insertOne({URL: "www.domain.com/007", Título: "Título da postagem 7", Conteúdo: "LinkUp rainha, Twitter nadinha!", Datahora: "05/07/2023 - 23:40", Tags: ["Twitter","LinkUp"]})
db.Postagem.insertOne({URL: "www.domain.com/008", Título: "Título da postagem 8", Conteúdo: "Odeio redes sociais!", Datahora: "06/07/2023 - 12:00", Tags: ["Odeio","Redes", "Sociais", "#FaleiToLeve", "Desabafo"]})

//Atribuindo autores para as Postagens: 
db.Usuário.update({Nickname: "Jorgin"}, {$set: {Postagens: ["www.domain.com/001", "www.domain.com/007"]}})
db.Usuário.update({Nickname: "Amandinha"}, {$set: {Postagens: ["www.domain.com/002", "www.domain.com/006"]}})
db.Usuário.update({Nickname: "YanzinDaQuebrada"}, {$set: {Postagens: ["www.domain.com/003", "www.domain.com/008"]}})
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
db.Comentário.insertOne({URL: "www.domain.com/002/comment/002", Datahora: "01/07/2023 - 14:09", Conteúdo: "Comentário 2", Editado: true})
db.Comentário.insertOne({URL: "www.domain.com/003/comment/003", Datahora: "15/06/2023 - 19:30", Conteúdo: "Comentário 3", Editado: false})
db.Comentário.insertOne({URL: "www.domain.com/004/comment/004", Datahora: "28/06/2023 - 11:59", Conteúdo: "Comentário 4", Editado: true})
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

//3)a.ii => Criação de 2 índices com justificativa

//Os campos a seguir foram escolhidos para indexação pois são consultados por intervalos, logo a sua indexação acelera a consulta.
db.Usuário.createIndex( { Nascimento: 1 } )
db.Postagem.createIndex( { Datahora: 1 } )
db.Comentário.createIndex( { Datahora: 1 } )

//3)b.ii => Consultas diversas

//➢ 2 consultas com pelo menos filtros diversos (IN, GT, etc), sem projeção; 
//Consulta que retorna os usuários que se identificam como Feminino ou Masculino
db.Usuário.find({ Gênero: { $in: ["Feminino", "Masculino"] } })

//Consulta que retorna todas as postagens que possuem em seu conteúdo a palavra linkUp (escrita tanto em letras maiúsculas quanto minúsculas)
db.Postagem.find({Conteúdo: {$regex: /linkUp/i}})

//➢ 2 consultas com pelo menos filtros diversos e com projeção; 
//Consulta que retorna as duas primeiras postagens que possuem a tag New (Postagens com assuntos novos, atuais)
db.Postagem.find({ Tags: { $in: ["New"] } }, { Tag: { $slice: 2 } })

//Consulta que retorna o Nickname e o email dos Usuários que seguem o Usuário "Amandinha"
db.Usuário.find({ Segue: "Amandinha" }, { Nickname: 1, Email: 1, _id: 0 })

//➢ 1 consulta com pelo menos acesso a elemento de array; 
//Consulta que retorna os comentários curtidos pelo usuário "Amandinha"
db.Comentário.find({ "Curtido por": { $elemMatch: { $eq: "Amandinha" } } })

//➢ 1 consulta com pelo menos acesso a estrutura/objeto embutido;
//Consulta que retorna os usuários cujo sobrenome seja Lima, Cruz ou Ribeiro
db.Usuário.find({ "Nome.Sobrenome": { $in: ["Lima", "Cruz", "Ribeiro"] } })

//➢ 1 consulta com pelo menos sort e limit e filtros e projeções; 
//Consulta que retorna 5 postagens que não tiveram curtida, exibidas em ordem alfabética por Nickname (Postagens com baixo engajamento)
db.Postagem.find({ "Curtida por": { $size: 0 } }).sort({ "Nickname": 1 }).limit(5)

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

//➢ 1 consulta com pelo menos aggregate e match ou project ou ambos;
//Consulta que retorna postagens cujo número de Tags é maior que dois
db.Postagem.aggregate(
[
     {$project: {_id:1, URL:1, Título:1, Nickname:1, 
                 	size_of_tag: {$size: "$Tags"}
                }
     },
     {$match: {"size_of_tag": {$gt: 2}}}
])

//➢ 1 consulta com pelo menos aggregate e lookup;
//Consulta que retorna os comentários feitos pelo usuário YanzinDaQuebrada que foram editados
db.Comentário.aggregate([
  {
    $match: {
      Editado: true
    }
  },
  {
    $lookup: {
      from: "Usuário",
      localField: "URL",
      foreignField: "Comentários",
      as: "usuários"
    }
  },
  {
    $match: {
      "usuários.Nickname": "YanzinDaQuebrada"
    }
  }
])

//➢ 1 outra consulta (robusta) a seu critério, dentro do contexto da aplicação. 
//Consulta que retorna as postagens feitas pelo usuário Jorgin e os comentários feitos nessas postagens
db.Postagem.aggregate([
  {
    $lookup: {
      from: "Usuário",
      localField: "URL",
      foreignField: "Postagens",
      as: "usuário"
    }
  },
  {
    $match: {
      "usuário.Nickname": "Jorgin"
    }
  },
  {
    $lookup: {
      from: "Comentário",
      localField: "URL",
      foreignField: "URL",
      as: "comentários"
    }
  }
])

//Consulta que retorna a contagem de atividade de cada usuário da rede:
db.Usuário.aggregate([
  {
    $project: {
      Nickname: 1,
      Num_Segue: { $size: { $ifNull: ["$Segue", []] } },
      Num_Seguidores: { $size: { $ifNull: ["$Seguidores", []] } },
      Num_Postagens: { $size: { $ifNull: ["$Postagens", []] } },
      Num_Post_Curtidas: { $size: { $ifNull: ["$Postagens curtidas", []]}},
      Num_Coment_Feitos: { $size: { $ifNull: ["$Comentários", []]}},
      Num_Coment_Curtidos: { $size: { $ifNull: ["$Comentários curtidos", []]}},
    }
  }
])

