Feature: Prueba get posteos web

  @getAllPosts
  Scenario: Happy path get all posts
    Given url 'https://jsonplaceholder.typicode.com'
    * path '/posts'
    When method get
    Then status 200
    And print response