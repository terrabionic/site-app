require "rails_helper"

RSpec.describe LoginManagersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/login_managers").to route_to("login_managers#index")
    end

    it "routes to #new" do
      expect(:get => "/login_managers/new").to route_to("login_managers#new")
    end

    it "routes to #show" do
      expect(:get => "/login_managers/1").to route_to("login_managers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/login_managers/1/edit").to route_to("login_managers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/login_managers").to route_to("login_managers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/login_managers/1").to route_to("login_managers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/login_managers/1").to route_to("login_managers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/login_managers/1").to route_to("login_managers#destroy", :id => "1")
    end

  end
end
