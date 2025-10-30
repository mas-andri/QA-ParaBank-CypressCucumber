/// <reference types="cypress" />
import { Then, When } from "@badeball/cypress-cucumber-preprocessor";

When("I select account type {string}", (accountType) => {
  cy.get("#type").select(accountType);
});

When("I choose an existing account", () => {
  cy.get("#fromAccountId").select(0);
});

When("I should see my new account number displayed", () => {
  cy.visit("https://parabank.parasoft.com/parabank/overview.htm");
  cy.wait(1000);

  cy.get("@newAccountNumber").then((accountNumber) => {
    cy.get("tbody").should("contain.text", accountNumber);
  });
});

Then("I should be redirected to the Open New Account page", () => {
  cy.url().should(
    "eq",
    "https://parabank.parasoft.com/parabank/openaccount.htm"
  );

  cy.get("#openAccountForm")
    .should("be.visible")
    .and("contain.text", "Open New Account");
});

When("I should be redirected to the login page", () => {
  cy.get("#leftPanel").should("contain.text", "Customer Login");
});
