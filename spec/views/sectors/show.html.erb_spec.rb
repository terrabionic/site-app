require 'rails_helper'

RSpec.describe "sectors/show", type: :view do
  before(:each) do
    @sector = assign(:sector, Sector.create!(
      :name => "Name",
      :description => "MyText",
      :image_sector => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
