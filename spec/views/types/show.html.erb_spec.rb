require 'rails_helper'

RSpec.describe "types/show", type: :view do
  before(:each) do
    @type = assign(:type, Type.create!(
      :name => "Name",
      :subbranch => nil,
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
