describe("Product Page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("Will add product to cart and increase the cart counter by one", () => {
    cy.get(".products article").first();
    cy.contains("Add").click({ force: true });

    cy.get(".navbar").contains("My Cart (1)");
  });
});
