require 'rails_helper'

RSpec.describe "login_managers/show", type: :view do
  before(:each) do
    @login_manager = assign(:login_manager, LoginManager.create!(
      :email_contact => "Email Contact",
      :about_us => "MyText",
      :privacy => "MyText",
      :we_do => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email Contact/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
