require 'rails_helper'

RSpec.describe "login_managers/index", type: :view do
  before(:each) do
    assign(:login_managers, [
      LoginManager.create!(
        :email_contact => "Email Contact",
        :about_us => "MyText",
        :privacy => "MyText",
        :we_do => "MyText"
      ),
      LoginManager.create!(
        :email_contact => "Email Contact",
        :about_us => "MyText",
        :privacy => "MyText",
        :we_do => "MyText"
      )
    ])
  end

  it "renders a list of login_managers" do
    render
    assert_select "tr>td", :text => "Email Contact".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
