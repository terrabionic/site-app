require 'rails_helper'

RSpec.describe "pagefeeds/show", type: :view do
  before(:each) do
    @pagefeed = assign(:pagefeed, Pagefeed.create!(
      :title => "Title",
      :link => "Link",
      :sector => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(//)
  end
end
