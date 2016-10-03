require 'rails_helper'

describe "Viewing possible answers" do

  let!(:survey) { FactoryGirl.create(:full_survey, questions_count: 2) }

  def visit_survey_questions(survey)
    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end
  end

  def visit_question_possible_answers(question)
    within "#question_#{question.id}" do
      click_link "Possible answers"
    end
  end

  it "displays question's possible answers" do

    visit_survey_questions(survey)

    question = survey.questions.first

    visit_question_possible_answers(question)

    expect(page).to have_content("Listing Possible answers")

    expect(question.possible_answers.count).to eq(3)

  end

  it "redirects to survey questions by clicking the back button" do

    visit_survey_questions(survey)

    question = survey.questions.first

    visit_question_possible_answers(question)

    click_link "Back"

    expect(page).to have_content("Listing Questions")
    expect(page).to have_content(survey.title)

  end

end
