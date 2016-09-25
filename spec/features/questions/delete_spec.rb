require 'rails_helper'

describe "Deleting questions" do
  it "redirects to the questions index page on succes" do
    survey = FactoryGirl.create(:survey_with_questions, questions_count: 1)

    visit surveys_path

    click_link "Questions"

    expect(page).to have_content("Destroy")

    click_link "Destroy"

    expect(page).to_not have_content("Factory Question")

    expect(survey.questions.count).to eq(0)

    expect(page).to_not have_content("successs")

  end
end
