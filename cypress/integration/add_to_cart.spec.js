describe("Cart should change the count", () => {
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
    cy.contains(".btn", "Add").should("be.visible")
  });
  it("cart should change the counter when you click the add button", () => {
    cy.contains(".nav-link", "Cart").should("include.text", "My Cart (0)");
    cy.contains(".btn", "Add").should("be.visible").click();
    cy.contains(".nav-link", "Cart").should("include.text", "My Cart (1)");
  });
});
