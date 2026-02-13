@Auth @refreshToken
Feature: Generacion de token refrescado

  Background:
    * def uriRefresh = '/auth/refresh'
    * def path = '/Authentication/'
    * def headers = read('classpath:req'+path+'headers.json')
    * def body = read('classpath:req'+path+'post_bodyToken.json')

  @postRefrehHapy
  Scenario Outline: Happy path get token
    * def userLogin = { "username": "<user>" ,"password": "<pass>" }
    * call read('classpath:bdd/Auth/postAuth.feature@postTokenReusable') userLogin
    Given url dummyJsonURL + uriRefresh
    * print headers
    And headers headers
    * print body
    And request body
    When method POST
    Then status 200
    And print response
    * def accessToken = response.accessToken
    * def refreshToken = response.refreshToken
    * print 'El access token es:', accessToken
    * print 'El refresh token es:', refreshToken
    * karate.set('refreshTokenUser', refreshToken)
    * karate.set('accessTokenUser', accessToken)
    * call read('classpath:bdd/Auth/getAuthMe.feature@getMeReusable')
    Examples:
      | user     | pass         |
      | michaelw | michaelwpass |
      | jamesd   | jamesdpass   |
