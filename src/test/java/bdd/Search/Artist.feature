@Search
Feature: Metodo de busqueda en spotify

  Background:
    * def uriSearchSpotify = '/search'
    * callonce read('classpath:bdd/TokenSpoty/token.feature@getAppTokenReusable')
    * def pathSearch = function(filename){ return 'classpath:req'+'/Search/'+filename }

    @searchArtist @happyPath
    Scenario Outline: Happy path search artist
      Given url apiSpoty + uriSearchSpotify
      And params { q: '<wordKey>', type: '<type>', limit: 10 }
      * def headers = read(pathSearch('headers.json'))
      * print headers
      And headers headers
      When method GET
      Then status 200
      And print response
      * match response != null
      * match response.artists.items[0].id == '<id>'
      * def urlArtista = 'https://open.spotify.com/artist/'+'<id>'
      * match response.artists.items[0].external_urls.spotify == urlArtista
      * match response.artists.items[0].type == type
      Examples:
        | wordKey   | type   | id                     |
        | metallica | artist | 2ye2Wgw4gimLv2eAKyk1NB |
        | beatles   | artist | 3WrFJ7ztbogyGnTHbHJFl2 |

