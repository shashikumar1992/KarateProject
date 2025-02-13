
Feature: Work with Data base


Background:
  * def dataBaseConnect = Java.type('helpers.DataBaseConnection')
  * def DataGenerator = Java.type('helpers.DataGenerator')

 
Scenario: insert data into table
  * eval dataBaseConnect.insertCustomerDetails();
  

Scenario: get data from table consumer
  * def consumerName = dataBaseConnect.getCustomerDetails();
  * print consumerName.consumerName
