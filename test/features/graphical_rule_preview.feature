Feature: Graphical rule preview
  As a user
  I can see a graphical preview of the chosen rule
  So that I can visualize it more effectively than only by number

  Scenario Outline:
    Given I am on the homepage
    When I select rule <rule>
    Then I should see a graphical preview of rule <rule>

    Examples:
      | rule |
      | 36   |
      | 55   |
