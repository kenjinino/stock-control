require 'spec_helper'

describe User do

  let!(:admin_role) { Role.create(name: "admin") }
  let!(:delivery_role) { Role.create(name: "delivery") }
  
  let!(:user) { FactoryGirl.create(:user) }

  subject { user }

  it { should be_valid }
  it { should respond_to :role }

  describe "default values" do
    it "with delivery role" do
      default = User.create(email: "email@email.com", password: "asdf1234", password_confirmation: "asdf1234")
      default.role.should == Role.find_by(name: :delivery)
    end
  end
end
