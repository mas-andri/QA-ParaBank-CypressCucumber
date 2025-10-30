# Feature: Para Bank - Transfer Funds

#   Scenario: TC-021, Verify successful fund transfer between accounts
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Transfer Funds" link
#     And I enter transfer amount "100"
#     And I select from account
#     And I select to account
#     And I click the "Transfer" button
#     Then I should see the relevant page and message "Transfer Complete!"

#   Scenario: TC-022, Verify balance updates correctly after transfer
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Transfer Funds" link
#     And I enter transfer amount "100"
#     And I select from account
#     And I select to account
#     And I click the "Transfer" button
#     Then I should see the relevant page and message "Transfer Complete!"
#     And The balance should be updated exmaple


#   Scenario: TC-023, Verify transfer history logs successful transaction
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Transfer Funds" link
#     And I enter transfer amount "100"
#     And I select from account
#     And I select to account
#     And I click the "Transfer" button
#     Then I should see the relevant page and message "Transfer Complete!"
#     And I should see the tranction history
#   # example url: https://parabank.parasoft.com/parabank/activity.htm?id=14454

#   Scenario: TC-024, Verify the error message shown when transferring between the same accounts
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Transfer Funds" link
#     And I enter transfer amount "100"
#     And I select from account
#     And I select to account
#     And I click the "Transfer" button
#     Then I should see the relevant page and message "Transfer was rejected"

#   Scenario: TC-025, Verify the error message when transferring with an invalid amount
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Transfer Funds" link
#     And I enter transfer amount "-100"
#     And I select from account
#     And I select to account
#     And I click the "Transfer" button
#     Then I should see the relevant page and message "Transfer was rejected"

#   Scenario: TC-026, Verify the error message when transferring using non-numerical data
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Transfer Funds" link
#     And I enter transfer amount "abc"
#     And I select from account
#     And I select to account
#     And I click the "Transfer" button
#     Then I should see the relevant page and message "Transfer was rejected"

@TransferFunds
Feature: Para Bank - Transfer Funds

  Background:
    Given I open the ParaBank homepage
    And I log in with username "patrick999" and password "@Patrick999"
    And I click the "Log In" button
    And I click the "Transfer Funds" link

  Scenario: TC-021, Verify successful fund transfer between accounts
    When I enter transfer amount "100"
    And I select a valid from account
    And I select a valid to account
    And I click the "Transfer" button
    Then I should see a message "Transfer Complete!"

# Scenario: TC-022, Verify balance updates correctly after transfer
#   When I enter transfer amount "100"
#   And I select a valid from account
#   And I select a valid to account
#   And I click the "Transfer" button
#   Then I should see the updated balance in both accounts



