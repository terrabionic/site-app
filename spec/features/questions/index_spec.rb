require 'rails_helper'

describe "Viewing questions" do

  it "displays no questions when survey is empty" do
    survey = FactoryGirl.create(:survey)

    visit surveys_path

    click_link "Questions"

    expect(page).to have_content("Factory Survey")
    expect(survey.questions.count).to eq(0)
    expect(page.all("tbody tr").size).to eq(0)
  end

  it "displays questions when a survey is not empty" do
    survey = FactoryGirl.create(:full_survey)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    expect(survey.questions.count).to eq(5)
    expect(page.all("tbody tr").size).to eq(5)
    expect(page).to have_content(survey.questions.first.title)
    expect(page).to have_content(survey.questions.last.title)
  end

  it "redirects to surveys index by clicking the Back button" do
    FactoryGirl.create(:survey)

    visit surveys_path

    click_link "Questions"

    expect(page).to have_content("Factory Survey")

    click_link "Back"

    expect(page).to have_content("Listing Surveys")

  end

end
