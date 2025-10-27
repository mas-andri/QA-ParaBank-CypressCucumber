Feature: Para Bank - Open New Account

  Background:
    Given I open the ParaBank homepage
    And I log in with username "patrick999" and password "@Patrick999"
    And I click the "Open New Account" link

  Scenario: TC-015 - Verify Open New Account page loads successfully
    Then I should be redirected to the Open New Account page

  Scenario: TC-016,TC-18 - Verify user can open a new Checking Account successfully
    And I select account type "CHECKING"
    And I choose an existing account
    And I click the "Open New Account" button
    Then I should see a message "Congratulations, your account is now open"
    And I should see my new account number displayed

  Scenario: TC-017,TC-18 - Verify user can open a new Savings Account successfully
    And I select account type "SAVINGS"
    And I choose an existing account
    And I click the "Open New Account" button
    Then I should see a message "Account Opened!"
    And I should see my new account number displayed

  Scenario: TC-019, Verify user cannot open a new account if the funding account has insufficient balance
    And I select account type "CHECKING"
    And I choose an existing account
    And I click the "Open New Account" button
    Then I should see a message "Insufficient funds to open account"

  Scenario: TC-020, Verify user cannot access the "Open New Account" page without logging in
    And I click the "Log Out" link
    Then I attempt to access the Open New Account page directly
    And I should be redirected to the login page
