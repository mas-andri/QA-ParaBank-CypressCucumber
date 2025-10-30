/// <reference types="cypress" />

import { Then, When } from "@badeball/cypress-cucumber-preprocessor";

When("I enter the transaction id {string}", (enteredId) => {
  if (enteredId.length > 0) {
    cy.get("#transactionId").type(enteredId);
    return;
  }
  cy.get("@transactionId").then((transId) => {
    cy.get("#transactionId").type(transId);
  });
});

When("I enter the transaction date {string}", (date) => {
  if (date.length > 0) {
    cy.get("#transactionDate").type(date);
    return;
  }
  cy.get("@transactionDate").then((transDate) => {
    cy.get("#transactionDate").type(transDate);
  });
});

When(
  "I enter a transaction date between {string} and {string}",
  (fromDate, toDate) => {
    cy.get("#fromDate").type(fromDate);
    cy.get("#toDate").type(toDate);
  }
);

When("I enter the transaction amount {string}", (enteredAmount) => {
  if (enteredAmount.length > 0) {
    cy.get("#amount").type(enteredAmount);
    return;
  }

  cy.get("@transactionAmount").then((amount) => {
    cy.get("#amount").type(amount.split("$").at(1));
  });
});

When("I click the find transactions button {string}", (buttonId) => {
  cy.get(buttonId).click();
});

Then("I should be redirected to the Find Transaction page", () => {
  cy.url().should("eq", "https://parabank.parasoft.com/parabank/findtrans.htm");
  cy.get("#formContainer > h1").should("contain.text", "Find Transactions");
});

Then("I should see the transaction details", () => {
  const transDetails = [
    "@transactionId",
    "@transactionDate",
    "@transactionDesc",
    "@transactionType",
    "@transactionAmount",
  ];

  cy.get("tbody")
    .invoke("text")
    .then((text) => {
      transDetails.forEach((item) => {
        cy.get(item).then((value) => {
          expect(text).to.include(value);
        });
      });
    });
});

Then("the transaction results list should appear", () => {
  cy.wait(1000);
  const transDetails = [
    "@transactionDate",
    "@transactionDesc",
    "@transactionAmount",
  ];

  cy.get("tbody")
    .invoke("text")
    .then((text) => {
      transDetails.forEach((item) => {
        cy.get(item).then((value) => {
          expect(text).to.contain(value);
        });
      });
    });
});

Then("I should see the error message {string}", (errMessage) => {
  cy.get(".error").should("be.visible").and("contain", errMessage);
});
