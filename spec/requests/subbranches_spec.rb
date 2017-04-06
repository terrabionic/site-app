require 'rails_helper'

RSpec.describe "Subbranches", type: :request do
  describe "GET /subbranches" do
    it "works! (now write some real specs)" do
      get subbranches_path
      expect(response).to have_http_status(200)
    end
  end
end
