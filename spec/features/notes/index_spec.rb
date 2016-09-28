require 'rails_helper'

describe "Listing notes" do

  it "displays items when question is not empty" do
    question = FactoryGirl.create(:full_question)

    visit surveys_path

    within "#survey_#{question.survey.id}" do
      click_link "Questions"
    end

    click_link "Notes"

    expect(page).to have_content("Listing Notes")
    expect(page).to have_content("Factory Question")

    expect(page.all("tbody tr").size).to eq(3)
  end

  it "redirects to survey questions by clicking the Survey button" do
    question = FactoryGirl.create(:full_question)

    visit surveys_path

    within "#survey_#{question.survey.id}" do
      click_link "Questions"
    end

    click_link "Notes"

    expect(page).to have_content("Survey")
    click_link "Survey"
    expect(page).to have_content("Listing Questions")
    expect(page).to have_content("Factory Question")

  end

end
