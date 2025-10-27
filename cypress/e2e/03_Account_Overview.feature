Feature: Para Bank - Account Overview

  Background: Precondition
    Given I open the ParaBank homepage
    And I log in with username "patrick999" and password "@Patrick999"
    And I click Account Overview link

  Scenario: TC-010, TC-011 Verify user can view all accounts after login
    Then I should redirected to Account Overview page

  Scenario: TC-012 Verify navigation to Account Details from Account Overview
    And I click the first account number
    Then I should be redirected to Account Details page

  Scenario: TC-013 Verify that account types (e.g., Checking, Savings) are displayed
    And I click the first account number
    Then I should see the account type

  Scenario: TC-013A Verify that the account number on the Overview page matches that in Account Details
    And I click the first account number
    Then I should see that the account number is correct

  Scenario: TC-014 Verify total balance displayed is accurate
    Then I should see that the total balance is correct