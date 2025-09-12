@getFindByName
Feature: Consultar los usuarios por nombre

  Background:
    * def uriByName = '/users/search'

  @getUserReutilizable @ignore
  Scenario: Reusable get user
    Given url dummyJsonURL + uriByName + "?q=" + userName
    When method GET
    Then status 200
    And print response

