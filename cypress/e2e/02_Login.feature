@Login
Feature: Para Bank - Login Feature Validation



  Background: Precondition
    Given I navigate to the ParaBank homepage

  Scenario: Register new account
    When I click on the Register button
    Then I should be on the Para Bank Register page
    And I enter first name "Patrick"
    And I enter last name "Star"
    And I enter address "123 Main Street"
    And I enter city "Austin"
    And I enter state "TX"
    And I enter zip code 70331
    And I enter phone number 5462635476
    And I enter SSN 123345567
    And I enter username "patrick000"
    And I enter password "@Patrick000"
    And I enter confirm password "@Patrick000"
    And I click register button
    Then I should see the relevant page and message "Your account was created successfully"

  Scenario Outline: <title>
    And I enter the username "<username>"
    And I enter the password "<password>"
    And I click the "Log In" button
    Then I should see the relevant page and message "<message>"

    Examples:
      | title                                        | username   | password    | message                                         |
      | TC-007 Verify login with valid credentials   | patrick000 | @Patrick000 | Welcome Patrick Star                            |
      | TC-008 Verify login with invalid credentials | XXXXXXX    | XXX123      | The username and password could not be verified |
      | TC-009 Verify login with blank username      |            | @Patrick000 | Please enter a username and password            |
      | TC-009 Verify login with blank password      | patrick000 |             | Please enter a username and password            |