Feature: Para Bank - Logout

  Background: Precondition
    Given I open the ParaBank homepage
    When I log in with username "patrick999" and password "@Patrick999"


  Scenario: TC-044, Verify successful logout from application
    And I click the "Log Out" link
    Then I should redirected to login page

  Scenario: TC-045, Verify session ends after logout
    And I click the "Log Out" link
    And I click the Back button on the browser
    Then I should redirected to login page

  Scenario: TC-046, Verify that Logout button/link is visible after login
    Then I should see the logout button

  Scenario: TC-047, Verify user cannot access protected pages after logout
    And I click the "Log Out" link
    And I try to access restricted endpoint "https://parabank.parasoft.com/parabank/overview.htm"
    Then I should redirected to login page