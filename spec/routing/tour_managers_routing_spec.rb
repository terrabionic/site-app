require "rails_helper"

RSpec.describe TourManagersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tour_managers").to route_to("tour_managers#index")
    end

    it "routes to #new" do
      expect(:get => "/tour_managers/new").to route_to("tour_managers#new")
    end

    it "routes to #show" do
      expect(:get => "/tour_managers/1").to route_to("tour_managers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tour_managers/1/edit").to route_to("tour_managers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tour_managers").to route_to("tour_managers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tour_managers/1").to route_to("tour_managers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tour_managers/1").to route_to("tour_managers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tour_managers/1").to route_to("tour_managers#destroy", :id => "1")
    end

  end
end
