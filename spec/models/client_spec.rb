require 'spec_helper'

describe Client do
  let!(:client) { FactoryGirl.create(:client) }

  subject { client }

  it { should be_valid }
  it { should respond_to :orders }

  describe "validations" do
    it "exceeding name length" do
      client.name = "a"* 256
      should_not be_valid
    end

    it "with blank name" do
      client.name = " "
      should_not be_valid
    end

    it "with nil name" do
      client.name = nil
      should_not be_valid
    end

    it "with blank address" do
      client.address = " "
      should_not be_valid
    end

    it "exceeding address length" do
      client.address = "a"* 256
      should_not be_valid
    end

    it "with nil address" do
      client.address = nil
      should_not be_valid
    end
  end
end
