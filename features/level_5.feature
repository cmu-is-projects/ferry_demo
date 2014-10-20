Feature: Manage camp instructor assignments
  As an administrator
  I want to be able to manage camp instructor assignments
  So I can be sure camps are staffed properly

  Background:
    Given a logged-in admin
    Given a large set of camps and instructors
  
  Scenario: Add an instructor to a camp
    When I go to edit camp1's page
    And I check "camp_instructor_ids_6"
    And I press "Update Camp"
    Then I should see "was revised in the system"
    And I should see "Patrick"
    And I should see "Alex"

  Scenario: Remove an instructor from a camp
    When I go to edit camp1's page
    And I uncheck "camp_instructor_ids_3"
    And I press "Update Camp"
    Then I should see "was revised in the system"
    And I should not see "Heimann, Alex"
    And I should see "Mark"

  Scenario: Remove all instructors from a camp
    When I go to edit camp1's page
    And I uncheck "camp_instructor_ids_3"
    And I uncheck "camp_instructor_ids_2"
    And I press "Update Camp"
    Then I should see "was revised in the system"
    And I should not see "Alex"
    And I should not see "Mark"

  Scenario: No option to add an instructor to a new camp
    When I go to the new camp page
    Then I should not see "Alex"
    And I should not see "Mark"
    And I should not see "Patrick"
    And I should not see "Mike"

  Scenario: No option to add an inactive instructor to a camp
    When I go to edit camp1's page
    Then I should see "Alex"
    And I should see "Mark"
    And I should see "Patrick"
    And I should not see "Rachel"

  Scenario: No option add an instructor to an inactive camp
    When I go to edit inactive camp's page
    Then I should not see "Alex"
    And I should not see "Mark"
    And I should not see "Patrick"
    And I should not see "Mike"
