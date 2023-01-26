# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

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

 if you push your Twilio API Key to a public Github repository, anyone will be able to see and use it. What are the security implications of that? How will you keep that information out of your repository?


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```ruby

class App
def initizialise()
  #Creates a default menu
end

def view_menu
#puts all items on menu with price
end

def add_cart(dish)
#takes dish as input, adds to cart hash
end

def check_out
#Adds up cart hash
end

def send_sms
end

class Menu
def initialize
  @menu = {"Chicken wings" => 8, "Pasta" => 4}
end

def add_food(dish) #add a new instance of a Dish object to @menu
end

def del_food(dish) #remove an instance of Dish object from @menu
end

class Dish
def initialize(item, cost) #item is a string, cost is an integer
end

def cost 
  #returns cost
end

class SMS
def initialize
end



```


## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

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

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
#To be written as coded


```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._