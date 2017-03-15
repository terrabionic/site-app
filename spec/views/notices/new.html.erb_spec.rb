require 'rails_helper'

RSpec.describe "notices/new", type: :view do
  before(:each) do
    assign(:notice, Notice.new(
      :title => "MyString",
      :link => "MyString",
      :sector => nil,
      :description => "MyText",
      :active => false
    ))
  end

  it "renders new notice form" do
    render

    assert_select "form[action=?][method=?]", notices_path, "post" do

      assert_select "input#notice_title[name=?]", "notice[title]"

      assert_select "input#notice_link[name=?]", "notice[link]"

      assert_select "input#notice_sector_id[name=?]", "notice[sector_id]"

      assert_select "textarea#notice_description[name=?]", "notice[description]"

      assert_select "input#notice_active[name=?]", "notice[active]"
    end
  end
end
