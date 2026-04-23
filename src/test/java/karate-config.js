function fn() {

  karate.configure('ssl', true);
  var env = karate.env || 'cert';

  if( env == 'cert' ){
    karate.log('cert environment');
    var exampleRest = 'https://jsonplaceholder.typicode.com'
    var dummyJsonURL = 'https://dummyjson.com'
    var apiRestFullExample = 'https://api.restful-api.dev'
    var authenticationSpotify = 'https://accounts.spotify.com/api/token'
    var authUserSpotify = 'https://accounts.spotify.com/authorize'
    var apiSpoty = 'https://api.spotify.com/v1'
    var clientId = '5050215e02104b9ebb81ef5591e1635c';
    var clientSecret = 'b5dfb83e15dd494d9f5c8eca0b01ac57';
    var redirect_uri = 'http://127.0.0.1:8888/callback';
  }else if( env == 'dev' ){
    karate.log('no-cert environment');
  }
  var config = {
    env: env,
    dummyJsonURL: dummyJsonURL,
    apiRestFullExample:apiRestFullExample,
    exampleRest:exampleRest,
    authenticationSpotify: authenticationSpotify,
    clientId: clientId,
    clientSecret: clientSecret,
    apiSpoty: apiSpoty,
    redirect_uri: redirect_uri,
    authUserSpotify: authUserSpotify
  };
  return config;
}