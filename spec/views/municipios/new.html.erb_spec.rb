require 'rails_helper'

RSpec.describe "municipios/new", type: :view do
  before(:each) do
    assign(:municipio, Municipio.new(
      :name => "MyString",
      :region => nil
    ))
  end

  it "renders new municipio form" do
    render

    assert_select "form[action=?][method=?]", municipios_path, "post" do

      assert_select "input#municipio_name[name=?]", "municipio[name]"

      assert_select "input#municipio_region_id[name=?]", "municipio[region_id]"
    end
  end
end
