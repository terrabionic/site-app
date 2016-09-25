require 'rails_helper'

describe "Deleting surveys" do
  it "redirects to the surveys index page on succes" do
    survey = FactoryGirl.create(:survey)

    visit surveys_path

    click_link "Destroy"

    expect(page).to_not have_content(survey.title)
    expect(survey.questions.count).to eq(0)

  end

  it "displays an error if there is an associated object" do
    category = FactoryGirl.create(:category)
    survey = FactoryGirl.create(:survey_with_questions)

    visit surveys_path

    click_link "Destroy"

    expect(page).to have_content("error")
    expect(survey.questions.count).to eq(5)
    expect(page).to have_content(survey.title)

  end
end
