require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :title => "MyString",
      :event => nil,
      :notice => nil,
      :user => nil,
      :user_read => false
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input#notification_title[name=?]", "notification[title]"

      assert_select "input#notification_event_id[name=?]", "notification[event_id]"

      assert_select "input#notification_notice_id[name=?]", "notification[notice_id]"

      assert_select "input#notification_user_id[name=?]", "notification[user_id]"

      assert_select "input#notification_user_read[name=?]", "notification[user_read]"
    end
  end
end
