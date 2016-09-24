require 'rails_helper'

describe "Editing surveys" do
  it "updates a survey successfully with correct information" do
    survey = FactoryGirl.create(:survey)

    visit edit_survey_path(survey)

    fill_in "Title", with: "Have Changed"

    click_button "Update Survey"

    expect(page).to have_content("Have Changed")
  end

  it "displays error with empty title" do
    survey = FactoryGirl.create(:survey)

    visit edit_survey_path(survey)

    fill_in "Title", with: ""

    click_button "Update Survey"

    expect(page).to have_content("error")

  end
end
