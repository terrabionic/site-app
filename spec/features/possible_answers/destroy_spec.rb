require 'rails_helper'

describe "Deleting Possible Answers" do

  let!(:survey) { FactoryGirl.create(:full_survey) }

  it "redirects to question possible answers page on susccess" do

    visit_survey_questions(survey)

    question = survey.questions.first

    visit_question_possible_answers(question)

    possible_answer = question.possible_answers.first

    within "#possible_answer_#{possible_answer.id}" do
      click_link "Destroy"
    end

    expect(page).to have_content "success"

    question = survey.questions.first

    expect(question.possible_answers.count).to eq(2)

  end
end
