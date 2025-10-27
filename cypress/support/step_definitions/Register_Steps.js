/// <reference types="cypress" />
import {
  Before,
  Given,
  Then,
  When,
} from "@badeball/cypress-cucumber-preprocessor";

// let cleanDatabase = false;

// Before({ tags: "@Registration or @Login" }, () => {
//   if (!cleanDatabase) {
//     cy.visit("https://parabank.parasoft.com/parabank/admin.htm");
//     // Clear Database
//     cy.get('button[value="CLEAN"]').click();
//     cleanDatabase = true;
//     // Select Data Access Mode
//     cy.get("input[value='restjson']").click();
//     // Set initial balance and minimum balance
//     cy.get("#initialBalance").clear().type("500.00");
//     cy.get("#minimumBalance").clear().type("100.00");
//     cy.get("input[value='Submit']").click();
//   }
// });

Given("I open the ParaBank homepage", () => {
  cy.visit("https://parabank.parasoft.com/parabank/index.htm");
});

When("I click on the Register button", () => {
  cy.get('a[href*="register"]').click();
});

Then("I should be on the Para Bank Register page", () => {
  cy.get("h1").contains("Signing up is easy!");
});

When("I enter first name {string}", (firstName) => {
  if (firstName.trim() === "") {
    cy.log("First name is empty, skipping step.");
    return;
  }
  cy.get("[name='customer.firstName']").type(firstName);
});

When("I enter last name {string}", (lastName) => {
  if (lastName.trim() === "") {
    cy.log("Last name is empty, skipping step.");
    return;
  }
  cy.get("[name='customer.lastName']").type(lastName);
});

When("I enter address {string}", (address) => {
  cy.get("[name='customer.address.street']").type(address);
});

When("I enter city {string}", (city) => {
  cy.get("[name='customer.address.city']").type(city);
});

When("I enter state {string}", (state) => {
  cy.get("[name='customer.address.state']").type(state);
});

When("I enter zip code {int}", (zipCode) => {
  cy.get("[name='customer.address.zipCode']").type(zipCode);
});

When("I enter phone number {int}", (phoneNumber) => {
  cy.get("[name='customer.phoneNumber']").type(phoneNumber);
});

When("I enter SSN {int}", (ssn) => {
  cy.get("[name='customer.ssn']").type(ssn);
});

When("I enter username {string}", (username) => {
  if (username.trim() === "") {
    cy.log("Username is empty, skipping step.");
    return;
  }
  cy.get("[name='customer.username']").type(username);
});

When("I enter password {string}", (password) => {
  if (password.trim() === "") {
    cy.log("Password is empty, skipping step.");
    return;
  }
  cy.get("[name='customer.password']").type(password);
});

When("I enter confirm password {string}", (confirmPassword) => {
  cy.get("[name='repeatedPassword']").type(confirmPassword);
});

When("I click register button", () => {
  cy.get("[value='Register']").click();
});

// Then("I should be redirected to dashboard page", () => {
//   cy.get("p").contains(
//     "Your account was created successfully. You are now logged in."
//   );
// });

Then("I should see the relevant page and message {string}", (message) => {
  cy.xpath("//*[contains(@class, 'form2')] | //p").contains(message);
});
