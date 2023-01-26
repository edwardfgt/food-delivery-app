require "app"

describe App do
  it "returns empty cart" do
    menu = double :menu
    app = App.new(menu)
    expect(app.view_cart).to eq []
  end 
end