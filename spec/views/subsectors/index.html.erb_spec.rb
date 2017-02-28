require 'rails_helper'

RSpec.describe "subsectors/index", type: :view do
  before(:each) do
    assign(:subsectors, [
      Subsector.create!(
        :name => "Name",
        :sector => nil
      ),
      Subsector.create!(
        :name => "Name",
        :sector => nil
      )
    ])
  end

  it "renders a list of subsectors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
