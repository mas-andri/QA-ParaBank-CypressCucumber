/// <reference types="cypress" />
import { When } from "@badeball/cypress-cucumber-preprocessor";

When("I enter the username {string}", (username) => {
  if (username.trim() === "") {
    cy.log("Username is empty, skipping step.");
    return;
  }
  cy.get("[name='username']").type(username);
});

When("I enter the password {string}", (password) => {
  if (password.trim() === "") {
    cy.log("Password is empty, skipping step.");
    return;
  }
  cy.get("[name='password']").type(password);
});

When("I click the {string} button", (btnName) => {
  cy.get(`[value='${btnName}']`).click();
});
