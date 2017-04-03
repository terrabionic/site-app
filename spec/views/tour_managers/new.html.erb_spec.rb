require 'rails_helper'

RSpec.describe "tour_managers/new", type: :view do
  before(:each) do
    assign(:tour_manager, TourManager.new(
      :welcom => "MyText",
      :map => "MyText",
      :filter_search => "MyText",
      :first_step => "MyText",
      :second_step => "MyText",
      :third_step_text => "MyString",
      :search_field => "MyText"
    ))
  end

  it "renders new tour_manager form" do
    render

    assert_select "form[action=?][method=?]", tour_managers_path, "post" do

      assert_select "textarea#tour_manager_welcom[name=?]", "tour_manager[welcom]"

      assert_select "textarea#tour_manager_map[name=?]", "tour_manager[map]"

      assert_select "textarea#tour_manager_filter_search[name=?]", "tour_manager[filter_search]"

      assert_select "textarea#tour_manager_first_step[name=?]", "tour_manager[first_step]"

      assert_select "textarea#tour_manager_second_step[name=?]", "tour_manager[second_step]"

      assert_select "input#tour_manager_third_step_text[name=?]", "tour_manager[third_step_text]"

      assert_select "textarea#tour_manager_search_field[name=?]", "tour_manager[search_field]"
    end
  end
end
