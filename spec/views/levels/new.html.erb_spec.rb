require 'rails_helper'

RSpec.describe "levels/new", type: :view do
  before(:each) do
    assign(:level, Level.new(
      :title => "MyString"
    ))
  end

  it "renders new level form" do
    render

    assert_select "form[action=?][method=?]", levels_path, "post" do

      assert_select "input#level_title[name=?]", "level[title]"
    end
  end
end
