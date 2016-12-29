require 'rails_helper'

RSpec.describe "LoginManagers", type: :request do
  describe "GET /login_managers" do
    it "works! (now write some real specs)" do
      get login_managers_path
      expect(response).to have_http_status(200)
    end
  end
end
