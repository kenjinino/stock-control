require 'spec_helper'

describe Order do
  let!(:order) { FactoryGirl.create(:order) }

  subject { order }

  it { should be_valid }
  it { should respond_to :client }
  it { should respond_to :order_lines }
  it { should respond_to :products }

  describe "validations" do
  end
end
