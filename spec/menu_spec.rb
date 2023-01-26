require "menu"
require "dish"

describe Menu do
  context "when no items added" do
    it "returns an empty menu" do
      menu = Menu.new
      expect(menu.return).to eq []
    end
  end

  context "when multiple items added" do
    it "returns menu of items" do
      dish1 = Dish.new("salami", 10)
      dish2 = Dish.new("olives", 15)
      dish3 = Dish.new("bagel", 6)
      menu = Menu.new
      menu.add_food(dish1)
      menu.add_food(dish2)
      menu.add_food(dish3)
      expect(menu.return).to eq ["salami: 10", "olives: 15", "bagel: 6"]
    end
  end
end