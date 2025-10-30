/// <reference types="cypress" />
import { When } from "@badeball/cypress-cucumber-preprocessor";

When(
  "I log in with username {string} and password {string}",
  (username, password) => {
    if (username.trim().length > 0) {
      cy.get('input[name="username"]').type(username);
    }
    if (password.trim().length > 0) {
      cy.get('input[name="password"]').type(password);
    }
    cy.log("Username or Password is empty!!!");
  }
);
