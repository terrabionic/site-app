require 'rails_helper'

describe "Deleting categories" do
  def destroy_category(category)
    visit categories_path

    within "#category_#{category.id}" do
      click_link "Destroy"
    end
  end

  it "redirects to the categories index page on succes" do
    category = FactoryGirl.create(:category)

    destroy_category(category)

    expect(page).to_not have_content(category.title)
    expect(category.questions.count).to eq(0)

  end

  it "displays an error if there is an associated object" do
    survey = FactoryGirl.create(:full_survey)

    category = survey.questions.first.category

    destroy_category(category)

    expect(page).to have_content("error")
    expect(page).to have_content(category.title)

  end
end
