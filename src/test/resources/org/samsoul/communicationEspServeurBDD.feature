Feature: Communication de données entre l'ESP32, le serveur et la base de données

  Scenario: Lancement d'un test
    Given un utilisateur connecté
    When l'utilisateur lance un test
    Then l'ESP récolte des données

  Scenario: Envoi des données utilisateur à la BDD
    Given un utilisateur connecté
    And un test lancé
    When l'ESP récolte des données
    Then les données sont envoyées au serveur
    And les données sont transmises à la BDD

  Scenario : Réception de données aberrantes des capteurs
    Given un utilisateur connecté
    And un test lancé
    When les données envoyées sont aberrantes
    Then les données ne sont pas envoyées à la BDD
    And un message est envoyé à l'utilisateur


  Scenario : Comportement quand un capteur est déféctueux
    Given un utilisateur connecté
    And un test lancé
    When un des capteurs n'envoie pas de données
    Then le test s'annule
    And un message est envoyé à l'utilisateur
