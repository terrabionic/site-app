require 'rails_helper'

describe "Editing categories" do

  let!(:category) { FactoryGirl.create(:category) }

  def update_category(options = {})
    options[:title] ||= "Title"

    fill_in "Title", with: options[:title]

    click_button "Update Category"

  end

  it "updates a category successfully with correct information" do

    visit edit_category_path(category)

    update_category(title: "Have Changed")

    expect(page).to have_content("success")
    expect(page).to have_content("Have Changed")
  end

  it "displays error with empty title" do

    visit edit_category_path(category)

    update_category(title: "")

    expect(page).to have_content("error")

  end
end
