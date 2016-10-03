require 'rails_helper'

describe "Deleting questions" do

  def visit_survey_questions(survey)
    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

  end

  it "redirects to the questions index page on succes" do
    survey = FactoryGirl.create(:full_survey, questions_count: 1)

    visit_survey_questions(survey)

    expect(page).to have_content("Destroy")

    click_link "Destroy"

    expect(page).to_not have_content("successs")

  end
end
