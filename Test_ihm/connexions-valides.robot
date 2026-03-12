*** Settings ***
Resource    commun.resource
Test Teardown    Fermer Le Navigateur

*** Test Cases ***
Le Tableau De Bord Doit Être Visible Après Une Connexion Réussie
    Effectuer Une Connexion Réussie
    Vérifier Que Le Tableau De Bord Est Visible

Le Lien De Déconnexion Doit Être Visible Après Une Connexion Réussie
    Effectuer Une Connexion Réussie
    Vérifier Que Le Lien De Déconnexion Est Visible

Le Lien De Connexion Doit Être Visible Après Une Déconnexion Réussie
    Effectuer Une Connexion Réussie
    Effectuer Une Déconnexion Réussie
    Vérifier Que Le Lien De Connexion Est Visible