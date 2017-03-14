require 'rails_helper'

RSpec.describe "event_monitors/show", type: :view do
  before(:each) do
    @event_monitor = assign(:event_monitor, EventMonitor.create!(
      :title => "Title",
      :allDay => "All Day",
      :address => "Address",
      :website => "Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/All Day/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Website/)
  end
end
