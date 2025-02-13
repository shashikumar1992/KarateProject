Feature: Workspace Management.

  Background:
    * url apiURL
    * def DataGenerator = Java.type('helpers.DataGenerator')
 


  Scenario Outline: Test the Create workspace API with -ve scenarios.

    * def randemName = DataGenerator.getRandomWorkSpaceNamename()
  
    Given path '/workspaces/'
    * headers { 'x-api-key': '#(apiKey)' }
    And request 
    """
    { 
    "workspace": {  
      "name": "<name>", 
      "type": "<type>", 
      "description": "<description>", 
      "visibilityStatus": "<visibilityStatus>"   
    }   
    }
    """
    When method post
    Then status <status>
    And match response == <Response>


    Examples:
      | name               | type      | description        | visibilityStatus | Response                                                                                                                   | status |
      |                    | personal  | MYWorkSpaceKarate  | private          | {"error": {"name": "invalidParamError", "message": "body.name should NOT be shorter than 1 characters"}}                    | 400    |       
      | AnotherWorkSpace   | test      | AnotherDescription | private          | {"error": {"name": "invalidParamError", "message": "body.visibilityStatus should be equal to one of the allowed values"}}   | 400    |       
      | AnotherWorkSpace   | test      | AnotherDescription | private          | {"error": {"name": "invalidParamError", "message": "body.visibilityStatus should be equal to one of the allowed values"}}   | 400    |       
      | AnotherWorkSpace   | test      | AnotherDescription | private          | {"error": {"name": "invalidParamError", "message": "body.visibilityStatus should be equal to one of the allowed values"}}   | 400    |       
      | AnotherWorkSpace   | test      | AnotherDescription | private          | {"error": {"name": "invalidParamError", "message": "body.visibilityStatus should be equal to one of the allowed values"}}   | 400    |       
           