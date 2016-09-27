require 'rails_helper'

describe "Adding replies" do

  it "is successfully created with anwers" do
    FactoryGirl.create(:category)
    survey = FactoryGirl.create(:survey_with_questions, questions_count: 3)

    visit surveys_path

    click_link "Replies"

    click_link "New Reply"

    expect(page).to have_content("New Reply")

    survey.questions.each_with_index do |question, index|
      fill_in question.title, with: "Answer #{index}"
    end

    click_button "Create Reply"

    expect(page).to have_content "success"

    expect(survey.replies.count).to eq(1)

    expect(survey.replies.first.answers.first.reply_id).to eq(survey.replies.first.id)
    expect(survey.replies.first.answers.first.question_id).to eq(survey.questions.first.id)

    expect(survey.replies.last.answers.last.reply_id).to eq(survey.replies.last.id)
    expect(survey.replies.last.answers.last.question_id).to eq(survey.questions.last.id)

    expect(Reply.count).to eq(1)
    expect(Answer.count).to eq(survey.questions.count)

  end

end
