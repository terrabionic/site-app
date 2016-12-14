require 'rails_helper'

RSpec.describe "SurveyAnalyses", type: :request do
  describe "GET /survey_analyses" do
    it "works! (now write some real specs)" do
      get survey_analyses_path
      expect(response).to have_http_status(200)
    end
  end
end
