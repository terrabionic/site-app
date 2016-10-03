require 'rails_helper'

describe "Deleting surveys" do

  def destroy_survey(survey)
    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Destroy"
    end
  end

  it "redirects to the surveys index page on succes" do
    survey = FactoryGirl.create(:survey)

    destroy_survey(survey)

    expect(page).to_not have_content(survey.title)
    expect(survey.questions.count).to eq(0)

  end

  it "displays an error if there is an associated object" do
    survey = FactoryGirl.create(:full_survey)

    destroy_survey(survey)

    expect(page).to have_content("error")
    expect(survey.questions.count).to eq(5)
    expect(page).to have_content(survey.title)

  end
end
