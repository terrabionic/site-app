require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "MyString",
      :allDay => "MyString",
      :name_exhibitor => "MyString",
      :level => nil,
      :hours => "MyString",
      :price => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_allDay[name=?]", "event[allDay]"

      assert_select "input#event_name_exhibitor[name=?]", "event[name_exhibitor]"

      assert_select "input#event_level_id[name=?]", "event[level_id]"

      assert_select "input#event_hours[name=?]", "event[hours]"

      assert_select "input#event_price[name=?]", "event[price]"
    end
  end
end
