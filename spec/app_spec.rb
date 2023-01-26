require "app"

describe App do
  it "returns empty cart" do
    menu = double :menu
    app = App.new(menu)
    expect(app.view_cart).to eq []
  end 

  context "When the user has filled their cart" do
    it "will send an ETA text to the user once they checkout" do
      client = double :fake1
      message = double :fake2
      body = "Thank you! Your order was placed and will be delivered before 03:08"
      allow(message).to receive(:create).with(from: '+16064044821', to: '+447497163596', body: body)
      allow(client).to receive(:messages).and_return(message)
     
      menu = double :menu
      app = App.new(menu, client)
      time = Time.new(2023, 1, 26, 14, 49, 00)

      expect(app.send_sms(time)).to eq "Thank you! Your order was placed and will be delivered before 03:08"
    end

    it "will send an ETA text to the user once they checkout MESSAGE CHAINING" do
      client = double :fake1
      body = "Thank you! Your order was placed and will be delivered before 03:08"
      #allow(message).to receive(:create).with(from: '+16064044821', to: '+447497163596', body: body)
      allow(client).to receive_message_chain(:messages, :create).and_return(body)
     
      menu = double :menu
      app = App.new(menu, client)
      time = Time.new(2023, 1, 26, 14, 49, 00)

      expect(app.send_sms(time)).to eq "Thank you! Your order was placed and will be delivered before 03:08"
    end
  end
end