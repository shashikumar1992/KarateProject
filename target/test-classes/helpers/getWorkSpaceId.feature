Feature: Create WorkSpaceID 

Background:
  * url apiURL
Scenario: Test the Create, Update, Get, and Delete workspace APIs with positive scenarios.

  #Create WorkSpace

  Given path '/workspaces/'
  And headers { 'x-api-key': '#(apiKey)' }
  And request 
    """
    { 
      "workspace": {  
        "name": "karateWorkSpace",
        "type": "personal", 
        "description": "MYWorkSpaceKarate"
      }   
    }
    """
  When method post
  Then status 200
  
  * def workId = response.workspace.id
  * print workId