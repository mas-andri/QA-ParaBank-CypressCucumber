/// <reference types="cypress" />

import { Then, When } from "@badeball/cypress-cucumber-preprocessor";

Then("I should be redirected to the Find Transaction page", () => {
  cy.url().should("eq", "https://parabank.parasoft.com/parabank/findtrans.htm");
  cy.get("#formContainer > h1").should("contain.text", "Open New Account");
});

When("I enter the transaction id", () => {});
