Feature: Para Bank - Find Transactions

  Background: Precondition
    Given I open the ParaBank homepage
    When I log in with username "patrick999" and password "@Patrick999"
    And I click the "Log In" button
    And I click the "Bill Pay" link
    And I enter Payee Name "Internet Provider Inc"
    And I enter Address "456 Tech Park"
    And I enter City "Austin"
    And I enter State "TX"
    And I enter Zip Code "73301"
    And I enter Phone "5125552000"
    And I enter Account "555444333"
    And I enter Verify Account "555444333"
    And I enter Amount "59.99"
    And I select a valid from account
    And I click the "Send Payment" button
    Then I should see a message "Bill Payment Complete"


  Scenario: TC-032, Verify user can access the Find Transaction page
    And I click the "Find Transactions" link
    Then I should be redirected to the Find Transaction page

  Scenario: TC-033, Verify user can search transaction details by Transaction ID
    And I click the "Accounts Overview" link
    And I click the first account number
    And I click the transaction name
    And I save the transaction details
    And I click the "Find Transactions" link
    And I enter the transaction id ""
    And I click the find transactions button "#findById"
    Then I should see the transaction details

  Scenario: TC-034, Verify user can search transaction by Date
    And I click the "Accounts Overview" link
    And I click the first account number
    And I click the transaction name
    And I save the transaction details
    And I click the "Find Transactions" link
    And I enter the transaction date ""
    And I click the find transactions button "#findByDate"
    Then the transaction results list should appear

  Scenario: TC-035, Verify user can search transactions between two valid dates
    And I click the "Accounts Overview" link
    And I click the first account number
    And I click the transaction name
    And I save the transaction details
    And I click the "Find Transactions" link
    And I enter a transaction date between "10-01-2025" and "10-31-2025"
    And I click the find transactions button "#findByDateRange"
    Then the transaction results list should appear

  Scenario: TC-036, Verify user can search transactions by Amount
    And I click the "Accounts Overview" link
    And I click the first account number
    And I click the transaction name
    And I save the transaction details
    And I click the "Find Transactions" link
    And I enter the transaction amount ""
    And I click the find transactions button "#findByAmount"
    Then the transaction results list should appear

  Scenario: TC-037, Verify search with non-existing transaction ID
    And I click the "Find Transactions" link
    And I enter the transaction id "111111"
    And I click the find transactions button "#findById"
    Then I should see a message "No transaction found"

  Scenario: TC-038, Verify search by date with empty date fields
    And I click the "Find Transactions" link
    And I click the find transactions button "#findByDate"
    Then I should see the error message "Invalid date format"

  Scenario: TC-039, Verify search by date with invalid date format
    And I click the "Find Transactions" link
    And I enter the transaction date "2025-10-01"
    And I click the find transactions button "#findByDate"
    Then I should see the error message "Invalid date format"

  Scenario: TC-040, Verify Find by Date Range, when From Date is after To Date
    And I click the "Find Transactions" link
    And I enter a transaction date between "10-31-2025" and "10-01-2025"
    And I click the find transactions button "#findByDateRange"
    Then I should see the error message "Invalid date range"

  # Scenario: TC-041, Verify Find by Amount with negative amount values
  #   And I click the "Find Transactions" link
  #   And I enter the transaction amount
  #   And I click the find transactions button "#findByAmount"
  #   Then I should see the transaction details

  Scenario: TC-042, Verify Find by Amount with non-numerical values
    And I click the "Find Transactions" link
    And I enter the transaction amount "abc"
    And I click the find transactions button "#findByAmount"
    Then I should see the error message "Invalid amount"

  Scenario: TC-043, Verify access to Find Transactions page without login
    And I click the "Log Out" link
    And I try to access restricted endpoint "https://parabank.parasoft.com/parabank/findtrans.htm"
    Then I should redirected to login page