@TokenSpoty
Feature: Generacion de token de spotify

  Background:
    * def pathToken = function(filename){ return 'classpath:req'+'/TokenSpoty/'+filename }

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
    * def accessToken = 'Bearer '+response.access_token

  @getUserTokenReusable
  Scenario: Reusable get aplication token
    * configure driver = { type: 'chrome', addOptions: ['--remote-allow-origins=*'] }
    * def fullUrl = authUserSpotify+'?client_id='+clientId+'&response_type=code&redirect_uri='+redirect_uri+'&scope=user-read-private%20user-read-email'
    * driver fullUrl
    * eval java.lang.Thread.sleep(100)
    * input('#username', "mlazo6414@gmail.com")
    * click("[data-testid='login-button']")
    * eval java.lang.Thread.sleep(100000)
    #* input('input#login-password', passwordSpotify)