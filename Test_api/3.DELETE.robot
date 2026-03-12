*** Settings ***
Library    RequestsLibrary    # Import de la bibliothèque pour les requêtes HTTP
Library    Collections

*** Variables ***
${Base_URL}              https://mock-api-h0g7.onrender.com/    # Définition de l'URL de base de l'API
${API_KEY}               Cle-API-ReqRes-test-academy            # Clé API pour l'authentification
${FirstName_Nouveau}     Test
${LastName_Nouveau}      Utilisateur
${Email_Nouveau}         test.utilisateur@gmail.com

*** Test Cases ***
Test Requete DELETE
    # Étape 1 : Créer un utilisateur pour avoir un ID valide à supprimer
    &{headers}=          Create Dictionary    Authorization=Bearer ${API_KEY}
    &{Corps_Requete}=    Create Dictionary    first_name=${FirstName_Nouveau}    last_name=${LastName_Nouveau}    email=${Email_Nouveau}
    ${ReponsePost}=      POST                 ${Base_URL}api/users    json=${Corps_Requete}    headers=${headers}    expected_status=201
    ${Id_A_Supprimer}=   Get From Dictionary  ${ReponsePost.json()}    id

    # Étape 2 : Supprimer l'utilisateur fraichement créé
    ${ReponseDelete}=    DELETE               ${Base_URL}api/users/${Id_A_Supprimer}    headers=${headers}    expected_status=204