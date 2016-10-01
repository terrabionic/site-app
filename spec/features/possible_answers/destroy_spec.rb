require 'rails_helper'

describe "Deleting Possible Answers" do
  it "redirects to question possible answers page on susccess" do
    survey = FactoryGirl.create(:full_survey)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    question = survey.questions.first

    within "#question_#{question.id}" do
      click_link "Possible answers"
    end

    possible_answer = question.possible_answers.first

    within "#possible_answer_#{possible_answer.id}" do
      click_link "Destroy"
    end

    expect(page).to have_content "success"

    question = survey.questions.first

    expect(question.possible_answers.count).to eq(2)

  end
end
