require 'rails_helper'

RSpec.describe "subsectors/edit", type: :view do
  before(:each) do
    @subsector = assign(:subsector, Subsector.create!(
      :name => "MyString",
      :sector => nil
    ))
  end

  it "renders the edit subsector form" do
    render

    assert_select "form[action=?][method=?]", subsector_path(@subsector), "post" do

      assert_select "input#subsector_name[name=?]", "subsector[name]"

      assert_select "input#subsector_sector_id[name=?]", "subsector[sector_id]"
    end
  end
end
