require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: "tests") 
      @category.save
    end

    it 'is valid with all attributes' do
      product = Product.new(name: "Laptop", price_cents: 1500, quantity: 4, category: @category)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = Product.new(name: nil, price_cents: 1500, quantity: 4, category: @category)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      product = Product.new(name: "Laptop", price_cents: nil, quantity: 4, category: @category)
      product.save
      expect(product.errors.full_messages).to include("Price cents can't be blank")
    end

    it 'is not valid without a quantity' do
      product = Product.new(name: "Laptop", price_cents: 1500, quantity: nil, category: @category)
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product = Product.new(name: "Laptop", price_cents: 1500, quantity: 4, category: nil)
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
