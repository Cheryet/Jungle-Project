describe("Home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("displays products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
});
