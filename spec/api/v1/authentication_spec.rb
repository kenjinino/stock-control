require "spec_helper"

describe "API authentication", :type => :api do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:product) { FactoryGirl.create(:product) }

  it "with invalid token" do
    get "/api/products", nil, { "HTTP_AUTHORIZATION" => 'Token token="asdf"' }
    error = { :error => "Invalid parameters." }
    response.body.should eql(error.to_json)
    response.status.should eql(401)
  end

  it "with valid token" do
    get "/api/products", nil, { "HTTP_AUTHORIZATION" => "Token token=\"#{user.authentication_token}\"" }
    product.reload #difference on timestamp making test to fail
    response.body.should eql([product].to_json)
  end

  it "creates/returns authentication token" do
    post "/api/token/create", { email: user.email, password: user.password }
    response.body.should eql(user.to_json(only: [:id, :authentication_token]))
  end

  it "destroys authentication token" do
    delete "/api/token/destroy", nil, { "HTTP_AUTHORIZATION" => "Token token=\"#{user.authentication_token}\"" }
    message = { :message => "Authentication token deleted." }
    response.body.should eql(message.to_json)
    response.status.should eql(200)

    get "/api/products", nil, { "HTTP_AUTHORIZATION" => "Token token=\"#{user.authentication_token}\"" }
    error = { :error => "Invalid parameters." }
    response.body.should eql(error.to_json)
    response.status.should eql(401)

  end

end
