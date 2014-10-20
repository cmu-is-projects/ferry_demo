Feature: Manage curriculums
  As an administrator
  I want to be able to manage curriculum information
  So I can use curriculums to create camp options

  Background:
    Given a logged-in admin
    Given a large set of curriculums and camps
  
  # READ METHODS
  Scenario: View all curriculums
    When I go to the curriculums page
    Then I should see "Curriculums"
    And I should see "Name"
    And I should see "Ratings"
    And I should see "Times Used"
    And I should see "Mastering Chess Tactics"
    And I should see "3"
    And I should see "400 - 850"
    And I should see "Principles of Chess"
    And I should see "5"
    And I should see "Unrated - 500"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
    And I should not see "All about the basic principles of chess."
      
  Scenario: View curriculum details
    When I go to the principles details page
    Then I should see "Curriculum Details"
    And I should see "Principles of Chess"
    And I should see "All about the basic principles of chess."
    And I should see "Unrated - 500"
    And I should see "June 3, 2013"
    And I should see "June 10, 2013"
    And I should see "June 2, 2014"
    And I should see "June 16, 2014"
    And I should see "June 23, 2014"
    And I should not see "Mastering Chess Tactics"
    And I should not see "Forms"
    And I should not see "true"
    And I should not see "True"
  
  Scenario: The curriculum name is a link to details
    When I go to the curriculums page
    And I click on the link "Endgame Principles"
    And I should see "Curriculum Details"
    And I should see "Endgame Principles"
    And I should see "This camp is designed for any student who has mastered basic mating patterns and understands opening principles and is looking to improve his/her ability use chess tactics in game situations."
    And I should see "Ratings"
    And I should see "700 - 1500"
    And I should see "Active"
    And I should not see "Principles of Chess"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
        
  
  # CREATE METHODS
  Scenario: Creating a new curriculum is successful
    When I go to the new curriculum page
    And I fill in "curriculum_name" with "Benko Gambit"
    And I fill in "curriculum_description" with "A nice gambit to use against 1. d4"
    And I fill in "curriculum_min_rating" with "900"
    And I fill in "curriculum_max_rating" with "1900"
    And I press "Create Curriculum"
    Then I should see "Benko Gambit was added to the system"
    And I should see "Benko Gambit"
    And I should see "A nice gambit to use against 1. d4"
    And I should see "900 - 1900"
  
  Scenario: Creating a new curriculum fails without a name
    When I go to the new curriculum page
    And I press "Create Curriculum"
    Then I should see "can't be blank"
  
  Scenario: Creating a new curriculum fails without unique name
    When I go to the new curriculum page
    And I fill in "curriculum_name" with "endgame principles"
    And I press "Create Curriculum"
    Then I should see "has already been taken"
  
  
  # UPDATE METHODS
  Scenario: Updating an existing curriculum is successful
    When I go to edit the nimzo page
    And I fill in "curriculum_min_rating" with "1100"
    And I press "Update Curriculum"
    Then I should see "Nimzo-Indian Defense was revised in the system"
    And I should see "1100 - 3000"
  
