require 'spec_helper'

describe Product do
  let!(:product) { FactoryGirl.create(:product) }

  subject { product }

  it { should be_valid }
  it { should respond_to :order_lines }
  it { should respond_to :orders }

  describe "validations" do
    it "exceeding name length" do
      product.name = "a"* 256
      should_not be_valid
    end

    it "with blank name" do
      product.name = " "
      should_not be_valid
    end

    it "with nil name" do
      product.name = nil
      should_not be_valid
    end

    it "with blank price" do
      product.price = " "
      should_not be_valid
    end

    it "with nil price" do
      product.price = nil
      should_not be_valid
    end

    it "with zero price" do
      product.price = 0.00
      should_not be_valid
    end

    it "with price characters" do
      product.price = "asdf"
      should_not be_valid
    end
  end
end
