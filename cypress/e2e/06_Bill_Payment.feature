Feature: Para Bank - Bill Payment

  Background: Precondition
    Given I open the ParaBank homepage
    When I log in with username "patrick999" and password "@Patrick999"
    And I click the "Log In" button
    And I click the "Accounts Overview" link
    And the system saves the first account number and balance
    And I click the "Bill Pay" link
    And I enter Payee Name "Internet Provider Inc"
    And I enter Address "456 Tech Park"
    And I enter City "Austin"
    And I enter State "TX"
    And I enter Zip Code "73301"
    And I enter Phone "5125552000"

  Scenario: TC-027, TC-028 - Verify transaction appears in payment history
    And I enter Account "555444333"
    And I enter Verify Account "555444333"
    And I enter Amount "67.89"
    And I select a valid from account
    And I click the "Send Payment" button
    Then I should see a message "Bill Payment Complete"
    And I should see the transaction in account history

  Scenario: TC-029, Verify payment amount reduces account balance
    And I enter Account "555444333"
    And I enter Verify Account "555444333"
    And I enter Amount "67.89"
    And I select a valid from account
    And I click the "Send Payment" button
    Then I should see a message "Bill Payment Complete"
    And I should see the account balance decrease by the payment amount

  Scenario: TC-030, Verify error message for missing mandatory fields
    And I enter Account "555444333"
    And I enter Verify Account "555444333"
    # Amount field intentionally left blank
    And I select a valid from account
    And I click the "Send Payment" button
    Then I should see a message "The amount cannot be empty"

  Scenario: TC-031, Verify error message for mismatched payee account number
    And I enter Account "555444333"
    And I enter Verify Account "555444111"
    And I enter Amount "89.99"
    And I select a valid from account
    And I click the "Send Payment" button
    Then I should see a message "The account numbers do not match"

