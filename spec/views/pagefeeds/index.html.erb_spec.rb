require 'rails_helper'

RSpec.describe "pagefeeds/index", type: :view do
  before(:each) do
    assign(:pagefeeds, [
      Pagefeed.create!(
        :title => "Title",
        :link => "Link",
        :sector => nil
      ),
      Pagefeed.create!(
        :title => "Title",
        :link => "Link",
        :sector => nil
      )
    ])
  end

  it "renders a list of pagefeeds" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
