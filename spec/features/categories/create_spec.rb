require 'rails_helper'

describe "Creating categories" do

  def create_category(options = {})
    options[:title] ||= "Default category title"

    visit categories_path
    click_link "New Category"

    fill_in "Title", with: options[:title]
    click_button "Create Category"
  end

  it "redirects to the category show page on success" do

    create_category(title: "Technology")

    expect(page).to have_content("success")
    expect(page).to have_content("Technology")

  end

  it "displays an error when the category has no title" do

    expect(Category.count).to eq(0)

    create_category(title: "")

    expect(page).to have_content("error")
    expect(Category.count).to eq(0)
  end

end
