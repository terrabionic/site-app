require 'rails_helper'

RSpec.describe "login_managers/edit", type: :view do
  before(:each) do
    @login_manager = assign(:login_manager, LoginManager.create!(
      :email_contact => "MyString",
      :about_us => "MyText",
      :privacy => "MyText",
      :we_do => "MyText"
    ))
  end

  it "renders the edit login_manager form" do
    render

    assert_select "form[action=?][method=?]", login_manager_path(@login_manager), "post" do

      assert_select "input#login_manager_email_contact[name=?]", "login_manager[email_contact]"

      assert_select "textarea#login_manager_about_us[name=?]", "login_manager[about_us]"

      assert_select "textarea#login_manager_privacy[name=?]", "login_manager[privacy]"

      assert_select "textarea#login_manager_we_do[name=?]", "login_manager[we_do]"
    end
  end
end
