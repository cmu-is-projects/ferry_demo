Feature: View registrations
  As an administrator
  I want to be able to veiw registrations in a variety of ways
  So I can see critical information when I need it

  Background:
    Given a logged-in admin
    Given a large set of camps and instructors
    Given a set of families and students
    Given a set of registrations
  
  Scenario: View registrations from camp details
    When I go to the camp1 details page
    Then I should see "Name"
    And I should see "Rating"
    And I should see "Registrations (7)"
    And I should see "Martin, Alex"
    And I should see "Merritt, Dean"
    And I should see "Regan, Peter"
    And I should see "655"
    And I should see "842"

  Scenario: View registrations from students details
    When I go to Gracie's page
    And I should see "Nimzo-Indian Defense"
    And I should see "06/02/14"
    And I should see "Endgame Principles"
    And I should see "07/21/14"
    And I should not see "Principles of Chess"


