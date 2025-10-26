Feature: Para Bank - Account Overview

  # Scenario: Register new account
  #   Given I navigate to the Para Bank Homepage
  #   When I click on the Register button
  #   Then I should be on the Para Bank Register page
  #   And I enter first name "Patrick"
  #   And I enter last name "Star"
  #   And I enter address "123 Main Street"
  #   And I enter city "Austin"
  #   And I enter state "TX"
  #   And I enter zip code 70331
  #   And I enter phone number 5462635476
  #   And I enter SSN 123345567
  #   And I enter username "patrick000"
  #   And I enter password "@Patrick000"
  #   And I enter confirm password "@Patrick000"
  #   And I click register button
  #   Then I should see the relevant page and message "Your account was created successfully"

  Scenario: TC-010, TC-011 Verify user can view all accounts after login
    Given I navigate to the ParaBank homepage
    And I enter the username "patrick000"
    And I enter the password "@Patrick000"
    And I click the "Log In" button
    And I click Account Overview link
    Then I should redirected to Account Overview page

  Scenario: TC-012 Verify navigation to Account Details from Account Overview
    Given I navigate to the ParaBank homepage
    And I enter the username "patrick000"
    And I enter the password "@Patrick000"
    And I click the "Log In" button
    And I click Account Overview link
    And I click the first account number
    Then I should be redirected to Account Details page

  Scenario: TC-013 Verify that account types (e.g., Checking, Savings) are displayed
    Given I navigate to the ParaBank homepage
    And I enter the username "patrick000"
    And I enter the password "@Patrick000"
    And I click the "Log In" button
    And I click Account Overview link
    And I click the first account number
    Then I should see the account type

  Scenario: TC-013A Verify that the account number on the Overview page matches that in Account Details
    Given I navigate to the ParaBank homepage
    And I enter the username "patrick000"
    And I enter the password "@Patrick000"
    And I click the "Log In" button
    And I click Account Overview link
    And I click the first account number
    Then I should see that the account number is correct

  Scenario: TC-014 Verify total balance displayed is accurate
    Given I navigate to the ParaBank homepage
    And I enter the username "patrick000"
    And I enter the password "@Patrick000"
    And I click the "Log In" button
    And I click Account Overview link
    Then I should see that the total balance is correct