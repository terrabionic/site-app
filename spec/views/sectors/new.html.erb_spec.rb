require 'rails_helper'

RSpec.describe "sectors/new", type: :view do
  before(:each) do
    assign(:sector, Sector.new(
      :name => "MyString",
      :description => "MyText",
      :image_sector => ""
    ))
  end

  it "renders new sector form" do
    render

    assert_select "form[action=?][method=?]", sectors_path, "post" do

      assert_select "input#sector_name[name=?]", "sector[name]"

      assert_select "textarea#sector_description[name=?]", "sector[description]"

      assert_select "input#sector_image_sector[name=?]", "sector[image_sector]"
    end
  end
end
