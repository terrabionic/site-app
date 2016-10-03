require 'rails_helper'

describe "Editing replies" do

  def visit_survey_replies(survey)
    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Replies"
    end
  end

  it "updates a reply successfully with answers" do

    survey = FactoryGirl.create(:full_survey, questions_count: 1, replies_count: 1)

    first_possible_answer = survey.questions.first.possible_answers.first
    last_possible_answer = survey.questions.first.possible_answers.last

    first_possible_answer.update(title: 'Bad')
    last_possible_answer.update(title: 'Good')

    visit_survey_replies(survey)

    click_link "New Reply"

    expect(page).to have_content("New Reply")

    choose('Good')

    click_button "Create Reply"

    expect(page).to have_content "success"

    expect(survey.replies.last.answers.count).to eq(1)

    expect(survey.replies.count).to eq(2)

    first_answer =survey.replies.last.answers.first

    expect(first_answer.possible_answer_id).to eq(last_possible_answer.id)

    visit_survey_replies(survey)

    within "#reply_#{survey.replies.last.id}" do
      click_link "Edit"
    end

    choose('Bad')

    click_button "Update Reply"

    expect(page).to have_content("success")

    expect(survey.replies.last.answers.count).to eq(1)

    expect(survey.replies.count).to eq(2)

    first_answer =survey.replies.last.answers.first

    expect(first_answer.possible_answer_id).to eq(first_possible_answer.id)

  end

  it "redirects to survey replies by clicking the back button" do
    survey = FactoryGirl.create(:full_survey, questions_count: 1, replies_count: 1)

    first_possible_answer = survey.questions.first.possible_answers.first
    last_possible_answer = survey.questions.first.possible_answers.last

    first_possible_answer.update(title: 'Bad')
    last_possible_answer.update(title: 'Good')

    visit_survey_replies(survey)

    click_link "Edit"

    click_link "Back"

    expect(page).to have_content("Listing Replies")

  end

end
