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

  describe "GET 'index'" do
    it "exposes environments" do
      get 'index'

      response.should be_success
      assigns(:environments).should_not be_nil
    end

    it "renders json" do
      get :index, :format => :json

      response.header['Content-Type'].should include 'application/json'
    end
  end

  describe "GET 'show'" do
    it "redirects to environments" do
      environment = FactoryGirl.create(:environment)
      get 'show', :id => environment

      response.should redirect_to(environments_url)
    end

    it "responds to json" do
      environment = FactoryGirl.create(:environment)
      get 'show', :format => :json, :id => environment

      response.should be_success
      response.header['Content-Type'].should include 'application/json'
    end
  end

  describe "POST 'reserve'" do
    it "reserves an environment" do
      environment = FactoryGirl.create(:environment)
      reserved_by = Faker::Name.name
      post 'reserve', :id => environment, :environment => { :reserved_by => reserved_by }

      environment.reload.reserved_by.should == reserved_by
    end

    context "html" do
      it "redirects to environments" do
        environment = FactoryGirl.create(:environment)
        reserved_by = Faker::Name.name
        post 'reserve', :id => environment, :environment => { :reserved_by => reserved_by }

        response.should redirect_to(environments_url)
      end
    end

    context "json" do
      it "renders json" do
        environment = FactoryGirl.create(:environment)
        reserved_by = Faker::Name.name
        post 'reserve', :format => :json,  :id => environment, :environment => { :reserved_by => reserved_by }

        response.should be_success
        response.header['Content-Type'].should include 'application/json'
      end
    end
  end

  describe "POST 'release'" do
    it "releases an environment" do
      environment = FactoryGirl.create(:environment, :reserved_by => Faker::Name.name)
      post 'release', :id => environment

      environment.reload.reserved_by.should be_blank
    end

    context "html" do
      it "redirects to environments" do
        environment = FactoryGirl.create(:environment, :reserved_by => Faker::Name.name)
        post 'release', :id => environment

        response.should redirect_to(environments_url)
      end
    end

    context "json" do
      it "renders json" do
        environment = FactoryGirl.create(:environment, :reserved_by => Faker::Name.name)
        post 'release', :format => :json, :id => environment

        response.should be_success
        response.header['Content-Type'].should include 'application/json'
      end
    end
  end
end
