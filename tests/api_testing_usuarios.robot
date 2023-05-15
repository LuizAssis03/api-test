*** Settings ***
Resource        ../resources/api_testing_usuarios.resource
Resource        ../variables/variables.robot


*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest
    # Conferir se o usuário foi cadastrado corretamente
