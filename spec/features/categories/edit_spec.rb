require 'rails_helper'

describe "Editing categories" do
  it "updates a category successfully with correct information" do
    category = FactoryGirl.create(:category)

    visit edit_category_path(category)

    fill_in "Title", with: "Have Changed"

    click_button "Update Category"

    expect(page).to have_content("success")
    expect(page).to have_content("Have Changed")
  end

  it "displays error with empty title" do
    category = FactoryGirl.create(:category)

    visit edit_category_path(category)

    fill_in "Title", with: ""

    click_button "Update Category"

    expect(page).to have_content("error")

  end
end
