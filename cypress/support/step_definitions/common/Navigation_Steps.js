/// <reference types="cypress" />

import { Given, When } from "@badeball/cypress-cucumber-preprocessor";

Given("I open the ParaBank homepage", () => {
  cy.visit("https://parabank.parasoft.com/parabank/index.htm");
});

When("I click the {string} link", (link) => {
  cy.contains("a", link).click();
});

When("I click the {string} button", (btnName) => {
  cy.xpath(
    `//input[(@type='button' or @type='submit') and @value='${btnName}']`
  ).click();
});

When("I try to access restricted endpoint {string}", (url) => {
  cy.visit(url, { failOnStatusCode: false });
});
