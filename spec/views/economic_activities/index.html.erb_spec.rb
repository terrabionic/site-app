require 'rails_helper'

RSpec.describe "economic_activities/index", type: :view do
  before(:each) do
    assign(:economic_activities, [
      EconomicActivity.create!(
        :name => "Name"
      ),
      EconomicActivity.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of economic_activities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
