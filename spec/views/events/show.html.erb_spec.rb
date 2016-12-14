require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "Title",
      :allDay => "All Day",
      :name_exhibitor => "Name Exhibitor",
      :level => nil,
      :hours => "Hours",
      :price => "Price"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/All Day/)
    expect(rendered).to match(/Name Exhibitor/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Hours/)
    expect(rendered).to match(/Price/)
  end
end
