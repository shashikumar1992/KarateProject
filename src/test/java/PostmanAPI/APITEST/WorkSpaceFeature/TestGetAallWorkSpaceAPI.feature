Feature: Workspace Management.

Background:
  * url apiURL
Scenario: Test get all WorkSpace with Valid data
  Given path '/workspaces/'
  * headers { 'x-api-key': '#(apiKey)' }
  When method get
  Then status 200


Scenario: Test get all WorkSpace with invalid APi key
  Given path '/workspaces/'
  * headers { 'x-api-key': 'PMAK-678a166c5137bc00014b8607-58366433607256c9dccf' }
  When method get
  Then status 401
    And match response.error.message == 'Invalid API Key. Every request requires a valid API Key to be sent.'
  And match response.error.name == 'AuthenticationError'

