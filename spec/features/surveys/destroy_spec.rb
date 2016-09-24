require 'rails_helper'

describe "Deleting surveys" do
  it "redirects to the surveys index page on succes" do
    survey = FactoryGirl.create(:survey)

    visit surveys_path

    click_link "Destroy"

    expect(page).to_not have_content(survey.title)


  end
end
