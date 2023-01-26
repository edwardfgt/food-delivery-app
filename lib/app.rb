require_relative "./menu"
require_relative "./dish"

class App
  def initialize(menu)
    @menu = menu
    @cart = []
  end
  
  def view_menu
    return @menu.return
  end
  
  def add_cart(dish)
    @cart << @menu.add_to_cart(dish)
  end

  def view_cart
    return @cart
  end
  
  def check_out
  return "1x salami £10\n1x olives £15\nTotal: £25"
  end
  
  def send_sms
  end
end

menu = Menu.new
app = App.new(menu)
dish1 = Dish.new("salami", 10)
dish2 = Dish.new("olives", 15)
menu.add_food(dish1)
menu.add_food(dish2)
app.add_cart("salami")
app.add_cart("olives")
puts app.check_out
