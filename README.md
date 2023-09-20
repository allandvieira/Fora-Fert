# Fora-Fert
Sistema de recomendação de calagem e adubação para forrageiras, utilizando sistema baseado em regras.

## Dependencias
    Necessario a instalacao do python3.11 e clips rules
    (instalacao e documentacao do clips rules disponivel em: <https://www.clipsrules.net>)

## Run
    para rodar a api:
    python3 app.py
    (configurar a porta do servico no cabecalho do arquivo, SERVER_PORT = <num-port>
    a API usa o modulo flask para responder as requisicoes post, recebendo os parametros.
    formata os parametros em regras do clips, grava em um arquivo e carrega este arquivo no clips.
    Entao captura a saida padrao e retorna para o front-end.

