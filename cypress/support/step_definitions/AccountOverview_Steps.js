/// <reference types="cypress" />

import { Then, When } from "@badeball/cypress-cucumber-preprocessor";

When("I click Account Overview link", () => {
  cy.get("a[href='overview.htm']").click();

  // save firts account number
  cy.get("tbody tr:nth-child(1) td:nth-child(1)")
    .invoke("text")
    .then((text) => {
      cy.wrap(text.trim()).as("accountNumber");
    });
});

When("I click the first account number", () => {
  cy.xpath("(//td)[1]/a").click();
});

Then("I should redirected to Account Overview page", () => {
  cy.get("h1").contains("Accounts Overview");
  cy.get("tbody tr:nth-child(1) td:nth-child(1)").should("be.visible");
});

Then("I should be redirected to Account Details page", () => {
  cy.get("h1").contains("Account Details");
  cy.get("h1").contains("Account Activity");
});

Then("I should see the account type", () => {
  cy.get("#accountType")
    .invoke("text")
    .should((text) => {
      expect(text.trim()).to.be.oneOf(["CHECKING", "SAVING"]);
    });
});

Then("I should see that the account number is correct", () => {
  cy.wait(2000);
  cy.get("@accountNumber").then((savedNumber) => {
    cy.get("#accountId")
      .invoke("text")
      .then((displayedNumber) => {
        expect(displayedNumber.trim()).to.equal(savedNumber);
      });
  });
});

Then("I should see that the total balance is correct", () => {
  let sum = 0;

  cy.get("tbody tr td:nth-child(2)")
    .not("tbody tr:last-child td:nth-child(2)")
    .each(($el) => {
      const text = $el.text().replace("$", "").trim();
      sum += parseFloat(text);
    })
    .then(() => {
      cy.get("tbody tr:last-child td:nth-child(2)")
        .invoke("text")
        .then((totalText) => {
          const total = parseFloat(totalText.replace("$", "").trim());

          expect(sum).to.eq(total);
        });
    });
});
