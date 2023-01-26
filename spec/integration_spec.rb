require_relative "../lib/app"
require_relative "../lib/dish"
require_relative "../lib/menu"


describe "app menu integration test" do
  context "When app is initalised and menu is viewed with no items" do
    it "returns an empty menu" do
      menu = Menu.new
      app = App.new(menu)
      expect(app.view_menu).to eq []
    end
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
    client = double :fake1
    allow(client).to receive_message_chain(:messages, :create)
    app = App.new(menu, client)
    dish1 = Dish.new("salami", 10)
    dish2 = Dish.new("olives", 15)
    menu.add_food(dish1)
    menu.add_food(dish2)
    app.add_cart("salami")
    app.add_cart("olives")
    expect(app.check_out).to eq ("1x salami £10\n1x olives £15\nTotal: £25")
  end


  context "When the user has filled their cart" do
    it "will send an ETA text to the user once they checkout" do
      menu = Menu.new
      client = double :fake1
      app = App.new(menu, client)
      body = "Thank you! Your order was placed and will be delivered before 03:08"
      allow(client).to receive_message_chain(:messages, :create).and_return(body)
      time = Time.new(2023, 1, 26, 14, 49, 00)
      expect(app.send_sms(time)).to eq "Thank you! Your order was placed and will be delivered before 03:08"
    end
  end
end