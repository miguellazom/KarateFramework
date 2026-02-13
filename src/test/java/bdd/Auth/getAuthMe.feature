@Auth @getAuthMe
Feature: Generacion de token de autenticacion

  Background:
    * def uriMe = '/auth/me'
    * def path = '/Authentication/'
    * def headersMe = 'classpath:req'+path+'post_headersMe.json'


  @getMeReusable @ignore
  Scenario: Reusable get perfil
    Given url dummyJsonURL + uriMe
    * def headersMe = read(headersMe)
    * print headersMe
    And headers headersMe
    When method GET
    Then status 200
    And print response

  @getMe @JLYH-6125 @flujo @smoke_test
  Scenario Outline: Happy path get perfil
    * def userLogin = { "username": "<user>" ,"password": "<pass>" }
    * call read('classpath:bdd/Auth/postAuth.feature@postTokenReusable') userLogin
    Given url dummyJsonURL + uriMe
    * def headersMe = read(headersMe)
    * print headersMe
    And headers headersMe
    When method GET
    Then status 200
    And print response
    * match response.id == '#number'
    * match response.username == '<user>'
    * match response.email == '#regex [a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}'

    Examples:
      | user     | pass         |
      | michaelw | michaelwpass |
      | jamesd   | jamesdpass   |


  @getMe @JLYH-6125 @flujo @smoke_test
  Scenario Outline: Happy path get perfil
    * def userLogin = { "username": "<user>" ,"password": "<pass>" }
    * call read('classpath:bdd/Auth/postAuth.feature@postTokenReusable') userLogin
    Given url dummyJsonURL + uriMe
    * def headersMe = read(headersMe)
    * print headersMe
    And headers headersMe
    When method GET
    Then status 200
    And print response
    * match response.id == '#number'
    * match response.username == '<user>'
    * match response.email == '#regex [a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}'

    Examples:
      | user     | pass         |
      | michaelw | michaelwpass |
      | jamesd   | jamesdpass   |