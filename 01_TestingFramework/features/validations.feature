Feature: Field validations for Age and Email



  Scenario Outline: Invalid Age
    Given I am on the SydneyTesters Life Insurance page
    When I submit my '<age>' with incorrect values 
    Then I should see an error message that the 'The age is required'

    Examples:
      |  invalid_age  |
      |  xy           |
      |  !!           |
      |  @bc          |
      |  ---          |
        
  Scenario Outline: Invalid Emails
    Given I am on the SydneyTesters Life Insurance page
    When I enter an invalid email '<invalid_email_address>'
    Then I should see an error message that the 'email is not valid'

    Examples:
      |  invalid_email_address |
      |  hans@gmail            |
      |  @gmail.com            |
      |  hans.com              |
      |  @                     |
      |  hans                  |
            
  Scenario Outline: Valid Emails
    Given I am on the SydneyTesters Life Insurance page
    When I enter an invalid email '<valid_email_address>'
    Then I should not see an error message that the 'email is not valid'

    Examples:
      |  valid_email_address   |
      |  hans@gmail.com        |
      |  hans.d@gmail.com.au   |