Feature: Authorization
  As an administrator
  I want to be able to restrict authorization
  So only those who should have access actually do

  Background:
    Given a large set of camps and instructors
    Given a set of families and students
    Given a set of registrations
    Given a logged-in instructor
  
  Scenario: Patrick is able to update his own profile
    When I go to edit Patrick's page
    And I fill in "instructor_email" with "pdust@cmu.edu"
    And I fill in "instructor_user_attributes_password" with "secret" 
    And I fill in "instructor_user_attributes_password_confirmation" with "secret"
    And I press "Update Instructor"
    Then I should see "Patrick Dustmann was revised in the system"
    And I should see "pdust@cmu.edu"


  Scenario: Patrick is not able to update Mike's profile
    When I go to edit Mike's page
    Then I should see "You are not authorized to take this action"

  Scenario: Patrick is able to add or edit locations
    When I go to edit the North Side page
    Then I should see "You are not authorized to take this action"
    When I go to the new location page
    Then I should see "You are not authorized to take this action"

  Scenario: Patrick is able to add or edit curriculums
    When I go to edit the nimzo page
    Then I should see "You are not authorized to take this action"
    When I go to the new curriculum page
    Then I should see "You are not authorized to take this action"

  Scenario: Patrick is able to add or edit camps
    When I go to edit camp1's page
    Then I should see "You are not authorized to take this action"
    When I go to the new camp page
    Then I should see "You are not authorized to take this action"

  Scenario: Patrick is able to add or edit students
    When I go to edit Evan's page
    Then I should see "You are not authorized to take this action"
    When I go to the new student page
    Then I should see "You are not authorized to take this action"

  Scenario: Patrick is able to add or edit families
    When I go to edit Hanson's page
    Then I should see "You are not authorized to take this action"
    When I go to the new family page
    Then I should see "You are not authorized to take this action"

  Scenario: Patrick is not able to add instructors
    When I go to the new instructor page
    Then I should see "You are not authorized to take this action"

  Scenario: Patrick is able to see students in his camps
    When I go to the camp20 details page
    And I click on the link "Gazica, Josh" 
    Then I should see "Student Details"
    And I should see "Josh Gazica" 

  Scenario: Patrick is not able to see students not in his camps
    When I go to Gracie's page
    Then I should see "You are not authorized to take this action"

  