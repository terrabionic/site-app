require 'rails_helper'

describe "Viewing replies" do

  def visit_survey_replies(survey)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Replies"
    end

  end

  it "displays no items when survey has not been replied" do
    survey = FactoryGirl.create(:survey)

    visit_survey_replies(survey)

    expect(page).to have_content("Listing Replies")

    expect(page).to have_content(survey.title)

    expect(survey.replies.count).to eq(0)

  end

  it "displays items when survey has been replied" do
    survey = FactoryGirl.create(:full_survey, replies_count: 3)

    visit_survey_replies(survey)

    expect(page).to have_content("Listing Replies")
    expect(page).to have_content(survey.title)
    expect(survey.replies.count).to eq(3)
    expect(page.all("tbody tr").size).to eq(3)

  end

  it "redirects to surveys index by clicking the Back button" do
    survey = FactoryGirl.create(:full_survey, replies_count: 3)

    visit_survey_replies(survey)

    click_link "Back"

    expect(page).to have_content("Listing Surveys")

    expect(page.all("tbody tr").size).to eq(Survey.count)

  end

end
