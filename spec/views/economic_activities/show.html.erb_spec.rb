require 'rails_helper'

RSpec.describe "economic_activities/show", type: :view do
  before(:each) do
    @economic_activity = assign(:economic_activity, EconomicActivity.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
