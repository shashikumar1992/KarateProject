Feature: Collections Management

Background: 
    * url apiURL
    * def CollectionRequest = read('classpath:helpers/JSON/CollectionRequestData.json')
    * def DataGenerator = Java.type('helpers.DataGenerator')
    * set CollectionRequest.collection.info.name = DataGenerator.getRandomArticleValues().name
    
Scenario: Test create, get, update, and delete the Collection with a positive scenario.

    # Create Collection 
    Given path '/collections/'
    And headers { 'x-api-key': '#(apiKey)' }
    And request CollectionRequest
    When method post
    Then status 200


    * def collectionID = response.collection.id
    * print collectionID

    # Get Collection By Id 
    Given path '/collections/' + collectionID
    And headers { 'x-api-key': '#(apiKey)' }
    When method get 
    Then status 200


    # Delete Collection By Id
    Given path '/collections/' + collectionID
    And headers { 'x-api-key': '#(apiKey)' }
    When method delete
    Then status 200

