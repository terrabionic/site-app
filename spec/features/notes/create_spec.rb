require 'rails_helper'

describe "Adding notes" do
  def visit_notes_new
    survey = FactoryGirl.create(:full_survey, questions_count: 1)

    visit surveys_path

    within "#survey_#{survey.id}" do
      click_link "Questions"
    end

    click_link "Notes"

    click_link "New Note"
  end

  it "is successful with valid content" do
    visit_notes_new

    expect(page).to have_content("New Note")

    fill_in "Title", with: "Good"
    fill_in "Description", with: "I Don't wanna be a star"
    fill_in "Points", with: 2

    click_button "Create Note"

    expect(page).to have_content "success"
    expect(page).to have_content "Good"
    expect(page).to have_content "2"
    expect(page).to have_content "Factory Question"

  end

  it "displays error with no content" do
    visit_notes_new

    expect(page).to have_content("New Note")

    fill_in "Title", with: ""
    fill_in "Description", with: ""
    fill_in "Points", with: ""

    click_button "Create Note"

    expect(page).to have_content "error"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Points can't be blank"
    expect(page).to have_content "Description can't be blank"

  end

  it "displays error with invalid content" do
    visit_notes_new

    expect(page).to have_content("New Note")

    fill_in "Title", with: "Baptism"
    fill_in "Description", with: "13 Songs 54 min"
    fill_in "Points", with: "Album"

    click_button "Create Note"

    expect(page).to have_content "error"
    expect(page).to have_content "Points is not a number"

  end

  it "dislays error when points are greater than question grade" do
    visit_notes_new

    fill_in "Title", with: "Baptism"
    fill_in "Description", with: "13 Songs 54 min"
    fill_in "Points", with: "100"

    click_button "Create Note"

    expect(page).to have_content "error"
    expect(page).to have_content "can't be greater than question grade"

  end

  it "dislays error when points are lower than 0" do
    visit_notes_new

    fill_in "Title", with: "Baptism"
    fill_in "Description", with: "13 Songs 54 min"
    fill_in "Points", with: "-100"

    click_button "Create Note"

    expect(page).to have_content "error"
    expect(page).to have_content "must be greater than or equal to 0"
  end

end
