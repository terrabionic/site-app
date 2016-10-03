require 'rails_helper'

describe "Showing a reply" do

  let!(:survey) { FactoryGirl.create(:full_survey, questions_count: 2, replies_count: 1) }

  def visit_show_reply(reply)
    within "#reply_#{reply.id}" do
      click_link "Show"
    end
  end

  it "doest not display grade nor answer title when a possible answer has not filled through the reply" do

    visit_survey_replies(survey)

    click_link "New Reply"

    click_button "Create Reply"

    visit_survey_replies(survey)

    last_reply = survey.replies.last

    within "#reply_#{last_reply.id}" do
      click_link "Show"
    end

    expect(last_reply.answers.first.possible_answer_id).to eq(nil)
    expect(last_reply.answers.last.possible_answer_id).to eq(nil)

    expect(page).to_not have_content "error"

  end

  it "displays question/answer and its grade" do

    first_possible_answer = survey.questions.first.possible_answers.first
    last_possible_answer = survey.questions.last.possible_answers.last

    first_possible_answer.update(title: 'Bad', grade: 10)
    last_possible_answer.update(title: 'Good', grade: 3)

    visit_survey_replies(survey)

    click_link "New Reply"

    expect(page).to have_content("New Reply")

    choose('Good')
    choose('Bad')

    click_button "Create Reply"

    expect(page).to have_content "success"

    visit_survey_replies(survey)

    reply = survey.replies.last

    visit_show_reply(reply)

    expect(page).to have_content "Bad"
    expect(page).to have_content "Good"

    expect(page).to have_content "3 / 5"
    expect(page).to have_content "10 / 10"

  end

  it "redirects to replies index clicking the back button" do

    visit_survey_replies(survey)

    reply = survey.replies.last

    visit_show_reply(reply)

    click_link "Back"

    expect(page).to have_content("Listing Replies")

  end

end
