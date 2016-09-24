require 'rails_helper'

describe "Viewing questions" do

  it "displays no questions when survey is empty" do
    survey = FactoryGirl.create(:survey)

    visit surveys_path

    click_link "Questions"

    expect(page).to have_content("Factory Survey")
  end


end
