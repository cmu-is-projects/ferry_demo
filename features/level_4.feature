Feature: Manage camps
  As an administrator
  I want to be able to manage camps information
  So I can have camps students can register for

  Background:
    Given a logged-in admin
    Given a large set of camps and instructors
  
  # READ METHODS
  Scenario: View all camps (paginated)
    When I go to the camps page
    # Then show me the page
    Then I should see "Camps"
    And I should see "Name"
    And I should see "Start"
    And I should see "Time"
    And I should see "Mastering Chess Tactics"
    And I should see "Principles of Chess"
    And I should see "07/14/14"
    And I should see "06/02/14"
    And I should see "Morning"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
    And I should not see "2014-06-02"
    And I should not see "2014-07-14"
      
  Scenario: View camp details
    When I go to the camp1 details page
    Then I should see "Camp Details"
    And I should see "Mastering Chess Tactics"
    And I should see "$125.00"
    And I should see "07/14/14 - 07/18/14"
    And I should see "Morning"
    And I should see "Active"
    And I should see "Camp Instructors"
    And I should see "Heimann, Alex"
    And I should see "Heimann, Mark"
    And I should not see "Ferraco, Mike"
    And I should not see "Principles of Chess"
    And I should not see "Nimzo-Indian Defense"
    And I should not see "Endgame Principles"
    And I should not see "Patrick Dustmann"
    And I should not see "2014-07-14"
    And I should not see "true"
    And I should not see "True"
  
  Scenario: The camp name is a link to details
    When I go to the camps page
    And I click on the link "Advanced Tactics Training"
    And I should see "06/16/14 - 06/20/14"
    And I should see "Camp Instructors"
    And I should see "Brunk, Stafford"
    And I should see "Thomas, Ashton"
    And I should not see "Heimann, Alex"
    And I should not see "Heimann, Mark"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
        
  
  # CREATE METHODS
  Scenario: Creating a new camp is successful
    Given all other locations
    When I go to the new camp page
    And I select "Endgame Principles" from "camp_curriculum_id"
    And I fill in "camp_cost" with "175"
    And I fill in "camp_max_students" with "8"
    And I select "September" from "camp_start_date_2i"
    And I select "1" from "camp_start_date_3i"
    And I select "2014" from "camp_start_date_1i"
    And I select "September" from "camp_end_date_2i"
    And I select "5" from "camp_end_date_3i"
    And I select "2014" from "camp_end_date_1i"
    And I select "Morning" from "camp_time_slot"
    And I select "ACAC" from "camp_location_id"
    And I press "Create Camp"
    Then I should see "was added to the system"
    And I should see "Camp Details"
    And I should see "Endgame Principles"
    And I should see "$175.00"
    And I should see "09/01/14 - 09/05/14"
  
  Scenario: Creating a new camp fails without a curriculum
    When I go to the new camp page
    And I fill in "camp_cost" with "175"
    And I fill in "camp_max_students" with "8"
    And I select "September" from "camp_start_date_2i"
    And I select "1" from "camp_start_date_3i"
    And I select "2014" from "camp_start_date_1i"
    And I select "September" from "camp_end_date_2i"
    And I select "5" from "camp_end_date_3i"
    And I select "2014" from "camp_end_date_1i"
    And I select "Morning" from "camp_time_slot"
    And I select "North Side" from "camp_location_id"
    And I press "Create Camp"
    Then I should see "can't be blank"
  
  Scenario: Creating a new camp fails if end date is after start
    When I go to the new camp page
    And I fill in "camp_cost" with "175"
    And I fill in "camp_max_students" with "8"
    And I select "September" from "camp_start_date_2i"
    And I select "5" from "camp_start_date_3i"
    And I select "2014" from "camp_start_date_1i"
    And I select "September" from "camp_end_date_2i"
    And I select "1" from "camp_end_date_3i"
    And I select "2014" from "camp_end_date_1i"
    And I select "Morning" from "camp_time_slot"
    And I select "North Side" from "camp_location_id"
    And I press "Create Camp"
    Then I should see "must be on or after 2014-09-05"

  Scenario: Creating a new camp is successful if start and end on same day
    When I go to the new camp page
    And I select "Endgame Principles" from "camp_curriculum_id"
    And I fill in "camp_cost" with "175"
    And I fill in "camp_max_students" with "8"
    And I select "September" from "camp_start_date_2i"
    And I select "1" from "camp_start_date_3i"
    And I select "2014" from "camp_start_date_1i"
    And I select "September" from "camp_end_date_2i"
    And I select "1" from "camp_end_date_3i"
    And I select "2014" from "camp_end_date_1i"
    And I select "Morning" from "camp_time_slot"
    And I select "North Side" from "camp_location_id"
    And I press "Create Camp"
    Then I should see "was added to the system"
    And I should see "Camp Details"
    And I should see "Endgame Principles"
    And I should see "$175.00"
    And I should see "09/01/14"
  
  
  # UPDATE METHODS
  Scenario: Updating an existing camp is successful
    When I go to edit camp1's page
    And I fill in "camp_cost" with "185"
    And I press "Update Camp"
    Then I should see "was revised in the system"
    And I should see "$185.00"