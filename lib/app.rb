require_relative "./menu"
require_relative "./dish"
require "twilio-ruby"
require 'rubygems'
require_relative "../credentials"

class App
  def initialize(menu)
    @menu = menu
    @cart = []
    @account_sid = API_credentials::ACCOUNT_SID
    @auth_token = API_credentials::AUTH_TOKEN
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
    time = Time.now
    send_sms(time)
    return @menu.checkout(@cart)
  end
  
  def send_sms(current_time)
    eta = current_time + 19*60
    body = "Thank you! Your order was placed and will be delivered before #{eta.strftime("%I:%M")}"
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @client.messages.create(
      from: '+16064044821',
      to: '+447497163596',
      body: body
    )
    return body
  end
end

# menu = Menu.new
# app = App.new(menu)
# dish1 = Dish.new("salami", 10)
# dish2 = Dish.new("olives", 15)
# menu.add_food(dish1)
# menu.add_food(dish2)
# app.add_cart("salami")
# app.add_cart("olives")
# app.add_cart("salami")
# puts app.check_out
