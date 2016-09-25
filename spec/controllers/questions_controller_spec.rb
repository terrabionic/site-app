require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      survey = Survey.create(title: "Survey Title")
      get :index, {:survey_id => survey.id}
      expect(response).to have_http_status(:success)
    end
  end

end
