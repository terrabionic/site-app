require 'rails_helper'

describe "Creating surveys" do
  it "redirects to the survey show page on success" do
    visit surveys_path
    click_link "New Survey"
    expect(page).to have_content("New Survey")

    fill_in "Title", with: "Healthy Enterprise"
    click_button "Create Survey"

    expect(page).to have_content("Healthy Enterprise")

  end

  it "displays an error when the survey has no title" do
    expect(Survey.count).to eq(0)

    visit surveys_path

    click_link "New Survey"
    expect(page).to have_content("New Survey")

    fill_in "Title", with: ""
    click_button "Create Survey"

    expect(page).to have_content("error")
    expect(Survey.count).to eq(0)
  end

end
