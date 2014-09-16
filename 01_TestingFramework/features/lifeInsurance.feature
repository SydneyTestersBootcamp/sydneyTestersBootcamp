Feature: View Premium for Quote

  Scenario Outline: View correct premium for different combinations of age, gender, state etc
    Given I am on the SydneyTesters Life Insurance page
    When I submit my  details '<age>', '<gender>', '<state>' & '<occupation>' for a life insurance quote
    Then I should see the correct '<premium>' shown
    And when I purchase it with my credit card
    Then I should see a 'Payment Sucessful' message

    Examples:
      |  age |  gender  |  state             | occupation       |  premium  |
      |  23  |  male    |  New South Wales   | High Risk        |  $55.54   |
      |  75  |  male    |  Tasmania          | Very High Risk   |  $229.38  |
      |  100 |  female  |  Queensland        | Low Risk         |  $230.8   |
      |  18  |  female  |  Western Australia | High Risk        |  $51.73   |
