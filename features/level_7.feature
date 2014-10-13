Feature: Manage families
  As an administrator
  I want to be able to manage family information
  So I can use this to later to create and register students

  Background:
    Given a logged-in admin
    Given a set of families and students
  
  # READ METHODS
  Scenario: View all families (paginated)
    When I go to the families page
    Then I should see "Families"
    And I should see "Family Name"
    And I should see "Parent"
    And I should see "Phone"
    And I should see "412-268-2323"
    And I should see "Daigle"
    And I should see "Elizabeth"
    And I should see "Beth"
    And I should see "Gazica"
    And I should see "Ellis"
    And I should not see "Carolyn"
    And I should not see "Wilson"
    And I should not see "Kristin"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
      
  Scenario: View family details
    When I go to the Hanson's page
    Then I should see "Family Details"
    And I should see "Hanson"
    And I should see "Melissa"
    And I should see "412-268-3259"
    And I should see "@example.com"
    And I should see "Hannah"
    And I should see "Sydney"
    And I should see "Yes"
    And I should not see "Daigle"
    And I should not see "4122683259"
    And I should not see "true"
    And I should not see "True"
  
  Scenario: The family name is a link to details
    When I go to the families page
    And I click on the link "Daigle"
    Then I should see "Family Details"
    And I should see "Daigle"
    And I should see "412-268-2323"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Dance"
    And I should not see "Beth"
        
  
  # CREATE METHODS
  Scenario: Creating a new family is successful
    When I go to the new family page
    And I fill in "family_family_name" with "Suresh"
    And I fill in "family_parent_first_name" with "Subra"
    And I fill in "family_phone" with "(412) 268-2000"
    And I fill in "family_email" with "suresh@example.com"
    And I press "Create Family"
    Then I should see "Suresh family was added to the system"
    And I should see "Family Details"
    And I should see "Suresh"
    And I should see "412-268-2000"
  
  Scenario: Creating a new family fails without a family_name
    When I go to the new family page
    And I fill in "family_parent_first_name" with "Subra"
    And I fill in "family_phone" with "(412) 268-2000"
    And I fill in "family_email" with "suresh@example.com"
    And I press "Create Family"
    Then I should see "can't be blank"

  
  
  # UPDATE METHODS
  Scenario: Updating an existing family is successful
    When I go to edit Hanson's page
    And I fill in "family_parent_first_name" with "Boyd"
    And I press "Update Family"
    Then I should see "Hanson family was revised in the system"
    And I should see "Boyd"
    And I should not see "Melissa"
  
