require 'rails_helper'

describe "Editing surveys" do

  let!(:survey) { FactoryGirl.create(:survey) }

  def update_survey(options = {})
    options[:title] ||= "Title"

    fill_in "Title", with: options[:title]

    click_button "Update Survey"
  end

  it "updates a survey successfully with correct information" do

    visit edit_survey_path(survey)

    update_survey(title: "Have Changed")

    expect(page).to have_content("Have Changed")
  end

  it "displays error with empty title" do

    visit edit_survey_path(survey)

    update_survey(title: "")

    expect(page).to have_content("error")

  end
end
