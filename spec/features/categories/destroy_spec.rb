require 'rails_helper'

describe "Deleting categories" do
  it "redirects to the categories index page on succes" do
    category = FactoryGirl.create(:category)

    visit categories_path

    click_link "Destroy"

    expect(page).to_not have_content(category.title)
    expect(category.questions.count).to eq(0)

  end

  it "displays an error if there is an associated object" do
    survey = FactoryGirl.create(:full_survey)

    category = survey.questions.first.category

    visit categories_path

    within "#category_#{category.id}" do
      click_link "Destroy"
    end

    expect(page).to have_content("error")
    expect(page).to have_content(category.title)

  end
end
