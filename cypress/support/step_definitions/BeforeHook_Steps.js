import { Before, BeforeAll } from "@badeball/cypress-cucumber-preprocessor";

BeforeAll(() => {
  cy.visit("https://parabank.parasoft.com/parabank/admin.htm");
  // Clear Database
  cy.get('button[value="CLEAN"]').click();

  // Select Data Access Mode
  cy.get("input[value='jdbc']").click();
  cy.get("#soapEndpoint").clear();
  cy.get("#restEndpoint").clear();
  cy.get("#endpoint").clear();

  // Set initial balance and minimum balance
  cy.get("#initialBalance").clear().type("500.00");
  cy.get("#minimumBalance").clear().type("200.00");
  cy.get("input[value='Submit']").click();
});

/* Refister New Account */
BeforeAll(() => {
  cy.visit("https://parabank.parasoft.com/parabank/register.htm");
  cy.get("[name='customer.firstName']").type("Patrick");
  cy.get("[name='customer.lastName']").type("Star");
  cy.get("[name='customer.address.street']").type("123, Main Street");
  cy.get("[name='customer.address.city']").type("Rock Bottom");
  cy.get("[name='customer.address.state']").type("Bikini Bottom");
  cy.get("[name='customer.address.zipCode']").type("123345");
  cy.get("[name='customer.phoneNumber']").type(33131231311);
  cy.get("[name='customer.ssn']").type(312312312);
  cy.get("[name='customer.username']").type("patrick999");
  cy.get("[name='customer.password']").type("@Patrick999");
  cy.get("[name='repeatedPassword']").type("@Patrick999");
  cy.get("[value='Register']").click();
  cy.get("a[href='logout.htm']").click();
});

Before({ tags: "@TransferFunds" }, () => {
  // Login
  cy.get('input[name="username"]').type("patrick999");
  cy.get('input[name="password"]').type("@Patrick999");
  cy.get('input[value="Log In"]').click();

  // Create New Account
  cy.contains("a", "Open New Account").click();
  cy.get("#type").select("CHECKING");
  cy.get("#fromAccountId").select(0);
  cy.get("input[value='Open New Account']").click();

  //logout
  cy.wait(1000);
  cy.get("a[href='logout.htm']").click();
});
