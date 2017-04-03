require 'rails_helper'

RSpec.describe "NotificationManagers", type: :request do
  describe "GET /notification_managers" do
    it "works! (now write some real specs)" do
      get notification_managers_path
      expect(response).to have_http_status(200)
    end
  end
end
