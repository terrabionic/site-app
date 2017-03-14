require 'rails_helper'

RSpec.describe "event_monitors/edit", type: :view do
  before(:each) do
    @event_monitor = assign(:event_monitor, EventMonitor.create!(
      :title => "MyString",
      :allDay => "MyString",
      :address => "MyString",
      :website => "MyString"
    ))
  end

  it "renders the edit event_monitor form" do
    render

    assert_select "form[action=?][method=?]", event_monitor_path(@event_monitor), "post" do

      assert_select "input#event_monitor_title[name=?]", "event_monitor[title]"

      assert_select "input#event_monitor_allDay[name=?]", "event_monitor[allDay]"

      assert_select "input#event_monitor_address[name=?]", "event_monitor[address]"

      assert_select "input#event_monitor_website[name=?]", "event_monitor[website]"
    end
  end
end
