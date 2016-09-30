require 'rails_helper'

describe "Showing a reply" do
  it "displays question/answer and its grade" do

    survey = FactoryGirl.create(:full_survey, questions_count: 2, replies_count: 1)

    first_possible_answer = survey.questions.first.possible_answers.first
    last_possible_answer = survey.questions.last.possible_answers.last

    first_possible_answer.update(title: 'Bad', grade: 10)
    last_possible_answer.update(title: 'Good', grade: 3)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Replies"
    end

    click_link "New Reply"

    expect(page).to have_content("New Reply")

    choose('Good')
    choose('Bad')

    click_button "Create Reply"

    expect(page).to have_content "success"

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Replies"
    end

    within "#reply_#{survey.replies.last.id}" do
      click_link "Show"
    end

    expect(page).to have_content "Bad"
    expect(page).to have_content "Good"

    expect(page).to have_content "3 / 5"
    expect(page).to have_content "10 / 10"

  end

  it "redirects to replies index clicking the back button" do

    survey = FactoryGirl.create(:full_survey, questions_count: 2, replies_count: 1)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Replies"
    end

    within "#reply_#{survey.replies.last.id}" do
      click_link "Show"
    end

    click_link "Back"

    expect(page).to have_content("Listing Replies")

  end

end
