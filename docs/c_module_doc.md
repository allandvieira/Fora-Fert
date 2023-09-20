python api instructions

    a cada requisicao recebida (pelo flask), chamar uma funcao em c
    na branch clips_python vou deixar um prototipo, para poder testar a api enquanto 
    o modulo em c nao fica pronto.


    verificar cada parametro recebido do front, e inserir apenas os que forem diferentes de nulo (null, "", etc)
    cada parametro valido (que nao for nulo) deve ser inserido como um fato usando o modulo escrito em c.

    para inserir a forrageira como alfafa, por exemplo, use:
    c_clips.insert_fact("alfafa") 
    cada fato deve ser inserido seguindo esse padrao.

    apos inserir os fatos, chamar a funcao c_clips.get_recommendation(), que
    retorna a mensagem de recomendacao de acordo com os fatos inseridos.

    fazer as respostas a api ocorrerem de forma assincrona.
    outra coisa que pode ser adicionada eh criar uma forma de limitar a quantidade de requisicoes,
    mas eh uma tarefa futura, caso sobre tempo.

the end.
