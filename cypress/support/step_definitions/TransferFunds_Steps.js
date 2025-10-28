/// <reference types="cypress" />

import { Then, When } from "@badeball/cypress-cucumber-preprocessor";

When("I enter transfer amount {string}", (amount) => {
  cy.wait(1000);
  cy.get("#amount").clear().type(amount);
});

When("I select a valid from account", () => {
  // cy.get("#fromAccountId").select(0);
  cy.get("#rightPanel").then(($el) => {
    if ($el.find("select[id='#fromAccountId']").length > 0) {
      // Element #fromAccountId exists
      cy.get("#fromAccountId").select(0);
    } else {
      // Element #fromAccountId does NOT exist, select using fallback selector
      cy.get("select[name='fromAccountId']").select(0);
    }
  });
  // cy.get("select[name='fromAccountId").select(0);
});

When("I select a valid to account", () => {
  cy.get("#toAccountId").select(1);
});

Then("I should see the updated balance in both accounts", () => {
  cy.get("a[href='overview.htm']").click();
});
