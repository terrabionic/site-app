require 'rails_helper'

RSpec.describe "notification_managers/index", type: :view do
  before(:each) do
    assign(:notification_managers, [
      NotificationManager.create!(
        :title => "Title",
        :event => nil,
        :notice => nil,
        :sector => nil
      ),
      NotificationManager.create!(
        :title => "Title",
        :event => nil,
        :notice => nil,
        :sector => nil
      )
    ])
  end

  it "renders a list of notification_managers" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
