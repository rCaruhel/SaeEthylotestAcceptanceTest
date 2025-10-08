# Pour la facilité d'écriture des test , TTDR = test de temps de réaction
Feature: Démarrage correct du matériel au lancement des tests


  Scenario: Allumage de la led rouge quand on lance le TTDR
    Given les leds rouge et verte sont éteintes
    When le test de temps est lancé
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