# Feature: Para Bank - Find Transactions

#   Scenario: TC-032, Verify user can access the Find Transaction page
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     Then I should see the relevant page and message "Bill Payment Complete"

#   Scenario: TC-033, Verify user can search transaction details by Transaction ID
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     And I enter the transaction id
#     And I click the "Find Transaction" button
#     Then I should see the transaction details

#   Scenario: TC-034, Verify user can search transaction by Date
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     And I enter the transaction date
#     And I click the "Find Transaction" button
#     Then I should see the transaction details

#   Scenario: TC-035, Verify user can search transactions between two valid dates
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     And I enter the from date
#     And I enter the to date
#     And I click the "Find Transaction" button
#     Then I should see the transaction details

#   Scenario: TC-036, Verify user can search transactions by Amount
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     And I enter the amount
#     And I click the "Find Transaction" button
#     Then I should see the transaction details

#   Scenario: TC-037, Verify search with non-existing transaction ID
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     And I enter the transaction id
#     And I click the "Find Transaction" button
#     Then I should see the relevant page and message "No transaction found"

#   Scenario: TC-038, Verify search by date with empty date fields
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     # And I enter the transaction date
#     And I click the "Find Transaction" button
#     Then I should see the relevant page and message "No transaction found"

#   Scenario: TC-039, Verify search by date with invalid date format
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     And I enter the transaction date
#     And I click the "Find Transaction" button
#     Then I should see the relevant page and message "No transaction found"

#   Scenario: TC-040, Verify Find by Date Range, when From Date is after To Date
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     And I enter the from date
#     And I enter the to date
#     And I click the "Find Transaction" button
#     Then I should see the relevant page and message "No transaction found"

#   Scenario: TC-041, Verify Find by Amount with negative amount values
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     And I enter the amount
#     And I click the "Find Transaction" button
#     Then I should see the transaction details

#   Scenario: TC-042, Verify Find by Amount with non-numerical values
#     Given I navigate to the ParaBank homepage
#     When I enter the username "patrick000"
#     And I enter the password "@Patrick000"
#     And I click the "Log In" button
#     And I click "Fund Transactions" link
#     And I enter the amount
#     And I click the "Find Transaction" button
#     Then I should see the transaction details

#   Scenario: TC-043, Verify access to Find Transactions page without login
#     Given I navigate to the ParaBank homepage
#     And I send GET Request to url "https://parabank.parasoft.com/parabank/findtrans.htm"
#     Then I should redirected to "Login" page