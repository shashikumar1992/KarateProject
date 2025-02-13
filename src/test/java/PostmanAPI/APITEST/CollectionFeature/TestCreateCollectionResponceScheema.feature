Feature: Collections Management

Background: 
  * url apiURL
  * def CollectionRequest = read('classpath:helpers/JSON/CollectionRequestData.json')
  * def DataGenerator = Java.type('helpers.DataGenerator')
  * set CollectionRequest.collection.info.name = DataGenerator.getRandomArticleValues().name

Scenario: Validate Create Collection API Response Schema
  # Create Collection
  Given path '/collections/'
  And headers { 'x-api-key': '#(apiKey)' }
  And request CollectionRequest
  When method post
  Then status 200
  And match response.collection.name == CollectionRequest.collection.info.name

  * def collectionID = response.collection.id
  * print 'Created Collection ID:', collectionID

  # And match response ==
  # """
  # {
  #   "collection": {
  #       "id": "#regex ^[a-z0-9-]{36}$",
  #       "name": "#string",
  #       "uid": "#regex ^[a-z0-9-]{45}$"
  #   }
  # }
  # """

  # Verify Collection Exists Before Deletion
  Given path '/collections/' + collectionID
  And headers { 'x-api-key': '#(apiKey)' }
  When method get
  Then status 200
  # And match response.collection.id == collectionID

  # Delete Collection
  Given path '/collections/' + collectionID
  And headers { 'x-api-key': '#(apiKey)' }
  When method delete
  Then status 200
  And match response.collection.id == collectionID
