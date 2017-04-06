require 'rails_helper'

RSpec.describe "subbranches/edit", type: :view do
  before(:each) do
    @subbranch = assign(:subbranch, Subbranch.create!(
      :name => "MyString",
      :branch => nil,
      :code => 1
    ))
  end

  it "renders the edit subbranch form" do
    render

    assert_select "form[action=?][method=?]", subbranch_path(@subbranch), "post" do

      assert_select "input#subbranch_name[name=?]", "subbranch[name]"

      assert_select "input#subbranch_branch_id[name=?]", "subbranch[branch_id]"

      assert_select "input#subbranch_code[name=?]", "subbranch[code]"
    end
  end
end
