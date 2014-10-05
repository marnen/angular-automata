Feature: 1-dimensional automaton
  As a user
  I can enter and run a 1-dimensional automaton

  Scenario:
    Given I am on the homepage
    When I select rule 0
    And I enter "010101" as the seed
    And I click "Go!"
    Then I should see "000000" in the output
