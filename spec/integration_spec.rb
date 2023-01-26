require "app"
require "dish"
require "menu"

describe "app menu integration test" do
  context "When app is initalised and menu is viewed with no items" do
    it "returns an empty menu" do
      menu = Menu.new
      app = App.new(menu)
      expect(app.view_menu).to eq []
    end

  context "When items have been added to the menu" do
    it "returns one item on the menu" do
      menu = Menu.new
      app = App.new(menu)
      dish1 = Dish.new("salami", 10)
      dish2 = Dish.new("olives", 15)
      menu.add_food(dish1)
      menu.add_food(dish2)
      expect(app.view_menu).to eq ["salami: 10", "olives: 15"]
    end

    it "adds item to cart" do
      menu = Menu.new
      app = App.new(menu)
      dish1 = Dish.new("salami", 10)
      dish2 = Dish.new("olives", 15)
      menu.add_food(dish1)
      menu.add_food(dish2)
      app.add_cart("salami")
      expect(app.view_cart).to eq [{:cost=>10, :item=>"salami"}]
    end

    it "adds multiple items to cart" do
      menu = Menu.new
      app = App.new(menu)
      dish1 = Dish.new("salami", 10)
      dish2 = Dish.new("olives", 15)
      menu.add_food(dish1)
      menu.add_food(dish2)
      app.add_cart("salami")
      app.add_cart("olives")
      expect(app.view_cart).to eq [{:cost=>10, :item=>"salami"}, {:cost=>15, :item=>"olives"}]
    end
  end

  it "returns itemised receipt when user checks out" do
    menu = Menu.new
    app = App.new(menu)
    dish1 = Dish.new("salami", 10)
    dish2 = Dish.new("olives", 15)
    menu.add_food(dish1)
    menu.add_food(dish2)
    app.add_cart("salami")
    app.add_cart("olives")
    expect(app.check_out).to eq ("1x salami £10\n1x olives £15\nTotal: £25")
  
  end
end



