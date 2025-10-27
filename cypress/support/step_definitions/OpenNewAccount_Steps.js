/// <reference types="cypress" />
import { Then, When } from "@badeball/cypress-cucumber-preprocessor";

When("I click the {string} link", (link) => {
  cy.contains("a", link).click();
});

When("I select account type {string}", (accountType) => {
  cy.get("#type").select(accountType);
});

When("I choose an existing account", () => {
  cy.get("#fromAccountId").select(0);
});

When("I should see my new account number displayed", () => {
  cy.visit("https://parabank.parasoft.com/parabank/overview.htm");
  cy.wait(2000);
  cy.get("@newAccountNumber").then((accountNumber) => {
    cy.get("tbody").should("contain.text", accountNumber);
  });
});

Then("I attempt to access the Open New Account page directly", () => {
  cy.visit("https://parabank.parasoft.com/parabank/openaccount.htm", {
    failOnStatusCode: false,
  });
});

Then("I should be redirected to the Open New Account page", () => {
  cy.url().should(
    "eq",
    "https://parabank.parasoft.com/parabank/openaccount.htm"
  );
  cy.get("#openAccountForm").should("contain.text", "Open New Account");
});

Then("I should see a message {string}", (message) => {
  cy.contains(message);
  cy.get("#newAccountId")
    .invoke("text")
    .then((text) => {
      cy.wrap(text.trim()).as("newAccountNumber");
    });
});

When("I should be redirected to the login page", () => {
  cy.get("#leftPanel").should("contain.text", "Customer Login");
});
