require 'rails_helper'

RSpec.describe "Pagefeeds", type: :request do
  describe "GET /pagefeeds" do
    it "works! (now write some real specs)" do
      get pagefeeds_path
      expect(response).to have_http_status(200)
    end
  end
end
