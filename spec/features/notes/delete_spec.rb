require 'rails_helper'

describe "Deleting notes" do
  it "redirects to the notes index page on success" do
    FactoryGirl.create(:question_with_notes, notes_count: 1)

    visit surveys_path

    click_link "Questions"

    click_link "Notes"

    click_link "Destroy"

    expect(page.all("tbody tr").size).to eq(0)

    expect(Note.count).to eq(0)

    expect(page).to_not have_content("successs")

  end
end
