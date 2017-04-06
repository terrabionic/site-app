require 'rails_helper'

RSpec.describe "types/index", type: :view do
  before(:each) do
    assign(:types, [
      Type.create!(
        :name => "Name",
        :subbranch => nil,
        :code => 2
      ),
      Type.create!(
        :name => "Name",
        :subbranch => nil,
        :code => 2
      )
    ])
  end

  it "renders a list of types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
