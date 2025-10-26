# Feature: Para Bank - Open New Account

#   Scenario: TC-015, Verify that “Open New Account” page loads successfully
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click Open New Account link
#     Then I should redirected to Open New Account page

#   Scenario: TC-016, Verify user can open a new Checking Account successfully
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click the "Open New Account" link
#     And I select the account type "CHECKING"
#     And I choose the funding account
#     And I click "Open New Account"
#     Then I should see the success message "Congratulations, your account is now open"

#   Scenario: TC-017, Verify user can open a new Savings Account successfully
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click the "Open New Account" link
#     And I select the account type "SAVINGS"
#     And I choose the funding account
#     And I click "Open New Account"
#     Then I should see the success message "Congratulations, your account is now open"

#   Scenario: TC-018, Verify that new account appears in “Accounts Overview” after creation
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click the "Open New Account" link
#     And I select the account type "SAVINGS"
#     And I choose the funding account
#     And I click "Open New Account"
#     And I click "Accounts Overview"
#     Then I should see the new account

#   @Negative
#   Scenario: TC-019, Verify user cannot open a new account if the funding account has insufficient balance
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click the "Open New Account" link
#     And I select the account type "CHECKING"
#     And I choose a funding account with insufficient balance
#     And I click "Open New Account"
#     Then I should see an error message indicating insufficient funds
#     And the new account should not be created

#   Scenario: TC-020, Verify user cannot access the "Open New Account" page without logging in
#     Given I navigate to the ParaBank homepage
#     When I attempt to access the "Open New Account" page directly
#     Then I should be redirected to the login page