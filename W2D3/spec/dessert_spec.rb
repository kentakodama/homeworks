require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:dessert) { Dessert.new('brownie', 40, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(40)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new('brownie', 'a lot', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to_not include('chocolate')
      dessert.add_ingredient('chocolate')
      expect(dessert.ingredients).to include('chocolate')
    end
  end

  describe "#mix!" do
    subject(:dessert) {Dessert.new('donut', 50, chef)}
    it "shuffles the ingredient array" do
      ingredients = ['flour', 'sprinkles', 'glaze']
      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end
      dessert.mix!

      expect(dessert.ingredients).to_not eq(ingredients)
    end

  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(20)
      expect(dessert.quantity).to eq(10)

    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(40)}.to raise_error('not enough food')
    end


  end

  describe "#serve" do

    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleized).and_return("Chef Tucker the Great Baker")
      expect(dessert.serve).to eq('Chef Tucker the Great Baker has made 100 brownies!')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      brownie.make_more
    end
  end
end
