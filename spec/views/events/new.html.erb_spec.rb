require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :title => "MyString",
      :allDay => "MyString",
      :name_exhibitor => "MyString",
      :level => nil,
      :hours => "MyString",
      :price => "MyString"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_allDay[name=?]", "event[allDay]"

      assert_select "input#event_name_exhibitor[name=?]", "event[name_exhibitor]"

      assert_select "input#event_level_id[name=?]", "event[level_id]"

      assert_select "input#event_hours[name=?]", "event[hours]"

      assert_select "input#event_price[name=?]", "event[price]"
    end
  end
end
