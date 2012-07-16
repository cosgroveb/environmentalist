require 'spec_helper'

describe EnvironmentsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'

      response.should be_success
    end

    it "exposes a new environment" do
      get 'new'

      assigns(:environment).should be_new_record
    end
  end

  describe "PUT 'create'" do
    context "with valid parameters" do
      it "creates an environment" do
        post :create, :environment => {:name => "qa"}

        Environment.where(:name => "qa").first.should_not be_nil
      end

      it "redirects to environments index" do
        post :create, :environment => {:name => "staging"}

        response.should redirect_to(environments_url)
      end
    end
    context "with invalid parameters" do
      it "renders new" do
        post :create, :environment => {:name => nil}

        response.should render_template(:new)
      end
    end
  end

end
