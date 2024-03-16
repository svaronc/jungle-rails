describe("Product detail page", () => {
  it("should visit the home page", () => {
    cy.visit("/");
  });
  it("there is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("should click on the first product", () => {
    cy.get(".products article:first-child a").click();
  });
  it("should check if the 'Add' button is present", () => {
    cy.get(".btn").should("be.visible");
  });
});
