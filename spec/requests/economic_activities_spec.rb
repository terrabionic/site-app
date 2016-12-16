require 'rails_helper'

RSpec.describe "EconomicActivities", type: :request do
  describe "GET /economic_activities" do
    it "works! (now write some real specs)" do
      get economic_activities_path
      expect(response).to have_http_status(200)
    end
  end
end
