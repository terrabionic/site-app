require 'rails_helper'

describe "Editing notes" do
  it "updates successfully with correct data" do
    question = FactoryGirl.create(:full_question, notes_count: 1)

    visit surveys_path

    within "#survey_#{question.survey.id}" do
      click_link "Questions"
    end

    click_link "Notes"

    expect(page).to have_content("Edit")

    click_link "Edit"

    fill_in "Title", with: "Sistamamalover"
    fill_in "Description", with: "See what your friends are playing"
    fill_in "Points", with: 4

    click_button "Update Note"

    expect(page).to have_content "success"
    expect(page).to have_content "Sistamamalover"
    expect(page).to have_content "friends are playing"
    expect(page).to have_content "4"

  end

  it "displays error with invalid fields" do
    question = FactoryGirl.create(:full_question, notes_count: 1)

    visit surveys_path

    within "#survey_#{question.survey.id}" do
      click_link "Questions"
    end

    click_link "Notes"

    expect(page).to have_content("Edit")

    click_link "Edit"

    fill_in "Title", with: ""
    fill_in "Description", with: ""
    fill_in "Points", with: "1000"

    click_button "Update Note"

    expect(page).to have_content "error"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "can't be greater than question grade"
    expect(page).to have_content "Description can't be blank"

  end

end
