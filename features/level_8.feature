Feature: Manage student
  As an administrator
  I want to be able to manage student information
  So I can use this to later to register them for camps

  Background:
    Given a logged-in admin
    Given a set of families and students
  
  # READ METHODS
  Scenario: View all students (paginated)
    When I go to the students page
    Then I should see "Students"
    And I should see "Name"
    And I should see "Age"
    And I should see "Rating"
    And I should see "Daigle, Gracie"
    And I should see "Gazica, Lauren"
    And I should see "1235"
    And I should see "Unrated"
    And I should see "16"
    And I should see "Regan, Ellen"
    And I should not see "Wilson"
    And I should not see "Teyah"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
      
  Scenario: View student details
    When I go to Gracie's page
    Then I should see "Student Details"
    And I should see "Gracie Daigle"
    And I should see "Age"
    And I should see "16"
    And I should see "04/04/1998"
    And I should see "1235"
    And I should see "Yes"
    And I should not see "Mary Kate"
    And I should not see "id"
    And I should not see "Id"
    And I should not see "ID"
    And I should not see "true"
    And I should not see "True"
  
  Scenario: The student name is a link to details
    When I go to the students page
    And I click on the link "Gazica, Lauren"
    Then I should see "Student Details"
    And I should see "Lauren Gazica"
    And I should see "Unrated"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Josh"
        
  
  # CREATE METHODS
  Scenario: Creating a new student is successful
    When I go to the new student page
    And I fill in "student_last_name" with "Suresh"
    And I fill in "student_first_name" with "Subra"
    And I select "Hanson" from "student_family_id"
    And I fill in "student_rating" with "2000"
    And I fill in "student_date_of_birth" with "05/01/2000"
    And I press "Create Student"
    Then I should see "Subra Suresh was added to the system"
    And I should see "Student Details"
    And I should see "2000"
  
  Scenario: Creating a new student fails without a first_name
    When I go to the new student page
    And I fill in "student_last_name" with "Suresh"
    And I select "Hanson" from "student_family_id"
    And I fill in "student_rating" with "2000"
    And I fill in "student_date_of_birth" with "05/01/2000"
    And I press "Create Student"
    Then I should see "can't be blank"

  Scenario: Creating a new student without a rating works
    When I go to the new student page
    And I fill in "student_last_name" with "Suresh"
    And I fill in "student_first_name" with "Subra"
    And I select "Hanson" from "student_family_id"
    And I fill in "student_date_of_birth" with "05/01/2000"
    And I press "Create Student"
    Then I should see "Subra Suresh was added to the system"
    And I should see "Student Details"
    And I should see "Unrated"
  
  
  # UPDATE METHODS
  Scenario: Updating an existing student is successful
    When I go to edit Evan's page
    And I fill in "student_rating" with "1521"
    And I press "Update Student"
    Then I should see "Evan Schell was revised in the system"
    And I should see "1521"
    And I should not see "1503"
  
