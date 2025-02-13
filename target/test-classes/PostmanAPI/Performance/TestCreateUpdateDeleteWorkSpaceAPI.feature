Feature: Workspace Management

Background:
  * url 'https://api.getpostman.com'
Scenario:Test the Create, Update, Get, and Delete workspace APIs with positive scenarios.

  #Create WorkSpace

  Given path '/workspaces/'
  And headers { 'x-api-key': 'PMAK-67a1fd6a1bd33e0001398b39-8f7df1a19b801ffe2ebdd25b9b6fc3bdfb' }
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
  * def wid = response.workspace.id
  * print 'Workspace ID:', wid
  And match response.workspace.name == 'karateWorkSpace'
 
# Get WorkSpace By Id

  * headers { 'x-api-key': 'PMAK-67a1fd6a1bd33e0001398b39-8f7df1a19b801ffe2ebdd25b9b6fc3bdfb' }
  Given path '/workspaces/' + wid
  When method get
  Then status 200
  And match response.workspace.id == wid
  And match response.workspace.name == 'karateWorkSpace'

  # Update WorkSpace By Id

  * headers { 'x-api-key': 'PMAK-67a1fd6a1bd33e0001398b39-8f7df1a19b801ffe2ebdd25b9b6fc3bdfb'}
  Given path '/workspaces/' + wid
  And request {     "workspace": { "name": "karateWorkSpaceUpdated","type": "personal","description": "Updated Description"     }  }
  When method put
  Then status 200
  And match response.workspace.id == wid
  And match response.workspace.name == 'karateWorkSpaceUpdated'

  #Delete WorkSpcae By Id

  * headers { 'x-api-key': 'PMAK-67a1fd6a1bd33e0001398b39-8f7df1a19b801ffe2ebdd25b9b6fc3bdfb'}
  Given path '/workspaces/' + wid
  When method delete
  Then status 200
  And match response.workspace.id == wid

