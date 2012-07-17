require 'spec_helper'

describe Environment do
  describe "as_json" do
    it "has id, name, reserved_by, and updated_at" do
      environment = FactoryGirl.create(:environment, :name => "qa")

      environment.as_json.should have_key(:id)
      environment.as_json.should have_key(:name)
      environment.as_json.should have_key(:reserved_by)
      environment.as_json.should have_key(:updated_at)
    end
  end

  describe "name" do
    it "has a name" do
      environment = FactoryGirl.create(:environment, :name => "qa")

      environment.name.should == "qa"
    end
  end

  describe "validations" do
    context "on create" do
      it "must have a name" do
        environment = FactoryGirl.build(:environment, :name => nil)

        environment.should_not be_valid
        environment.errors[:name].should == ["can't be blank"]
      end
    end
  end
end
