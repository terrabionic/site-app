require "rails_helper"

RSpec.describe EconomicActivitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/economic_activities").to route_to("economic_activities#index")
    end

    it "routes to #new" do
      expect(:get => "/economic_activities/new").to route_to("economic_activities#new")
    end

    it "routes to #show" do
      expect(:get => "/economic_activities/1").to route_to("economic_activities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/economic_activities/1/edit").to route_to("economic_activities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/economic_activities").to route_to("economic_activities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/economic_activities/1").to route_to("economic_activities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/economic_activities/1").to route_to("economic_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/economic_activities/1").to route_to("economic_activities#destroy", :id => "1")
    end

  end
end
