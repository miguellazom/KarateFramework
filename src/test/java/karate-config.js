function fn() {

  karate.configure('ssl', true);
  var env = karate.env || 'cert';

  if( env == 'cert' ){
    karate.log('cert environment');
    var exampleRest = 'https://jsonplaceholder.typicode.com'
    var dummyJsonURL = 'https://dummyjson.com'
    var apiRestFullExample = 'https://api.restful-api.dev'
    var authenticationSpotify = 'https://accounts.spotify.com/api/token'
    var clientId = '';
    var clientSecret = '';
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
    clientSecret: clientSecret
  };
  return config;
}