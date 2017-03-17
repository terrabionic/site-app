require 'rails_helper'

RSpec.describe "pagefeeds/edit", type: :view do
  before(:each) do
    @pagefeed = assign(:pagefeed, Pagefeed.create!(
      :title => "MyString",
      :link => "MyString",
      :sector => nil
    ))
  end

  it "renders the edit pagefeed form" do
    render

    assert_select "form[action=?][method=?]", pagefeed_path(@pagefeed), "post" do

      assert_select "input#pagefeed_title[name=?]", "pagefeed[title]"

      assert_select "input#pagefeed_link[name=?]", "pagefeed[link]"

      assert_select "input#pagefeed_sector_id[name=?]", "pagefeed[sector_id]"
    end
  end
end
