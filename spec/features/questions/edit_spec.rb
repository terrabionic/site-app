require 'rails_helper'

describe "Editing questions" do

  def visit_question_edit
    survey = FactoryGirl.create(:full_survey, questions_count: 1)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    click_link "Edit"
  end

  it "updates a survey successfully with correct information" do
    category_2 = FactoryGirl.create(:category)

    visit_question_edit

    fill_in "Title", with: "Another Title"
    fill_in "Grade", with: "7"
    select(category_2.title, :from => 'question_category_id')

    click_button "Update Question"

    expect(page).to have_content("success")
    expect(page).to have_content("Another Title")
    expect(page).to have_content("7")
    expect(page).to have_content(category_2.title)

  end

  it "displays error with empty data" do
    visit_question_edit

    fill_in "Title", with: ""
    fill_in "Grade", with: ""

    click_button "Update Question"

    expect(page).to have_content("error")

  end

  it "displays error with invalid data" do
    visit_question_edit

    fill_in "Title", with: "Woot"
    fill_in "Grade", with: "diez"

    click_button "Update Question"

    expect(page).to have_content("error")

  end

  it "redirects to index questions on back click back button" do
    visit_question_edit

    click_link "Back"

    expect(page).to have_content("Listing Questions")
    expect(page).to have_content("Factory Survey")
    expect(page).to have_content("Factory Question")

  end
end
