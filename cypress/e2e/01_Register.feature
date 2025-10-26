@Registration
Feature: Para Bank - Register Feature Validation

  Background: Preconditions
    Given I navigate to the ParaBank homepage
    When I click on the Register button
    Then I should be on the Para Bank Register page

  Scenario Outline: <title>
    And I enter first name "<firstName>"
    And I enter last name "<lastName>"
    And I enter address "<address>"
    And I enter city "<city>"
    And I enter state "<state>"
    And I enter zip code <zipCode>
    And I enter phone number <phoneNumber>
    And I enter SSN <ssn>
    And I enter username "<username>"
    And I enter password "<password>"
    And I enter confirm password "<confirmPassword>"
    And I click register button
    Then I should see the relevant page and message "<message>"

    Examples:
      | title                                                                                     | firstName | lastName | address         | city   | state | zipCode | phoneNumber | ssn       | username   | password    | confirmPassword | message                                         |
      | TC-001 Verify successful registration with valid details                                  | Patrick   | Star     | 123 Main Street | Austin | TX    | 73301   | 5125551234  | 123456789 | patrick000 | @Patrick000 | @Patrick000     | Your account was created successfully           |
      | TC-002 Verify error message for missing mandatory fields                                  | Patrick   | Star     | 123 Main Street | Austin | TX    | 73301   | 5125551234  | 123456789 |            | @Patrick000 | @Patrick000     | Username is required                            |
      | TC-002 Verify error message for missing mandatory fields                                  |           | Star     | 123 Main Street | Austin | TX    | 73301   | 5125551234  | 123456789 | patrick000 | @Patrick000 | @Patrick000     | First name is required                          |
      | TC-002 Verify error message for missing mandatory fields                                  | Patrick   |          | 123 Main Street | Austin | TX    | 73301   | 5125551234  | 123456789 | patrick000 | @Patrick000 | @Patrick000     | Last name is required                           |
      | TC-003 Verify registration fails with an existing username                                | Patrick   | Star     | 123 Main Street | Austin | TX    | 73301   | 5125551234  | 123456789 | patrick000 | @Patrick000 | @Patrick000     | This username already exists                    |
      | TC-004 Verify that password and confirm password fields must match                        | Patrick   | Star     | 123 Main Street | Austin | TX    | 73301   | 5125551234  | 123456789 | patrick000 | @Patrick000 | #Patrick123     | Passwords did not match                         |
      | TC-005 Verify that registration is rejected if the password lacks alphanumeric characters | Patrick   | Star     | 123 Main Street | Austin | TX    | 73301   | 5125551234  | 123456789 | patrick001 | admin       | admin           | Password should contain alphanumeric characters |
      | TC-006 Verify that registration is rejected if the password has fewer than 6 characters   | Patrick   | Star     | 123 Main Street | Austin | TX    | 73301   | 5125551234  | 123456789 | patrick002 | abc45       | abc45           | Password must be at least 6 characters          |