require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "Title",
        :allDay => "All Day",
        :name_exhibitor => "Name Exhibitor",
        :level => nil,
        :hours => "Hours",
        :price => "Price"
      ),
      Event.create!(
        :title => "Title",
        :allDay => "All Day",
        :name_exhibitor => "Name Exhibitor",
        :level => nil,
        :hours => "Hours",
        :price => "Price"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "All Day".to_s, :count => 2
    assert_select "tr>td", :text => "Name Exhibitor".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Hours".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
  end
end
