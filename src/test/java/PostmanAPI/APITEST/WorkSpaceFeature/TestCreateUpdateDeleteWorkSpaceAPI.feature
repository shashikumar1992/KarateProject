@debug
Feature: Workspace Management

Background:
  * url apiURL
  * def Workresponse = call read('classpath:helpers/getWorkSpaceId.feature')
  * def wid = Workresponse.workId
  * print 'DEBUG: Workspace ID ->', wid
  

Scenario: Test the Create, Update, Get, and Delete workspace APIs with positive scenarios.

 
# Get WorkSpace By Id

  * headers { 'x-api-key': '#(apiKey)' }
  Given path '/workspaces/' + wid
  When method get
  Then status 200
  And match response.workspace.id == wid
  And match response.workspace.name == 'karateWorkSpace'

  # Update WorkSpace By Id

  * headers { 'x-api-key': '#(apiKey)'}
  Given path '/workspaces/' + wid
  And request {     "workspace": { "name": "karateWorkSpaceUpdated","type": "personal","description": "Updated Description"     }  }
  When method put
  Then status 200
  And match response.workspace.id == wid
  And match response.workspace.name == 'karateWorkSpaceUpdated'

  #Delete WorkSpcae By Id

  * headers { 'x-api-key': '#(apiKey)'}
  Given path '/workspaces/' + wid
  When method delete
  Then status 200
  And match response.workspace.id == wid

Scenario: Test the creation of a workspace with an invalid API key and verify the status code is 401, along with the corresponding error message
    Given path '/workspaces/'
  * headers { 'x-api-key': 'PMAK-678a05e799a5290001b8149d-8ce51c3d59b228d316d0c2bf96cdd03d' }
  Given request {     "workspace": { "name": "karateWorkSpace","type": "personal","description": "MYWorkSpaceKarate"} }
  When method post
  Then status 401
  And match response.error.message == 'Invalid API Key. Every request requires a valid API Key to be sent.'
  And match response.error.name == 'AuthenticationError'
  
Scenario: Test the Create WorkSpace APIs with invalid Request scenarios.
  Given path '/workspaces/'
  * headers { 'x-api-key': '#(apiKey)' }
  Given request { "workspace": {  "name": "karateWorkSpace" ,"type": "test", "description": "MYWorkSpaceKarate"    }   }
  When method post
  Then status 400 
  And match response.error.name == 'invalidParamError'
  And match response.error.message == 'body.visibilityStatus should be equal to one of the allowed values'