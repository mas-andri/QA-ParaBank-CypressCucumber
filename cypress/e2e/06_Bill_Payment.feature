# Feature: Para Bank - Bill Payment

#   Scenario: TC-027, Verify successful bill payment with valid data
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Bill Pay" link
#     And I enter Payee Name
#     And I enter Address
#     And I enter City
#     And I enter State
#     And I enter Zip Code
#     And I enter Phone
#     And I enter Account
#     And I enter Verify Account
#     And I enter Amount
#     And I select from account
#     And I click the "Send Payment" button
#     Then I should see the relevant page and message "Bill Payment Complete"

#   Scenario: TC-028, Verify transaction appears in payment history
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Bill Pay" link
#     And I enter Payee Name
#     And I enter Address
#     And I enter City
#     And I enter State
#     And I enter Zip Code
#     And I enter Phone
#     And I enter Account
#     And I enter Verify Account
#     And I enter Amount
#     And I select from account
#     And I click the "Send Payment" button
#     Then I should see the relevant page and message "Bill Payment Complete"
#     And I should see the transaction in account history
#   # example url: https://parabank.parasoft.com/parabank/activity.htm?id=14454

#   Scenario: TC-029, Verify payment amount reduces account balance
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Bill Pay" link
#     And I enter Payee Name
#     And I enter Address
#     And I enter City
#     And I enter State
#     And I enter Zip Code
#     And I enter Phone
#     And I enter Account
#     And I enter Verify Account
#     And I enter Amount
#     And I select from account
#     And I click the "Send Payment" button
#     Then I should see the relevant page and message "Bill Payment Complete"
#     And I should see the Account balance decreases by payment amount

#   Scenario: TC-030, Verify error message for missing mandatory fields
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Bill Pay" link
#     And I enter Payee Name
#     And I enter Address
#     And I enter City
#     And I enter State
#     And I enter Zip Code
#     And I enter Phone
#     And I enter Account
#     And I enter Verify Account
#     # And I enter Amount
#     And I select from account
#     And I click the "Send Payment" button
#     Then I should see the relevant page and message "The amount cannot be empty"
#     And I should see the Account balance is not decreases by payment amount

#   Scenario: TC-031, Verify with a mismatched payee account number
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Bill Pay" link
#     And I enter Payee Name
#     And I enter Address
#     And I enter City
#     And I enter State
#     And I enter Zip Code
#     And I enter Phone
#     And I enter Account
#     # Enter incalid verify account
#     And I enter Verify Account
#     And I enter Amount
#     And I select from account
#     And I click the "Send Payment" button
#     Then I should see the relevant page and message "The account numbers do not match"
#     And I should see the Account balance is not decreases by payment amount