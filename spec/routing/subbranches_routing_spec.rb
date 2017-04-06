require "rails_helper"

RSpec.describe SubbranchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/subbranches").to route_to("subbranches#index")
    end

    it "routes to #new" do
      expect(:get => "/subbranches/new").to route_to("subbranches#new")
    end

    it "routes to #show" do
      expect(:get => "/subbranches/1").to route_to("subbranches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/subbranches/1/edit").to route_to("subbranches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/subbranches").to route_to("subbranches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/subbranches/1").to route_to("subbranches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/subbranches/1").to route_to("subbranches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/subbranches/1").to route_to("subbranches#destroy", :id => "1")
    end

  end
end
