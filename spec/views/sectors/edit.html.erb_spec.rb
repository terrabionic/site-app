require 'rails_helper'

RSpec.describe "sectors/edit", type: :view do
  before(:each) do
    @sector = assign(:sector, Sector.create!(
      :name => "MyString",
      :description => "MyText",
      :image_sector => ""
    ))
  end

  it "renders the edit sector form" do
    render

    assert_select "form[action=?][method=?]", sector_path(@sector), "post" do

      assert_select "input#sector_name[name=?]", "sector[name]"

      assert_select "textarea#sector_description[name=?]", "sector[description]"

      assert_select "input#sector_image_sector[name=?]", "sector[image_sector]"
    end
  end
end
