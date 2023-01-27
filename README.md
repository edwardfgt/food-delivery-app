# food-delivery-app

# User Stories

    As a customer
    So that I can check if I want to order something
    I would like to see a list of dishes with prices.

    As a customer
    So that I can order the meal I want
    I would like to be able to select some number of several available dishes.

    As a customer
    So that I can verify that my order is correct
    I would like to see an itemised receipt with a grand total.

    Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

    As a customer
    So that I am reassured that my order will be delivered on time
    I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.


# Class Interface Design


```ruby

class App
def initizialise(menu, requester = Twilio::REST::Client)
#Creates a default menu
#requester is used to access Twilio API, but can be replaced with a double during testing
end

def view_menu
#puts all items on menu with price
end

def add_cart(dish)
#takes dish as input, adds to cart
end

def view_cart
#returns contents in cart

def check_out
#Return total receipt
#Calls send_sms
end

def send_sms
#calls api to send sms
end

class Menu
def initialize
end

def return #returns items in @menu
end

def add_to_cart(item) #returns item stylised to add to cart in App
end

def checkout(cart) #returns stylised receipt
end

def total(cart) #returns cart total value
end

def add_food(dish) #add a new instance of a Dish object to @menu
end


class Dish
def initialize(item, cost) #item is a string, cost is an integer
end

def cost  #returns cost
end


```

# Testing

## 1. Integration Tests


```ruby

    As a customer
    So that I can check if I want to order something
    I would like to see a list of dishes with prices.

    app = App.new
    app.view_menu # => {"Chicken wings" => 8, "Pasta" => 4}

    As a customer
    So that I can order the meal I want
    I would like to be able to select some number of several available dishes.

    As a customer
    So that I can verify that my order is correct
    I would like to see an itemised receipt with a grand total.
    
    app = App.new
    app.view_menu # => {"Chicken wings" => 8, "Pasta" => 4}
    app.add_cart("Chicken wings") 
    app.add_cart("Chicken wings") 
    app.checkout => "You ordered 2 chicken wings, total cost £16"

    app = App.new
    app.view_menu # => {"Chicken wings" => 8, "Pasta" => 4}
    steak = Dish.new("steak", 25)
    menu.add(steak)
    app.view_menu # => {"Chicken wings" => 8, "Pasta" => 4, "Steak" => 15}
    app.add_cart("Steak") 
    app.add_cart("Pasta") 
    app.checkout => "You ordered 1 steak - £25, 1 Pasta - £4. total = £29"


```
