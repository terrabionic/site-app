require 'rails_helper'

describe "Adding questions" do
  let!(:survey) { FactoryGirl.create(:survey) }

  def visit_question_create
    visit surveys_path

    click_link "Questions"

    click_link "New Question"
  end

  it "is successful with valid content" do
    category = FactoryGirl.create(:category)

    visit_question_create

    expect(page).to have_content("New Question")

    fill_in "Title", with: "What is your name?"
    fill_in "Grade", with: "10"
    select(category.title, :from => 'question_category_id')

    click_button "Create Question"

    expect(page).to have_content "success"
    expect(page).to have_content "What is your name?"
    expect(page).to have_content "10"
    expect(page).to have_content "#{category.title}"

  end

  it "displays error with no content" do
    visit_question_create

    fill_in "Title", with: ""
    fill_in "Grade", with: ""

    click_button "Create Question"

    expect(page).to have_content "error"
    expect(page).to have_content "Category can't be blank"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Grade can't be blank"

  end

  it "displays error with invalid content" do
    category = FactoryGirl.create(:category)

    visit_question_create

    fill_in "Title", with: "Something cool"
    fill_in "Grade", with: "diez"
    select(category.title, :from => 'question_category_id')

    click_button "Create Question"

    expect(page).to have_content "error"
    expect(page).to have_content "Grade is not a number"

  end

  it "displays error with negative grade" do
    category = FactoryGirl.create(:category)

    visit_question_create

    fill_in "Title", with: "Something cool"
    fill_in "Grade", with: "-10"
    select(category.title, :from => 'question_category_id')

    click_button "Create Question"

    expect(page).to have_content "error"
    expect(page).to have_content "greater than or equal to 0"

  end

end
