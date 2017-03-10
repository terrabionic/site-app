require 'rails_helper'

RSpec.describe "event_monitors/index", type: :view do
  before(:each) do
    assign(:event_monitors, [
      EventMonitor.create!(
        :title => "Title",
        :allDay => "All Day",
        :address => "Address",
        :website => "Website"
      ),
      EventMonitor.create!(
        :title => "Title",
        :allDay => "All Day",
        :address => "Address",
        :website => "Website"
      )
    ])
  end

  it "renders a list of event_monitors" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "All Day".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
