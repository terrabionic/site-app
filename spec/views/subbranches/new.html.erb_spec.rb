require 'rails_helper'

RSpec.describe "subbranches/new", type: :view do
  before(:each) do
    assign(:subbranch, Subbranch.new(
      :name => "MyString",
      :branch => nil,
      :code => 1
    ))
  end

  it "renders new subbranch form" do
    render

    assert_select "form[action=?][method=?]", subbranches_path, "post" do

      assert_select "input#subbranch_name[name=?]", "subbranch[name]"

      assert_select "input#subbranch_branch_id[name=?]", "subbranch[branch_id]"

      assert_select "input#subbranch_code[name=?]", "subbranch[code]"
    end
  end
end
