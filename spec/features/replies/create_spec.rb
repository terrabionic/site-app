require 'rails_helper'

describe "Adding replies" do

  it "is successfully created with anwers" do
    survey = FactoryGirl.create(:full_survey, questions_count: 2, replies_count: 1)

    first_possible_answer = survey.questions.first.possible_answers.first
    last_possible_answer = survey.questions.last.possible_answers.last

    first_possible_answer.update(title: 'Bad')
    last_possible_answer.update(title: 'Good')

    visit_survey_replies(survey)

    click_link "New Reply"

    expect(page).to have_content("New Reply")

    choose('Good')
    choose('Bad')

    click_button "Create Reply"

    expect(page).to have_content "success"

    expect(survey.replies.count).to eq(2)

    expect(survey.replies.last.answers.count).to eq(2)

    first_answer =survey.replies.last.answers.first
    last_answer =survey.replies.last.answers.last

    expect(first_answer.possible_answer_id).to eq(first_possible_answer.id)
    expect(last_answer.possible_answer_id).to eq(last_possible_answer.id)

  end

end
