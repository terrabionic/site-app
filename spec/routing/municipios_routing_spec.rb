require "rails_helper"

RSpec.describe MunicipiosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/municipios").to route_to("municipios#index")
    end

    it "routes to #new" do
      expect(:get => "/municipios/new").to route_to("municipios#new")
    end

    it "routes to #show" do
      expect(:get => "/municipios/1").to route_to("municipios#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/municipios/1/edit").to route_to("municipios#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/municipios").to route_to("municipios#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/municipios/1").to route_to("municipios#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/municipios/1").to route_to("municipios#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/municipios/1").to route_to("municipios#destroy", :id => "1")
    end

  end
end
