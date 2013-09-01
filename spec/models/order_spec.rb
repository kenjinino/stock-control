require 'spec_helper'

describe Order do
  let!(:order) { FactoryGirl.create(:order) }
  let(:product) { FactoryGirl.create(:product) }

  subject { order }

  it { should be_valid }
  it { should respond_to :client }
  it { should respond_to :order_lines }
  it { should respond_to :products }

  describe "validations" do
    it "cannot have repeated products on same order" do
      order.order_lines.create(product: product, quantity: 1)
      order.order_lines.create(product: product, quantity: 2)

      should_not be_valid
    end
  end
end
