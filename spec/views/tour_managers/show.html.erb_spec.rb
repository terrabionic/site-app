require 'rails_helper'

RSpec.describe "tour_managers/show", type: :view do
  before(:each) do
    @tour_manager = assign(:tour_manager, TourManager.create!(
      :welcom => "MyText",
      :map => "MyText",
      :filter_search => "MyText",
      :first_step => "MyText",
      :second_step => "MyText",
      :third_step_text => "Third Step Text",
      :search_field => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Third Step Text/)
    expect(rendered).to match(/MyText/)
  end
end
