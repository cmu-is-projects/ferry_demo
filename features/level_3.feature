Feature: Manage instructors
  As an administrator
  I want to be able to manage instructor information
  So I can use this to later assign instructors to camps

  Background:
    Given a logged-in admin
    Given a large set of camps and instructors
  
  # READ METHODS
  Scenario: View all instructors (paginated)
    When I go to the instructors page
    Then I should see "Instructors"
    And I should see "Name"
    And I should see "Phone"
    And I should see "Camps"
    And I should see "Heimann, Alex"
    And I should see "412-268-2323"
    And I should see "Bohn, Austin"
    And I should see "3"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
    And I should not see "Bio"
    And I should not see "bio"
    And I should not see "Vargo, Seth"
      
  Scenario: View instructor details
    When I go to Mike Ferraco details page
    Then I should see "Instructor Details"
    And I should see "Mike Ferraco"
    And I should see "A stupendous chess player as you have ever seen."
    And I should see "mike.ferraco@example.com"
    And I should see "Principles of Chess"
    And I should see "Positional Understanding"
    And I should not see "Endgame Principles"
    And I should not see "Nimzo-Indian Defense"
    And I should not see "Mastering Chess Tactics"
    And I should not see "Patrick Dustmann"
    And I should not see "Dustmann, Patrick"
    And I should not see "true"
    And I should not see "True"
  
  Scenario: The instructor name is a link to details
    When I go to the instructors page
    And I click on the link "Hahn, Nathan"
    And I should see "Nathan Hahn"
    And I should see "Upcoming Camps"
    And I should see "Positional Understanding"
    And I should see "nathan.hahn@example.com"
    And I should see "A stupendous chess player as you have ever seen."
    And I should see "Active"
    And I should not see "Principles of Chess"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
        
  
  # CREATE METHODS
  Scenario: Creating a new instructor is successful
    When I go to the new instructor page
    And I fill in "instructor_first_name" with "Ed"
    And I fill in "instructor_last_name" with "Gruberman"
    And I fill in "instructor_phone" with "(412) 268-3228"
    And I fill in "instructor_email" with "gruberman@example.com"
    And I fill in "instructor_bio" with "A pretty poor player overall"
    And I press "Create Instructor"
    Then I should see "Ed Gruberman was added to the system"
    And I should see "Ed Gruberman"
    And I should see "A pretty poor player overall"
    And I should see "412-268-3228"
  
  Scenario: Creating a new instructor fails without a phone
    When I go to the new instructor page
    And I fill in "instructor_first_name" with "Ed"
    And I fill in "instructor_last_name" with "Gruberman"
    And I fill in "instructor_email" with "gruberman@example.com"
    And I fill in "instructor_bio" with "A pretty poor player overall"
    And I press "Create Instructor"
    Then I should see "can't be blank"
  
  Scenario: Creating a new instructor fails without valid email
    When I go to the new instructor page
    And I fill in "instructor_first_name" with "Ed"
    And I fill in "instructor_last_name" with "Gruberman"
    And I fill in "instructor_phone" with "(412) 268-3228"
    And I fill in "instructor_email" with "gruberman"
    And I fill in "instructor_bio" with "A pretty poor player overall"
    And I press "Create Instructor"
    Then I should see "is not a valid format"
  
  
  # UPDATE METHODS
  Scenario: Updating an existing instructor is successful
    When I go to edit Patrick's page
    And I fill in "instructor_email" with "pdust@cmu.edu"
    And I fill in "instructor_user_attributes_password" with "secret" 
    And I fill in "instructor_user_attributes_password_confirmation" with "secret"
    And I press "Update Instructor"
    Then I should see "Patrick Dustmann was revised in the system"
    And I should see "pdust@cmu.edu"
  
