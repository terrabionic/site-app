require 'rails_helper'

RSpec.describe "notices/edit", type: :view do
  before(:each) do
    @notice = assign(:notice, Notice.create!(
      :title => "MyString",
      :link => "MyString",
      :sector => nil,
      :description => "MyText",
      :active => false
    ))
  end

  it "renders the edit notice form" do
    render

    assert_select "form[action=?][method=?]", notice_path(@notice), "post" do

      assert_select "input#notice_title[name=?]", "notice[title]"

      assert_select "input#notice_link[name=?]", "notice[link]"

      assert_select "input#notice_sector_id[name=?]", "notice[sector_id]"

      assert_select "textarea#notice_description[name=?]", "notice[description]"

      assert_select "input#notice_active[name=?]", "notice[active]"
    end
  end
end
