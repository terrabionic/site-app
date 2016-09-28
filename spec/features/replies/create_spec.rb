require 'rails_helper'

describe "Adding replies" do

  it "is successfully created with anwers" do
    survey = FactoryGirl.create(:full_survey, questions_count: 3, replies_count: 1)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Replies"
    end

    click_link "New Reply"

    expect(page).to have_content("New Reply")

    survey.questions.each_with_index do |question, index|
      fill_in question.title, with: "Answer #{index}"
    end

    click_button "Create Reply"

    expect(page).to have_content "success"

    expect(survey.replies.count).to eq(2)

    expect(survey.replies.last.answers.first.content).to eq("Answer 0")

  end

end
