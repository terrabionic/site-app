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

    visit_survey_questions(survey)

    survey.questions.first.possible_answers.first.update(grade: 10)

    expect(survey.questions.first.possible_answers.count).to eq(3)

    expect(survey.questions.first.possible_answers.minimum("grade")).to eq(5)

    expect(survey.questions.first.grade).to eq(10)

    expect(survey.questions.count).to eq(5)
    expect(page.all("tbody tr").size).to eq(5)
    expect(page).to have_content(survey.questions.first.title)
    expect(page).to have_content(survey.questions.last.title)
  end

  it "redirects to surveys index by clicking the Back button" do
    survey = FactoryGirl.create(:survey)

    visit_survey_questions(survey)

    expect(page).to have_content("Factory Survey")

    click_link "Back"

    expect(page).to have_content("Listing Surveys")

  end

end
