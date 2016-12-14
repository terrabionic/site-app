require 'rails_helper'

RSpec.describe "levels/index", type: :view do
  before(:each) do
    assign(:levels, [
      Level.create!(
        :title => "Title"
      ),
      Level.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of levels" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
