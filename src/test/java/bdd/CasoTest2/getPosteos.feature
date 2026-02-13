@getAllPosts
Feature: Prueba get posteos web

  Background:
    * def pathGetAllPost = '/posts'

  @getAllPosts-1
  Scenario: Happy path get all posts
    Given url exampleRest + pathGetAllPost
    When method get
    Then status 200
    And print response
    * match response != null