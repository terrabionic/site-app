require 'rails_helper'

describe "Editing notes" do
  it "updates successfully with correct data" do
    FactoryGirl.create(:question_with_notes, notes_count: 1)

    visit surveys_path

    click_link "Questions"

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
    FactoryGirl.create(:question_with_notes, notes_count: 1)

    visit surveys_path

    click_link "Questions"

    click_link "Notes"

    expect(page).to have_content("Edit")

    click_link "Edit"

    fill_in "Title", with: ""
    fill_in "Description", with: ""
    fill_in "Points", with: "Where are we runnin?"

    click_button "Update Note"

    expect(page).to have_content "error"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Points is not a number"
    expect(page).to have_content "Description can't be blank"

  end

end
