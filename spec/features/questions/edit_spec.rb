require 'rails_helper'

describe "Editing questions" do
  let!(:category) { FactoryGirl.create(:category) }
  let!(:survey) { FactoryGirl.create(:survey_with_questions, questions_count: 1) }

  def visit_question_edit
    visit surveys_path

    click_link "Questions"

    click_link "Edit"
  end

  it "updates a survey successfully with correct information" do
    visit_question_edit

    fill_in "Title", with: "Another Title"
    fill_in "Grade", with: "7"
    select('Factory Category', :from => 'question_category_id')

    click_button "Update Question"

    expect(page).to have_content("success")
    expect(page).to have_content("Another Title")
    expect(page).to have_content("7")
    expect(page).to have_content("Factory Category")

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

  it "goes redirects to index questions on back click back button" do
    visit_question_edit

    click_link "Back"

    expect(page).to have_content("Listing Questions")
    expect(page).to have_content("Factory Survey")
    expect(page).to have_content("Factory Question")

  end
end
