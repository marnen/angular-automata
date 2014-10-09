Feature: 1-dimensional automaton
  As a user
  I can enter and run a 1-dimensional automaton

  Background:
    Given I am on the homepage

  Scenario Outline: Run for 1 generation
    When I select rule <rule>
    And I enter "010101" as the seed
    And I click "Go!"
    Then I should see "<output>" in the output

    Examples:
      | rule | output        |
      | 0    | 010101,000000 |
      | 255  | 010101,111111 |

  Scenario: Run for multiple generations
    When I select rule 240
    And I enter "100000" as the seed
    And I enter 3 generations
    And I click "Go!"
    Then I should see "100000,010000,001000,000100" in the output
