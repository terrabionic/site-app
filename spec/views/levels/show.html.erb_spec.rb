require 'rails_helper'

RSpec.describe "levels/show", type: :view do
  before(:each) do
    @level = assign(:level, Level.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
