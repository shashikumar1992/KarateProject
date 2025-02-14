
Feature: Consumer Enrollment

Background:
  * url 'https://bimhep-qa.bimnetworkstech.com/api/hostedEnrollment'
  * def consumerEnrollmentRequest = read('classpath:helpers/JSON/BuydirectRequest/consumerEnrollment.json')
  * def continueEnrollmentRequest = read('classpath:helpers/JSON/BuydirectRequest/continueEnrollment.json')
  * def cdwMatchEnrollment = read('classpath:helpers/JSON/BuydirectRequest/cdwMatchEnrollment.json')
  * def confirmCdw = read('classpath:helpers/JSON/BuydirectRequest/confirmCdw.json')
  * def PostToWebhookOnIAVExit = read('classpath:helpers/JSON/BuydirectRequest/PostToWebhookOnIAVExit.json')
  * def DataGenerator = Java.type('helpers.DataGenerator')
  
  # Generate random email and set in request
  * set consumerEnrollmentRequest.emailAddress = DataGenerator.getRandomEmail()
  
  # Define common headers
  * def commonHeaders = { 'Content-Type': 'application/json', 'Accept': '*/*' }

Scenario: Consumer End to End CDW Enrollment.

  # consumerEnrollment
  Given path '/consumerEnrollment'
  And headers commonHeaders
  And request consumerEnrollmentRequest
  When method post
  Then status 200
  * print 'Consumer Enrollment Response:', response

  # Validate and extract response fields
  * match response.payload contains { consumer_public_key: '#notnull', consumerAccessToken: '#notnull', consumer_id: '#notnull' }
  * def consumer_public_key = response.payload.consumer_public_key
  * def consumerAccessToken = response.payload.consumerAccessToken
  * def consumer_id = response.payload.consumer_id

  # continueEnrollment
  Given path '/continueEnrollment'
  * set continueEnrollmentRequest.Payload.PublicKey = consumer_public_key
  * set continueEnrollmentRequest.Payload.AccessToken = consumerAccessToken
  And headers commonHeaders
  And request continueEnrollmentRequest
  When method post 
  Then status 200
  * print 'Continue Enrollment Response:', response

  # PostToWebhookOnIAVExit
  Given path '/PostToWebhookOnIAVExit'
  And headers commonHeaders
  And request PostToWebhookOnIAVExit
  When method post 
  Then status 200
  * print 'PostToWebhookOnIAVExit Response:', response

  # Improved wait mechanism instead of sleep
  * eval function wait(ms) { java.lang.Thread.sleep(ms) }
  * wait(5000)

  # cdwMatchEnrollment
  Given path '/cdwMatchEnrollment'
  * set cdwMatchEnrollment.Payload.PublicKey = consumer_public_key
  * set cdwMatchEnrollment.Payload.AccessToken = consumerAccessToken
  * print 'CDW Match Enrollment Request:', cdwMatchEnrollment
  And headers commonHeaders
  And request cdwMatchEnrollment
  When method post
  Then status 200
  * print 'CDW Match Enrollment Response:', response

  # confirmCdw
  Given path '/confirmCdw'
  * set confirmCdw.Payload.PublicKey = consumer_public_key
  * set confirmCdw.Payload.AccessToken = consumerAccessToken
  And headers commonHeaders
  And request confirmCdw
  When method post 
  Then status 200
  * print 'Confirm CDW Response:', response


