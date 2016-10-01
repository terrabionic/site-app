require 'rails_helper'

describe "Viewing possible answers" do

  it "displays question's possible answers" do
    survey = FactoryGirl.create(:full_survey, questions_count: 2)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    question = survey.questions.first

    within "#question_#{question.id}" do
      click_link "Possible answers"
    end

    expect(page).to have_content("Listing Possible answers")

    expect(question.possible_answers.count).to eq(3)

  end

  it "redirects to survey questions by clicking the back button" do
    survey = FactoryGirl.create(:full_survey, questions_count: 2)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    question = survey.questions.first

    within "#question_#{question.id}" do
      click_link "Possible answers"
    end

    click_link "Back"

    expect(page).to have_content("Listing Questions")
    expect(page).to have_content(survey.title)

  end

end
