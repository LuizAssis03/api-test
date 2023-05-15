*** Settings ***
Library        RequestsLibrary
Library        String


*** Keywords ***

Criar um usuário novo
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LATTERS]
    ${palavra_aleatoria}    Convert To Lower Case    string=${palavra_aleatoria}
    Set Test Variable    ${EMAIL_TEST}    ${palavra_aleatoria}@emailtest.com
    Log    ${EMAIL_TEST}

Cadastrar o usuário criado na ServeRest
    ${body}    Create Dictionary    
    ...        nome=Fulano test     
    ...        email=${EMAIL_TEST}    
    ...        password=1234    
    ...        administrador=true
    Log        ${body}
    Criar sessão na ServeRest
    ${resposta}    POST On Session    
    ...    alias=ServeRest
    ...    url=/usuarios    
    ...    json=${body}
        
    Log    ${resposta.json()}


Criar sessão na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}
    



    
    