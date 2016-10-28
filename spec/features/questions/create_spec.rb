require 'rails_helper'

describe "Adding questions" do
  let!(:survey) { FactoryGirl.create(:survey) }

  def visit_new_survey_question
    visit surveys_path

    click_link "Questions"

    click_link "New Question"
  end

  it "is successful with valid content" do
    category = FactoryGirl.create(:category)

    visit_new_survey_question

    expect(page).to have_content("New Question")

    fill_in "Title", with: "What is your name?"
    select(category.title, :from => 'question_category_id')

    click_button "Create Question"

    expect(page).to have_content "success"
    expect(page).to have_content "What is your name?"
    expect(page).to have_content "#{category.title}"

  end

  it "displays error with no content" do
    visit_new_survey_question

    fill_in "Title", with: ""

    click_button "Create Question"

    expect(page).to have_content "error"
    expect(page).to have_content "Category can't be blank"
    expect(page).to have_content "Title can't be blank"

  end

  it "redirects to survey questions by clicking the back button" do
    visit_new_survey_question

    click_link "Back"

    expect(page).to have_content "Listing Questions"


  end


end
