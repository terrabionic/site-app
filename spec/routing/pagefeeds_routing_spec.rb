require "rails_helper"

RSpec.describe PagefeedsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pagefeeds").to route_to("pagefeeds#index")
    end

    it "routes to #new" do
      expect(:get => "/pagefeeds/new").to route_to("pagefeeds#new")
    end

    it "routes to #show" do
      expect(:get => "/pagefeeds/1").to route_to("pagefeeds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pagefeeds/1/edit").to route_to("pagefeeds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pagefeeds").to route_to("pagefeeds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pagefeeds/1").to route_to("pagefeeds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pagefeeds/1").to route_to("pagefeeds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pagefeeds/1").to route_to("pagefeeds#destroy", :id => "1")
    end

  end
end
