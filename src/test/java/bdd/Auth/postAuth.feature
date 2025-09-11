#https://dummyjson.com/docs
@postTokenAplicacion
Feature: Generacion de token de autenticacion

  Background:
    * def uriToken = '/auth/login'
    * def path = '/Auth/'
    * def headers = read('classpath:req'+path+'headers.json')
    * def body = read('classpath:req'+path+'post_bodyToken.json')

  @postTokenReusable @ignore
  Scenario: Happy path get token
    Given url dummyJsonURL + uriToken
    * print headers
    And headers headers
    * print body
    And request body
    When method POST
    Then status 200
    And print response
    * def accessToken = response.accessToken
    * print 'El access token es:', accessToken
    * karate.set('accessTokenUser', accessToken)

  @postTokenHapy
  Scenario Outline: Happy path get token
    Given url dummyJsonURL + uriToken
    * print headers
    And headers headers
    * print body
    And request body
    When method POST
    Then status 200
    And print response
    * match response.id == '#number'
    * match response.username == '<user>'
    * match response.email == '#regex [a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}'

    Examples:
      | user     | pass         |
      | michaelw | michaelwpass |
      | jamesd   | jamesdpass   |

  @postTokenError
  Scenario Outline: Error user no registrado
    Given url dummyJsonURL + uriToken
    * print headers
    And headers headers
    * print body
    And request body
    When method POST
    Then status 400
    And print response
    * match response.message == "Invalid credentials"

    Examples:
      | user  | pass |
      | user1 | pass |
      | user2 | pass |