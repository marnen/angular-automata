Feature: 1-dimensional automaton
  As a user
  I can enter and run a 1-dimensional automaton

  Scenario Outline:
    Given I am on the homepage
    When I select rule <rule>
    And I enter "010101" as the seed
    And I click "Go!"
    Then I should see "<output>" in the output

    Examples:
      | rule | output |
      | 0    | 000000 |
      | 255  | 111111 |
