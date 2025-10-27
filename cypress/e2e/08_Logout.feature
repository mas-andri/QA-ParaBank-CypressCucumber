# Feature: Para Bank - Logout

#   Scenario: TC-044, Verify successful logout from application
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Log Out" link
#     Then I should redirected to "Login" page

#   Scenario: TC-045, Verify session ends after logout
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Log Out" link
#     And I click the "back" button
#     Then I should redirected to "Login" page

#   Scenario: TC-046, Verify that Logout button/link is visible after login
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     Then I should see the logout button

#   Scenario: TC-047, Verify user cannot access protected pages after logout
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Log Out" link
#     And I try to access restricted endpoint " https://parabank.parasoft.com/parabank/overview.htm"
#     Then I should redirected to "Login" page