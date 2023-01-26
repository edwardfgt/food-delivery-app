require "dish"

describe Dish do
  it "returns the name of the dish" do
    dish = Dish.new("salad", 10)
    expect(dish.item).to eq "salad"
  end

  it "returns the cost of the dish" do
    dish = Dish.new("salad", 10)
    expect(dish.cost).to eq 10
  end
end