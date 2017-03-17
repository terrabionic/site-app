require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :title => "Title",
        :event => nil,
        :notice => nil,
        :user => nil,
        :user_read => false
      ),
      Notification.create!(
        :title => "Title",
        :event => nil,
        :notice => nil,
        :user => nil,
        :user_read => false
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
