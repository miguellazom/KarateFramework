@getAllUsers
Feature: Consultar todos los usuarios

  Background:
    * def uriUsers = '/users'
    * def path = '/Users/'

  @getAllUsersReutilizable @ignore
  Scenario: Reusable get users
    Given url dummyJsonURL + uriUsers
    When method GET
    Then status 200
    And print response
    * def users = response.users
    * print 'Total users:', users

  @getAllUsers
  Scenario:  Happy path get users
    Given url dummyJsonURL + uriUsers
    When method GET
    Then status 200
    And print response
    Then match response.users == '#[30]'
