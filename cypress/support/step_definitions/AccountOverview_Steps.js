/// <reference types="cypress" />

import { Then, When } from "@badeball/cypress-cucumber-preprocessor";

When("the system saves the first account number and balance", () => {
  // save the firts account number
  cy.get("tbody tr:nth-child(1) td:nth-child(1)")
    .invoke("text")
    .then((text) => {
      cy.wrap(text.trim()).as("accountNumber");
    });

  // save the first account balance
  cy.get("tbody tr:nth-child(1) td:nth-child(2)")
    .invoke("text")
    .then((text) => {
      cy.wrap(text.trim().split("$").at(1)).as("accountBalance");
    });
});

When("I click the first account number", () => {
  cy.xpath("(//td)[1]/a").click();
});

When("I should see the account balance decrease by the payment amount", () => {
  cy.visit("https://parabank.parasoft.com/parabank/overview.htm");

  cy.get("@accountBalance").then((balance) => {
    cy.get("@amount").then((paymentAmount) => {
      const currentBalance = balance - paymentAmount;
      cy.get("tbody tr:nth-child(1) td:nth-child(2)").should(
        "have.text",
        `$${currentBalance}`
      );
    });
  });
});

When("I click the transaction name", (transactionName) => {
  cy.wait(1000);
  cy.get("@payeeName").then((name) => {
    cy.get("a").contains(name).click();
  });
  // cy.get("a", transactionName).click();
});

When("I save the transaction details", () => {
  // record the transaction id
  cy.get("tbody tr:nth-child(1) td:nth-child(2)")
    .invoke("text")
    .then((text) => {
      cy.wrap(text.trim()).as("transactionId");
    });

  // record the transaction date
  cy.get("tbody tr:nth-child(2) td:nth-child(2)")
    .invoke("text")
    .then((text) => {
      cy.wrap(text.trim()).as("transactionDate");
    });

  // record the transaction description
  cy.get("tbody tr:nth-child(3) td:nth-child(2)")
    .invoke("text")
    .then((text) => {
      cy.wrap(text.trim()).as("transactionDesc");
    });

  // record the transaction type
  cy.get("tbody tr:nth-child(4) td:nth-child(2)")
    .invoke("text")
    .then((text) => {
      cy.wrap(text.trim()).as("transactionType");
    });

  // record the transaction amount
  cy.get("tbody tr:nth-child(5) td:nth-child(2)")
    .invoke("text")
    .then((text) => {
      cy.wrap(text.trim()).as("transactionAmount");
    });
});

Then("I should redirected to Account Overview page", () => {
  cy.url().should("eq", "https://parabank.parasoft.com/parabank/overview.htm");

  cy.get("#showOverview").should("be.visible");
  cy.get("h1").contains("Accounts Overview");
});

Then("I should be redirected to Account Details page", () => {
  cy.get("@accountNumber").then((accountNumber) => {
    cy.url().should(
      "eq",
      `https://parabank.parasoft.com/parabank/activity.htm?id=${accountNumber}`
    );
  });

  cy.get("#accountDetails").should("be.visible");
  cy.get("#activityForm").should("be.visible");
});

Then("I should see the account type", () => {
  cy.get("#accountType")
    .invoke("text")
    .should((text) => {
      expect(text.trim()).to.be.oneOf(["CHECKING", "SAVING"]);
    });
});

Then("I should see that the account number is correct", () => {
  cy.wait(1000);
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
