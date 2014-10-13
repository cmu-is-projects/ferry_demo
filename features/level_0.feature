Feature: Standard Business
  As a user
  I want to be able to view certain information
  So I can have confidence in the system
  
  Background:
  
  Scenario: Do not see the default rails page
    When I go to the home page
    Then I should not see "You're riding Ruby on Rails!"
    And I should not see "About your application's environment"
    And I should not see "Create your database" 
  
  Scenario: View 'About Us'
    When I go to the About Us page
    Then I should see "About" within "#main_content"
    And I should see "About" within "#footer"
  
  Scenario: View 'Contact Us'
    When I go to the Contact Us page
    Then I should see "Contact" within "#main_content"
    And I should see "Contact" within "#footer"
  
  Scenario: View 'Privacy Policy'
    When I go to the Privacy page
    Then I should see "Privacy" within "#main_content"
    And I should see "Privacy" within "#footer"
  
  Scenario: View webmaster information in footer
    When I go to the home page
    Then I should see "Webmaster" within "#footer"
