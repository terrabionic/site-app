require 'rails_helper'

RSpec.describe "subbranches/index", type: :view do
  before(:each) do
    assign(:subbranches, [
      Subbranch.create!(
        :name => "Name",
        :branch => nil,
        :code => 2
      ),
      Subbranch.create!(
        :name => "Name",
        :branch => nil,
        :code => 2
      )
    ])
  end

  it "renders a list of subbranches" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
