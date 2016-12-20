require 'rails_helper'

RSpec.describe "economic_activities/edit", type: :view do
  before(:each) do
    @economic_activity = assign(:economic_activity, EconomicActivity.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit economic_activity form" do
    render

    assert_select "form[action=?][method=?]", economic_activity_path(@economic_activity), "post" do

      assert_select "input#economic_activity_name[name=?]", "economic_activity[name]"
    end
  end
end
