@getUser
Feature: Generacion de token de autenticacion

  Background:
    * def uriUsers = '/users'
    * def path = '/Users/'

  @getUserReutilizable @ignore
  Scenario: Reusable get user
    Given url dummyJsonURL + uriUsers + "/" + userId
    When method GET
    Then status 200
    And print response

  @getUser
  Scenario Outline: Happy path get user
    * call read('classpath:bdd/Users/getAllUsers.feature@getAllUsersReutilizable')
    * def user = users.filter(x => x.id == <userId>)[0]
    * print 'User encontrado:', user
    Given url dummyJsonURL + uriUsers + "/" + <userId>
    When method GET
    Then status 200
    And print response
    * match response != null
    * match response == user
    Examples:
        | userId |
        | 1      |
        | 5      |
        | 10     |