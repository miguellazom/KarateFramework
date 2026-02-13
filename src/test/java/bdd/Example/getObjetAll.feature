#https://restful-api.dev
@getAllObjects
Feature: Consulta los objetos guardados

  Background:
    * def uriGetObject = '/objects'

  @ignore @reutilifableAllObjects
  Scenario: Happy path get objects
    Given url apiRestFullExample + uriGetObject
    When method GET
    Then status 200
    And print response
    * def ListAllObjects = response

  @getAllObjects-1 @smoke_test
  Scenario: Happy path get objects
    Given url apiRestFullExample + uriGetObject
    When method GET
    Then status 200
    And print response