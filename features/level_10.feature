Feature: Manage User Accounts
  As an administrator
  I want to be able to create users for instructors
  So they can access the system when needed

  Background:
    Given a logged-in admin
    Given a large set of camps and instructors
    Given a set of families and students
    Given a set of registrations
  
  Scenario: An admin can add a user to an existing instructor
    When I go to edit Stafford's page
    And I fill in "instructor_user_attributes_username" with "sbrunk"
    And I fill in "instructor_user_attributes_password" with "secret" 
    And I fill in "instructor_user_attributes_password_confirmation" with "secret"
    And I select "Instructor" from "instructor_user_attributes_role"
    And I press "Update Instructor"
    Then I should see "Stafford Brunk was revised in the system"
    And I should see "Role"
    And I should see "instructor"
    And I should see "sbrunk"

  Scenario: An admin can edit an existing user
    When I go to edit Patrick's page
    And I fill in "instructor_user_attributes_username" with "pdust"
    And I fill in "instructor_user_attributes_password" with "nosecret" 
    And I fill in "instructor_user_attributes_password_confirmation" with "nosecret"
    And I select "Administrator" from "instructor_user_attributes_role"
    And I press "Update Instructor"
    Then I should see "Patrick Dustmann was revised in the system"
    And I should see "Role"
    And I should see "admin"
    And I should see "patrick"

  Scenario: A newly-created instructor can get a user at the same time
    When I go to the new instructor page
    And I fill in "instructor_first_name" with "Ed"
    And I fill in "instructor_last_name" with "Gruberman"
    And I fill in "instructor_phone" with "(412) 268-3228"
    And I fill in "instructor_email" with "gruberman@example.com"
    And I fill in "instructor_bio" with "A pretty poor player overall"
    And I fill in "instructor_user_attributes_username" with "gruberman"
    And I fill in "instructor_user_attributes_password" with "clueless" 
    And I fill in "instructor_user_attributes_password_confirmation" with "clueless"
    And I select "Instructor" from "instructor_user_attributes_role"
    And I press "Create Instructor"
    Then I should see "Ed Gruberman was added to the system"
    And I should see "Ed Gruberman"
    And I should see "Role"
    And I should see "instructor"
    And I should see "412-268-3228"
