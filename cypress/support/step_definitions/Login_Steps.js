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

When(
  "I log in with username {string} and password {string}",
  (username, password) => {
    cy.get('input[name="username"]').type(username);
    cy.get('input[name="password"]').type(password);
    cy.get('input[value="Log In"]').click();
  }
);

When("I click the {string} button", (btnName) => {
  cy.get(`input[value='${btnName}']`).click();
});
