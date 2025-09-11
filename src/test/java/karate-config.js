function fn() {

  karate.configure('ssl', true);
  var env = karate.env || 'cert';

  if( env == 'cert' ){
    karate.log('cert environment');
    var dummyJsonURL = 'https://dummyjson.com'
  }else if( env == 'dev' ){
    karate.log('no-cert environment');
  }

  var config = {
    env: env,
    dummyJsonURL: dummyJsonURL
  };
  return config;
}