require 'rails_helper'

RSpec.describe "types/edit", type: :view do
  before(:each) do
    @type = assign(:type, Type.create!(
      :name => "MyString",
      :subbranch => nil,
      :code => 1
    ))
  end

  it "renders the edit type form" do
    render

    assert_select "form[action=?][method=?]", type_path(@type), "post" do

      assert_select "input#type_name[name=?]", "type[name]"

      assert_select "input#type_subbranch_id[name=?]", "type[subbranch_id]"

      assert_select "input#type_code[name=?]", "type[code]"
    end
  end
end
