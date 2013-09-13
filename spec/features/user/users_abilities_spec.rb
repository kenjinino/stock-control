require 'spec_helper'

describe "Users abilities" do

  subject { page }
  context "when an admin is logged in" do
    let!(:delivery_role) { Role.create(name: "admin") }

    let!(:user) { FactoryGirl.create(:user, role: delivery_role) }

    before do
      login_as user
    end

    it "has permission to access new_user_invitation" do
      visit new_user_invitation_path
      current_path.should eq(new_user_invitation_path)
    end
  end

  context "when a delivery is logged in" do
    let!(:delivery_role) { Role.create(name: "delivery") }

    let!(:user) { FactoryGirl.create(:user, role: delivery_role) }

    before do
      login_as user
    end

    it "does not have permission to access new_user_invitation" do
      visit new_user_invitation_path
      current_path.should eq(orders_path)
      should have_content("Access denied.")
    end
  end
end
