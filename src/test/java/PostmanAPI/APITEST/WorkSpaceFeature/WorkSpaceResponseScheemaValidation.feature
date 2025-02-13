Feature: Workspace Management

Background:
  * url apiURL
  * def workSpaceRequest = read('classpath:helpers/JSON/WorkSpaceRequestDat.json')
  * def DataGenerator = Java.type('helpers.DataGenerator')
  * set workSpaceRequest.workspace.name = DataGenerator.getRandomArticleValues().name
  * set workSpaceRequest.workspace.description = DataGenerator.getRandomArticleValues().description
  * set workSpaceRequest.workspace.visibilityStatus = DataGenerator.getRandomArticleValues().visibilityStatus
  
Scenario: Schema Validation
  Given path '/workspaces/'
  And headers { 'x-api-key': '#(apiKey)' }
  And request workSpaceRequest
  When method post
  Then status 200
  And match response.workspace.name == workSpaceRequest.workspace.name
  And match response == 
  """
  {
    "workspace": {
      "id": "#regex ^[a-z0-9-]{36}$",
      "name": "#string"
    }
  }

  """
