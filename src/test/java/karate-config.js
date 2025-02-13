function fn() {
  var env = karate.env; 
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiURL :'https://api.getpostman.com',
    apiKey :'PMAK-67a1fd6a1bd33e0001398b39-8f7df1a19b801ffe2ebdd25b9b6fc3bdfb'
  }
  if (karate.properties['performanceTest'] == 'true') {
    config.performanceTest = true;
}
  if (env == 'dev') {
   
  } else if (env == 'e2e') {
  
  }
  return config;
}