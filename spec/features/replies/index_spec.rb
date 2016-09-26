require 'rails_helper'

describe "Viewing replies" do
  it "displays no items when survey has not been replied" do
    survey = FactoryGirl.create(:survey)

    visit surveys_path

    click_link "Replies"

    expect(page).to have_content("Listing Replies")

    expect(page).to have_content(survey.title)

    expect(survey.replies.count).to eq(0)

  end

  it "displays items when survey has been replied" do
    survey = FactoryGirl.create(:survey_with_replies, replies_count: 3)

    visit surveys_path

    click_link "Replies"

    expect(page).to have_content("Listing Replies")
    expect(page).to have_content(survey.title)
    expect(page).to have_content(survey.title)
    expect(survey.replies.count).to eq(3)
    expect(page.all("tbody tr").size).to eq(3)

  end

  it "redirects to surveys index by clicking the Back button" do
    survey = FactoryGirl.create(:survey_with_replies, replies_count: 3)

    visit surveys_path

    click_link "Replies"

    click_link "Back"

    expect(page).to have_content("Listing Surveys")

    expect(Survey.count).to eq(1)

  end

end
