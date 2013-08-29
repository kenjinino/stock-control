require 'spec_helper'

describe Order do
  let!(:order) { FactoryGirl.create(:order) }

  subject { order }

  it { should be_valid }
  it { should respond_to :client }

  describe "validations" do
  end
end
