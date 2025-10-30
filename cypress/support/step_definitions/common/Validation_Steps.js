/// <reference types="cypress" />

import { Then } from "@badeball/cypress-cucumber-preprocessor";

Then("I should see a message {string}", (message) => {
  cy.wait(1000);
  cy.xpath("//*[contains(@class, 'form2')] | //p | //h1").contains(message);
  // cy.contains(message);

  cy.get("#rightPanel").then(($el) => {
    if ($el.find("#newAccountId").length > 0) {
      cy.get("#newAccountId")
        .invoke("text")
        .then((text) => {
          cy.wrap(text.trim()).as("newAccountNumber");
        });
    } else if ($el.find("#billpayResult").length > 0) {
      cy.get("#payeeName")
        .invoke("text")
        .then((text) => {
          cy.wrap(text.trim()).as("payeeName");
        });

      cy.get("#fromAccountId")
        .invoke("text")
        .then((text) => {
          cy.wrap(text.trim()).as("fromAccountId");
        });

      cy.get("#amount")
        .invoke("text")
        .then((text) => {
          cy.wrap(text.trim().split("$").at(1)).as("amount");
        });
    } else {
      cy.log("No known result section found");
    }
  });
});
