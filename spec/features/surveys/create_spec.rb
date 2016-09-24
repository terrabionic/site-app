require 'rails_helper'

describe "Creating surveys" do
  def create_survey(options = {})
    options[:title] ||= "Default survey title"

    visit surveys_path
    click_link "New Survey"

    fill_in "Title", with: options[:title]
    click_button "Create Survey"
  end

  it "redirects to the survey show page on success" do

    create_survey(title: "Healthy Enterprise")

    expect(page).to have_content("Healthy Enterprise")

  end

  it "displays an error when the survey has no title" do

    expect(Survey.count).to eq(0)

    create_survey(title: "")

    expect(page).to have_content("error")
    expect(Survey.count).to eq(0)
  end

end
