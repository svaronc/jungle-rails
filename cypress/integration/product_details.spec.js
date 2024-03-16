describe("Home Page", () => {
  it("should visit the home page", () => {
    cy.visit("/");
  });
  it("there is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
