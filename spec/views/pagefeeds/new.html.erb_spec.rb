require 'rails_helper'

RSpec.describe "pagefeeds/new", type: :view do
  before(:each) do
    assign(:pagefeed, Pagefeed.new(
      :title => "MyString",
      :link => "MyString",
      :sector => nil
    ))
  end

  it "renders new pagefeed form" do
    render

    assert_select "form[action=?][method=?]", pagefeeds_path, "post" do

      assert_select "input#pagefeed_title[name=?]", "pagefeed[title]"

      assert_select "input#pagefeed_link[name=?]", "pagefeed[link]"

      assert_select "input#pagefeed_sector_id[name=?]", "pagefeed[sector_id]"
    end
  end
end
