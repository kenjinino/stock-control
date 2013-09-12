require 'spec_helper'

describe Role do
  let!(:role) { FactoryGirl.create(:role) }

  subject { role }

  it { should respond_to :users }

  describe "validations" do
    it "with nil name" do
      role.name = nil
      should_not be_valid
    end

    it "with duplicate name" do
      role2 = Role.new(name: role.name)
      role2.should_not be_valid
    end

    it "with blank name" do
      role.name = " "
      should_not be_valid
    end
  end
end
