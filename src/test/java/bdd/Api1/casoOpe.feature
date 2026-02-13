@ABC
Feature: Prueba simple de Karate

  @Suma
  Scenario: Verificar suma
    * def a = 2
    * def b = 3
    * def suma = a + b
    Then match suma == 5
  @Resta
  Scenario: Verificar resta
    * def a = 2
    * def b = 3
    * def resta = b - a
    Then match resta == 1