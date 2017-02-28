require 'rails_helper'

RSpec.describe "subsectors/show", type: :view do
  before(:each) do
    @subsector = assign(:subsector, Subsector.create!(
      :name => "Name",
      :sector => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
