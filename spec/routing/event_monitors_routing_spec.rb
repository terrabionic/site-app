require "rails_helper"

RSpec.describe EventMonitorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_monitors").to route_to("event_monitors#index")
    end

    it "routes to #new" do
      expect(:get => "/event_monitors/new").to route_to("event_monitors#new")
    end

    it "routes to #show" do
      expect(:get => "/event_monitors/1").to route_to("event_monitors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_monitors/1/edit").to route_to("event_monitors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_monitors").to route_to("event_monitors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_monitors/1").to route_to("event_monitors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_monitors/1").to route_to("event_monitors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_monitors/1").to route_to("event_monitors#destroy", :id => "1")
    end

  end
end
