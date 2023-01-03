describe("Product Page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("Will navigate to the product detail page when clicked", () => {
    cy.get(".products article").first().click();
    cy.get("div").contains("Void Fennel");
  });
});
