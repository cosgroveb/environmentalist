require 'spec_helper'

describe Environment do
  describe "name" do
    it "has a name" do
      environment = FactoryGirl.create(:environment, :name => "qa")

      environment.name.should == "qa"
    end
  end

  describe "validations" do
    it "must have a name" do
      environment = FactoryGirl.build(:environment, :name => nil)

      environment.should_not be_valid
      environment.errors[:name].should == ["can't be blank"]
    end
  end
end
