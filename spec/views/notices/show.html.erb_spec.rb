require 'rails_helper'

RSpec.describe "notices/show", type: :view do
  before(:each) do
    @notice = assign(:notice, Notice.create!(
      :title => "Title",
      :link => "Link",
      :sector => nil,
      :description => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
