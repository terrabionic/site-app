require "rails_helper"

RSpec.describe SurveyAnalysesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/survey_analyses").to route_to("survey_analyses#index")
    end

    it "routes to #new" do
      expect(:get => "/survey_analyses/new").to route_to("survey_analyses#new")
    end

    it "routes to #show" do
      expect(:get => "/survey_analyses/1").to route_to("survey_analyses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/survey_analyses/1/edit").to route_to("survey_analyses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/survey_analyses").to route_to("survey_analyses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/survey_analyses/1").to route_to("survey_analyses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/survey_analyses/1").to route_to("survey_analyses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/survey_analyses/1").to route_to("survey_analyses#destroy", :id => "1")
    end

  end
end
