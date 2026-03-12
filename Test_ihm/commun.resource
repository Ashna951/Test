*** Settings ***
Library    Selenium2Library

*** Variables ***
${URL}    http://livraison3.testacademy.fr/
${NAVIGATEUR}    firefox

${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${LIEN SE DECONNECTER}    xpath=//*[contains(normalize-space(.), 'Se déconnecter')]
${CHAMP NOM UTILISATEUR}    name=username
${CHAMP MOT DE PASSE}    name=password
${UTILISATEUR VALIDE}    robot
${MOT DE PASSE VALIDE}    robot
${BOUTON SE CONNECTER}    css=.homey_login_button
${ZONE ERREUR}    css=#modal-login .error
${TITRE PAGE TABLEAU DE BORD}    Tableau de bord - Livraison 3

*** Keywords ***
Ouvrir Le Navigateur Et Accéder À L'application
    Open Browser    ${URL}    ${NAVIGATEUR}
    Maximize Browser Window
    Wait Until Page Contains Element    ${LIEN SE CONNECTER}    10s

Accéder À La Page De Connexion
    Click Element    ${LIEN SE CONNECTER}
    Wait Until Element Is Visible    ${CHAMP NOM UTILISATEUR}    10s
    Wait Until Element Is Visible    ${CHAMP MOT DE PASSE}    10s

Saisir Le Nom D'utilisateur
    [Arguments]    ${utilisateur}
    Input Text    ${CHAMP NOM UTILISATEUR}    ${utilisateur}

Saisir Le Mot De Passe
    [Arguments]    ${mot_de_passe}
    Input Text    ${CHAMP MOT DE PASSE}    ${mot_de_passe}

Soumettre Le Formulaire De Connexion
    Click Button    ${BOUTON SE CONNECTER}

Effectuer Une Connexion Réussie
    Ouvrir Le Navigateur Et Accéder À L'application
    Accéder À La Page De Connexion
    Saisir Le Nom D'utilisateur    ${UTILISATEUR VALIDE}
    Saisir Le Mot De Passe    ${MOT DE PASSE VALIDE}
    Soumettre Le Formulaire De Connexion

Vérifier Que Le Message D'erreur Est Visible
    Wait Until Element Is Visible    ${ZONE ERREUR}    10s

Vérifier Que Le Tableau De Bord Est Visible
    Wait Until Page Contains    Tableau de bord    10s

Vérifier Que Le Lien De Déconnexion Est Visible
    Wait Until Page Contains    Se déconnecter    10s

Effectuer Une Déconnexion Réussie
    Wait Until Page Contains    Se déconnecter    10s
    Click Element    ${LIEN SE DECONNECTER}
    Wait Until Page Contains    Se connecter    10s

Vérifier Que Le Lien De Connexion Est Visible
    Wait Until Page Contains    Se connecter    10s

Fermer Le Navigateur
    Close Browser