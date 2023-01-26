require "app"

describe App do
  it "returns empty cart" do
    menu = double :menu
    app = App.new(menu)
    expect(app.view_cart).to eq []
  end 

  context "When the user has filled their cart" do
    it "will send an ETA text to the user once they checkout" do
      menu = double :menu
      app = App.new(menu)
      time = Time.new(2023, 1, 26, 14, 49, 00)
      expect(app.send_sms(time)).to eq "Thank you! Your order was placed and will be delivered before 03:08"
    end
  end
end