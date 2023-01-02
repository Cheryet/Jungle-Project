require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests
    it "Should save a new product when all fields are present" do 
      @category = Category.new(name: "Bonsai Tree")
      @category.save!
      @product = Product.new(name: 'Maple Bonsai', price: 2500, quantity: 4, category: @category)
      @product.save!
      expect(@product.id).to be_present
    end

    it "should not save when the name field is empty" do
      @category = Category.new(name: "Bonsai Tree")
      @category.save!
      @product = Product.new(name: nil, price: 2500, quantity: 4, category: @category)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not save when the price field is empty" do 
      @category = Category.new(name: "Bonsai Tree")
      @category.save!
      @product = Product.new(name: 'Oak Bonsai', price_cents: nil, quantity: 4, category: @category)
      
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)

    end

    it "should not save when the quantity field is empty" do 
      @category = Category.new(name: "Bonsai Tree")
      @category.save!
      @product = Product.new(name: 'Oak Bonsai', price: 2500, quantity: nil, category: @category)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end


    it "should not sace when the category field is empty " do
      @product = Product.new(name: 'Oak Bonsai', price: 2500, quantity: nil, category: nil)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)

    end
  end
end
