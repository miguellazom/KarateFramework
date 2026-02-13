#https://restful-api.dev
@getByIDs
Feature: Consulta lista por IDs

  Background:
    * def uriGetObject = '/objects'

  @getObjectsByIDs-1 @smoke_test @flujo
  Scenario Outline: Happy path get objects
    Given url apiRestFullExample + uriGetObject
    And params { id: <ids> }
    When method GET
    Then status 200
    And print response
    * match response != null
    Examples:
      | ids                             |
      | [1,2,3,4,5,6,7,8,9,10,11,12,13] |
      | [1,3,5,7,9,11,13]               |
      | [2,4,6,8,10,12]                 |
      | [1,2,3]                         |
      | [4,5,6,7]                       |
      | [8,9,10]                        |
      | [1,13]                          |
      | [1]                             |

  @getObjectsByIDs-2 @componente
  Scenario Outline: Caso de error get objects by IDs
    Given url apiRestFullExample + uriGetObject
    And params { id: <ids> }
    When method GET
    Then status 200
    And print response
    Examples:
      | ids                                |
      | null                               |
      | [ ]                                |
      | [14]                               |
      | [1,2,3,4,5,6,7,8,9,10,11,12,13,14] |