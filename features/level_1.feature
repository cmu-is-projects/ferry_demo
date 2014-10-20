Feature: Authentication
  As an admin
  I want to create and access an account on the system
  In order to manage the system
  
  Scenario: Login successful
    Given a valid admin
    When I go to the login page
    Then I should not see "Email"
    When I fill in "username" with "profh"
    And I fill in "password" with "secret"
    And I press "Log In"
    Then I should see "You are logged into the chess camp system"
    
  Scenario: Login failed because of wrong password
    Given a valid admin
    When I go to the login page
    Then I should not see "email"
    When I fill in "username" with "profh"
    And I fill in "password" with "foobar"
    And I press "Log In"
    Then I should see "Username or password is invalid"

  Scenario: Login failed because of nonexistant username
    Given a valid admin
    When I go to the login page
    And I fill in "username" with "drwho"
    And I fill in "password" with "secret"
    And I press "Log In"
    Then I should see "Username or password is invalid"