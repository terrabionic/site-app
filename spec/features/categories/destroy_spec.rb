require 'rails_helper'

describe "Deleting categories" do
  it "redirects to the categories index page on succes" do
    category = FactoryGirl.create(:category)

    visit categories_path

    click_link "Destroy"

    expect(page).to_not have_content(category.title)


  end
end
