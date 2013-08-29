require 'spec_helper'

describe OrderLine do
  let!(:order_line) { FactoryGirl.create(:order_line) }

  subject { order_line }

  it { should be_valid }
  it { should respond_to :product }
  it { should respond_to :order }

  describe "validations" do
    it "with zero quantity" do
      order_line.quantity = 0
      should_not be_valid
    end
  end
end
