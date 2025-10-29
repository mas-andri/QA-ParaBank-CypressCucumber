/// <reference types="cypress" />

import { Then, When } from "@badeball/cypress-cucumber-preprocessor";

When("I click the Back button on the browser", () => {
  cy.go("back");
});

When("I try to access restricted endpoint {string}", (url) => {
  cy.visit(url, { failOnStatusCode: false });
});

Then("I should redirected to login page", () => {
  cy.url().should(
    "contain",
    "https://parabank.parasoft.com/parabank/index.htm"
  );

  cy.get("h2").should("have.text", "Customer Login");

  cy.get("#loginPanel").should("be.visible");
});

Then("I should see the logout button", () => {
  cy.get("a[href='logout.htm']")
    .should("be.visible")
    .and("have.text", "Log Out");
});
