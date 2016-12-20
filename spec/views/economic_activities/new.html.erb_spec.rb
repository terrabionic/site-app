require 'rails_helper'

RSpec.describe "economic_activities/new", type: :view do
  before(:each) do
    assign(:economic_activity, EconomicActivity.new(
      :name => "MyString"
    ))
  end

  it "renders new economic_activity form" do
    render

    assert_select "form[action=?][method=?]", economic_activities_path, "post" do

      assert_select "input#economic_activity_name[name=?]", "economic_activity[name]"
    end
  end
end
