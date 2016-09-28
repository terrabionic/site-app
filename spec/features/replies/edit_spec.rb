require 'rails_helper'

describe "Editing replies" do

  it "updates a reply successfully with answers" do

    survey = FactoryGirl.create(:full_survey, questions_count: 1, replies_count: 1)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Replies"
    end

    click_link "New Reply"

    expect(page).to have_content("New Reply")

    survey.questions.each_with_index do |question, index|
      fill_in question.title, with: "Arch Linux"
    end

    click_button "Create Reply"

    expect(page).to have_content "success"

    expect(survey.replies.last.answers.count).to eq(1)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Replies"
    end

    within "#reply_#{survey.replies.last.id}" do
      click_link "Edit"
    end

    survey.replies.last.answers.each do |answer|
      fill_in answer.question.title, with: "Ubuntu"
    end

    click_button "Update Reply"

    expect(page).to have_content("success")

    expect(survey.replies.last.answers.first.content).to eq("Ubuntu")

    expect(survey.replies.last.answers.count).to eq(1)

    expect(survey.replies.count).to eq(2)

  end

end
