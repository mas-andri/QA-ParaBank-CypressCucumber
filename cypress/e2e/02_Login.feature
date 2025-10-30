@Login
Feature: Para Bank - Login Feature Validation

  Background: Precondition
    Given I open the ParaBank homepage

  Scenario Outline: <title>
    When I log in with username "<username>" and password "<password>"
    And I click the "Log In" button
    Then I should see a message "<message>"

    Examples:
      | title                                        | username   | password    | message                                         |
      | TC-007 Verify login with valid credentials   | patrick999 | @Patrick999 | Welcome Patrick Star                            |
      | TC-008 Verify login with invalid credentials | XXXXXXX    | XXX123      | The username and password could not be verified |
      | TC-009 Verify login with blank username      |            | @Patrick999 | Please enter a username and password            |
      | TC-009 Verify login with blank password      | patrick999 |             | Please enter a username and password            |