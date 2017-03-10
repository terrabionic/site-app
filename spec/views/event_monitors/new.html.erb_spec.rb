require 'rails_helper'

RSpec.describe "event_monitors/new", type: :view do
  before(:each) do
    assign(:event_monitor, EventMonitor.new(
      :title => "MyString",
      :allDay => "MyString",
      :address => "MyString",
      :website => "MyString"
    ))
  end

  it "renders new event_monitor form" do
    render

    assert_select "form[action=?][method=?]", event_monitors_path, "post" do

      assert_select "input#event_monitor_title[name=?]", "event_monitor[title]"

      assert_select "input#event_monitor_allDay[name=?]", "event_monitor[allDay]"

      assert_select "input#event_monitor_address[name=?]", "event_monitor[address]"

      assert_select "input#event_monitor_website[name=?]", "event_monitor[website]"
    end
  end
end
