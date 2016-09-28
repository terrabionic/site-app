require 'rails_helper'

describe "Deleting notes" do
  it "redirects to the notes index page on success" do
    question = FactoryGirl.create(:full_question, notes_count: 1)

    visit surveys_path

    within "#survey_#{question.survey.id}" do
      click_link "Questions"
    end

    click_link "Notes"

    click_link "Destroy"

    expect(page.all("tbody tr").size).to eq(0)

    expect(Note.count).to eq(0)

    expect(page).to_not have_content("successs")

  end
end
