/// <reference types="cypress" />

const { When } = require("@badeball/cypress-cucumber-preprocessor");

When("I enter Payee Name {string}", (payeeName) => {
  cy.get("input[name='payee.name']").type(payeeName);
});

When("I enter Address {string}", (address) => {
  cy.get("input[name='payee.address.street']").type(address);
});

When("I enter City {string}", (city) => {
  cy.get("input[name='payee.address.city']").type(city);
});

When("I enter State {string}", (state) => {
  cy.get("input[name='payee.address.state']").type(state);
});

When("I enter Zip Code {string}", (zipCode) => {
  cy.get("input[name='payee.address.zipCode']").type(zipCode);
});

When("I enter Phone {string}", (phone) => {
  cy.get("input[name='payee.phoneNumber']").type(phone);
});

When("I enter Account {string}", (account) => {
  cy.get("input[name='payee.accountNumber']").type(account);
});

When("I enter Verify Account {string}", (account) => {
  cy.get("input[name='verifyAccount']").type(account);
});

When("I enter Amount {string}", (amount) => {
  cy.get("input[name='amount']").type(amount);

  // save payment amount
  // cy.get("input[name='amount']")
  //   .invoke("text")
  //   .then((text) => {
  //     cy.wrap(text.trim()).as("paymentAmount");
  //   });
});

When("I should see the transaction in account history", () => {
  cy.get("@fromAccountId").then((fromAccountId) => {
    cy.visit(
      `https://parabank.parasoft.com/parabank/activity.htm?id=${fromAccountId}`
    );

    cy.get("tbody").should("be.visible");
    cy.get("tbody").should("contain.text", fromAccountId);

    cy.get("@amount").then((amount) => {
      cy.log(`Transaction Amount: ${amount}`);
      cy.get("tbody").should("contain.text", amount);
    });
  });
});
