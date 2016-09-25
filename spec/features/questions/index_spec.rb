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
    survey = FactoryGirl.create(:survey_with_questions)

    visit surveys_path

    click_link "Questions"

    expect(survey.questions.count).to eq(5)
    expect(page.all("tbody tr").size).to eq(5)
    expect(page).to have_content("Factory Question")
  end

end
