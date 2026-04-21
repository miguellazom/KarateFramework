@TokenSpoty
Feature: Generacion de token de spotify

  Background:
    * def path = '/TokenSpoty/'
    * def pathToken = function(filename){ return 'classpath:req'+path+filename }

  @getAppTokenReusable @ignore
  Scenario: Reusable get aplication token
    Given url authenticationSpotify
    * def headersToken = read(pathToken('headers.json'))
    * print headersToken
    And headers headersToken
    * def bodyAppToken = read(pathToken('boddyAppToken.json'))
    And form field grant_type = bodyAppToken.grant_type
    And form field client_id = clientId
    And form field client_secret = clientSecret
    When method POST
    Then status 200
    And print response
