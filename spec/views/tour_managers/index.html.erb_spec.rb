require 'rails_helper'

RSpec.describe "tour_managers/index", type: :view do
  before(:each) do
    assign(:tour_managers, [
      TourManager.create!(
        :welcom => "MyText",
        :map => "MyText",
        :filter_search => "MyText",
        :first_step => "MyText",
        :second_step => "MyText",
        :third_step_text => "Third Step Text",
        :search_field => "MyText"
      ),
      TourManager.create!(
        :welcom => "MyText",
        :map => "MyText",
        :filter_search => "MyText",
        :first_step => "MyText",
        :second_step => "MyText",
        :third_step_text => "Third Step Text",
        :search_field => "MyText"
      )
    ])
  end

  it "renders a list of tour_managers" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Third Step Text".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
