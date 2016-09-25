require 'rails_helper'

describe "Adding questions" do
  let!(:survey) { FactoryGirl.create(:survey) }

  def visit_question_create
    visit surveys_path

    click_link "Questions"

    click_link "New Question"
  end

  it "is successful with valid content" do
    visit_question_create

    expect(page).to have_content("New Question")

    fill_in "Title", with: "What is your name?"
    fill_in "Value", with: "10"

    click_button "Create Question"

    expect(page).to have_content "success"
    expect(page).to have_content "What is your name?"
    expect(page).to have_content "10"

  end

  it "displays error with no content" do
    visit_question_create

    fill_in "Title", with: ""
    fill_in "Value", with: ""

    click_button "Create Question"

    expect(page).to have_content "error"

  end

  it "displays error with invalid content" do
    visit_question_create

    fill_in "Title", with: "Something cool"
    fill_in "Value", with: "diez"

    click_button "Create Question"

    expect(page).to have_content "error"

  end

end
