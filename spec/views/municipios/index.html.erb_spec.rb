require 'rails_helper'

RSpec.describe "municipios/index", type: :view do
  before(:each) do
    assign(:municipios, [
      Municipio.create!(
        :name => "Name",
        :region => nil
      ),
      Municipio.create!(
        :name => "Name",
        :region => nil
      )
    ])
  end

  it "renders a list of municipios" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
