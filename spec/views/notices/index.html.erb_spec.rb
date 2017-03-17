require 'rails_helper'

RSpec.describe "notices/index", type: :view do
  before(:each) do
    assign(:notices, [
      Notice.create!(
        :title => "Title",
        :link => "Link",
        :sector => nil,
        :description => "MyText",
        :active => false
      ),
      Notice.create!(
        :title => "Title",
        :link => "Link",
        :sector => nil,
        :description => "MyText",
        :active => false
      )
    ])
  end

  it "renders a list of notices" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
