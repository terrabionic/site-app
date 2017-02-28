require 'rails_helper'

RSpec.describe "subsectors/new", type: :view do
  before(:each) do
    assign(:subsector, Subsector.new(
      :name => "MyString",
      :sector => nil
    ))
  end

  it "renders new subsector form" do
    render

    assert_select "form[action=?][method=?]", subsectors_path, "post" do

      assert_select "input#subsector_name[name=?]", "subsector[name]"

      assert_select "input#subsector_sector_id[name=?]", "subsector[sector_id]"
    end
  end
end
