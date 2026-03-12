*** Settings ***
Resource    commun.resource
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
Un Message D'erreur Doit Être Visible Après Une Connexion Incorrecte 1
    Ouvrir Le Navigateur Et Accéder À L'application
    Accéder À La Page De Connexion
    Saisir Le Nom D'utilisateur    azerty
    Saisir Le Mot De Passe    azerty
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message D'erreur Est Visible

Un Message D'erreur Doit Être Visible Après Une Connexion Incorrecte 2
    Ouvrir Le Navigateur Et Accéder À L'application
    Accéder À La Page De Connexion
    Saisir Le Nom D'utilisateur    robot
    Saisir Le Mot De Passe    azerty
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message D'erreur Est Visible

Un Message D'erreur Doit Être Visible Après Une Connexion Incorrecte 3
    Ouvrir Le Navigateur Et Accéder À L'application
    Accéder À La Page De Connexion
    Saisir Le Nom D'utilisateur    azerty
    Saisir Le Mot De Passe    robot
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message D'erreur Est Visible
    



 

    
    
    
    