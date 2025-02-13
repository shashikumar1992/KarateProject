Feature: Workspace Management.

Background:
  * url apiURL  
  * def workSpaceRequest = read('classpath:helpers/JSON/WorkSpaceRequestDat.json')
  * def DataGenerator = Java.type('helpers.DataGenerator')
  * set workSpaceRequest.workspace.name = DataGenerator.getRandomArticleValues().name
  * set workSpaceRequest.workspace.description = DataGenerator.getRandomArticleValues().description
  * set workSpaceRequest.workspace.visibilityStatus = DataGenerator.getRandomArticleValues().visibilityStatus
  
Scenario: Test the Create workspace API with -ve scenarios.

    Given path '/workspaces'
    * headers { 'x-api-key': '#(apiKey)' }
    And request workSpaceRequest
    When method post
    Then status 200
    And match response.workspace.name == workSpaceRequest.workspace.name
