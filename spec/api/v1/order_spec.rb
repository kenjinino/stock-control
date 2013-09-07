require "spec_helper"

describe "API order", :type => :api do

  let!(:user) { FactoryGirl.create(:user) }
  
  context "with orders on db" do
  
    let!(:order) { FactoryGirl.create(:order) }

    it "needs to show order_lines as well" do
      get "/api/orders/#{order.id}", nil, { "HTTP_AUTHORIZATION" => "Token token=\"#{user.authentication_token}\"" }
      order_id = order.id
      order = Order.includes(:order_lines).find(order_id)
      response.body.should eql(order.to_json(include: :order_lines))
    end
  end
end
