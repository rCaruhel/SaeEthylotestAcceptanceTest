# Pour la facilité d'écriture des test , TTDR = test de temps de réaction
Feature: Fonctionnement correct du matériel au lancement des tests

  Scenario: Allumage de la led rouge quand on lance le TTDR
    Given les leds rouge et verte sont éteintes
    And aucun test n'est en cours
    When le TTDR est lancé
    Then la led rouge s'allume

  Scenario: Changement de l'état des leds pendant le TTDR
    Given la led rouge allumée
    And le TTDR est lancé
    When à partir d'un temps aléatoire le test change d'état
    Then la led rouge s'éteint et la verte s'allume


  Scenario: Fin du TTDR
    Given la led verte allumée
    And le TTDR est lancé
    When l'utilisateur clique sur le bouton
    Then le test se termine
    And la led verte s'éteint

  Scenario: Récupération du temps de réaction et envoi au serveur Java
    When le TTDR se termine
    Then le temps de réaction est envoyé au serveur java


  Scenario: Modification de l'aléatoire du temps de réaction
    Given le TTDR n'est pas en cours
    When la variable du temps de réaction est augmentée de 1 seconde
    Then la led verte met une seconde de plus à s'allumer


  Scenario: Mise en veille profond lors de l'accionnement de l'interupteur
    Given l'appareil est en marche
    When l'interrupteur est actionné
    Then l'appareil est mis en veille profond

  Scenario: Désactivation de la mise en veille profond
    Given l'appareil est en veille profond
    When l'interrupteur est actionné
    Then l'appareil se réveille

  Scenario: Test de stabilité
    Given aucun test n'est en cours
    When le test de stabilité est lancé
    Then les capteurs récupèrent les données pendant une période de quelques secondes
    And les données collectées sont envoyées au serveur java en temps réel