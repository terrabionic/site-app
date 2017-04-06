require 'rails_helper'

RSpec.describe "subbranches/show", type: :view do
  before(:each) do
    @subbranch = assign(:subbranch, Subbranch.create!(
      :name => "Name",
      :branch => nil,
      :code => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
