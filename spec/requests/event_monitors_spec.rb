require 'rails_helper'

RSpec.describe "EventMonitors", type: :request do
  describe "GET /event_monitors" do
    it "works! (now write some real specs)" do
      get event_monitors_path
      expect(response).to have_http_status(200)
    end
  end
end
