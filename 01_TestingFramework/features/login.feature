Feature: User login to Insurance portal
	In order to get the insurance quote
	As a user of the website
	I want to be able to login to the portal

  Scenario: Successful login
    Given I visit SydneyTesters Life Insurance page
    When I fill email with "test@mailinator.com"
    And I fill password with "123456"
    And I click "Login"
    Then I should see a 'SUCCESS: You have logged in successfully' message
