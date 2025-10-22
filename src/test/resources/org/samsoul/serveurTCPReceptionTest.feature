Feature: Serveur TCP java qui reçoit des données
  En tant qu'utilisateur du système,
  Je veux que le serveur TCP reçoive et traite correctement les données des microcontrôleurs et du serveur de médias,
  Afin d'assurer une communication fiable et un traitement approprié des données.

  Background:
    Given un serveur TCP démarré sur le port 12345
    And deux microcontrôleurs Arduino connectés au serveur
    And un serveur de traitement et d'analyse de médias connecté au serveur

  Scenario: Réception de données valides depuis un microcontrôleur Arduino
    When le microcontrôleur 1 envoie une trame de données valide
    Then le serveur TCP doit recevoir la trame
    And le serveur TCP doit envoyer un accusé de réception au microcontrôleur Arduino 1
    And le serveur TCP doit envoyer les données vers la base de données

  Scenario: Réception de données valides depuis le deuxième microcontrôleur Arduino
    When le microcontrôleur 2 envoie une trame de données valide
    Then le serveur TCP doit recevoir la trame
    And le serveur TCP doit envoyer un accusé de réception au microcontrôleur Arduino 2
    And le serveur TCP doit envoyer les données vers la base de données

  Scenario: Réception de données valides depuis le serveur de médias
    When le serveur de médias envoie une trame de données valide
    Then le serveur TCP doit recevoir la trame
    And le serveur TCP doit envoyer un accusé de réception au serveur de médias
    And le serveur TCP doit envoyer les données vers la base de données

  Scenario: Réception de données invalides depuis un microcontrôleur Arduino
    When le microcontrôleur 1 envoie une trame de données invalide
    Then le serveur TCP doit détecter l'erreur de format
    And le serveur TCP doit envoyer un message d'erreur au microcontrôleur Arduino 1
    And le serveur TCP ne doit pas envoyer les données vers la base de données

  Scenario: Déconnexion inattendue d'un microcontrôleur Arduino
    When le microcontrôleur 1 se déconnecte de manière inattendue
    Then le serveur TCP doit détecter la déconnexion
    And le serveur TCP doit enregistrer un evenement de déconnexion dans les logs

  Scenario: Réception simultanée de données depuis les deux microcontrôleurs Arduino
    When le microcontrôleur 1 envoie une trame de données valide
    And le microcontrôleur 2 envoie une trame de données valide en même temps
    Then le serveur TCP doit recevoir les deux trames
    And le serveur TCP doit envoyer un accusé de réception à chaque microcontrôleur
    And le serveur TCP doit envoyer les données des deux microcontrôleurs vers la base de données

  Scenario: Réception de données depuis le serveur de médias avec un format incorrect
    When le serveur de médias envoie une trame de données avec un format incorrect
    Then le serveur TCP doit détecter l'erreur de format
    And le serveur TCP doit envoyer un message d'erreur au serveur de médias
    And le serveur TCP ne doit pas enregistrer les données dans la base de donnéesFe

