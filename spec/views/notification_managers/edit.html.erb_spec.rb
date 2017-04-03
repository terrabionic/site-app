require 'rails_helper'

RSpec.describe "notification_managers/edit", type: :view do
  before(:each) do
    @notification_manager = assign(:notification_manager, NotificationManager.create!(
      :title => "MyString",
      :event => nil,
      :notice => nil,
      :sector => nil
    ))
  end

  it "renders the edit notification_manager form" do
    render

    assert_select "form[action=?][method=?]", notification_manager_path(@notification_manager), "post" do

      assert_select "input#notification_manager_title[name=?]", "notification_manager[title]"

      assert_select "input#notification_manager_event_id[name=?]", "notification_manager[event_id]"

      assert_select "input#notification_manager_notice_id[name=?]", "notification_manager[notice_id]"

      assert_select "input#notification_manager_sector_id[name=?]", "notification_manager[sector_id]"
    end
  end
end
