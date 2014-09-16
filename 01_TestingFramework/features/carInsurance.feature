Feature: View Premium for Quote
  
  Scenario Outline: View correct premium for different combinations of age, gender, state etc
    Given I am on the SydneyTesters Car Insurance page
    When I submit my  details '<age>', '<gender>', '<state>' & '<make>' for a car insurance quote
    Then I should see the correct '<premium>' shown
    And when I purchase it with my credit card
    Then I should see a 'Payment Sucessful' message

    Examples:
      |  age |  gender  |  state             | make             |  premium  |
      |  23  |  male    |  New South Wales   | BMW              |  $55.54   |
      |  70  |  female  |  Victoria          | Alfa Romeo       |  $137.51  |
      |  100 |  female  |  Queensland        | Audi             |  $230.8   |
      |  18  |  female  |  Western Australia | BMW              |  $51.73   |