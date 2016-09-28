require 'rails_helper'

describe "Deleting questions" do
  it "redirects to the questions index page on succes" do
    survey = FactoryGirl.create(:full_survey, questions_count: 1)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    expect(page).to have_content("Destroy")

    click_link "Destroy"

    expect(page).to_not have_content("successs")

  end
end
