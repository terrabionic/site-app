require 'rails_helper'

RSpec.describe "branches/edit", type: :view do
  before(:each) do
    @branch = assign(:branch, Branch.create!(
      :name => "MyString",
      :subsector => nil,
      :code => 1
    ))
  end

  it "renders the edit branch form" do
    render

    assert_select "form[action=?][method=?]", branch_path(@branch), "post" do

      assert_select "input#branch_name[name=?]", "branch[name]"

      assert_select "input#branch_subsector_id[name=?]", "branch[subsector_id]"

      assert_select "input#branch_code[name=?]", "branch[code]"
    end
  end
end
