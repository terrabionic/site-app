require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :company_name => "Company Name",
      :role => "Role",
      :address => "Address",
      :phone => "Phone",
      :email => "Email",
      :name_agent => "Name Agent",
      :state => "State",
      :sector => nil,
      :name => "Name",
      :email_user => "Email User",
      :active => false,
      :agent => nil,
      :company_type => "Company Type",
      :vat => "Vat",
      :street => "Street",
      :street2 => "Street2",
      :city => "City",
      :cel => "Cel",
      :line_business => "Line Business",
      :num_workers => 2,
      :annual_sales => "Annual Sales",
      :company_history => "MyText",
      :company_products => "Company Products",
      :company_market => "Company Market",
      :company_problems => "Company Problems",
      :name_director => "Name Director",
      :staff_interviewed => "Staff Interviewed",
      :survey_period => "Survey Period",
      :name_created => "Name Created",
      :completed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name Agent/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email User/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Company Type/)
    expect(rendered).to match(/Vat/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Street2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Cel/)
    expect(rendered).to match(/Line Business/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Annual Sales/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Company Products/)
    expect(rendered).to match(/Company Market/)
    expect(rendered).to match(/Company Problems/)
    expect(rendered).to match(/Name Director/)
    expect(rendered).to match(/Staff Interviewed/)
    expect(rendered).to match(/Survey Period/)
    expect(rendered).to match(/Name Created/)
    expect(rendered).to match(/false/)
  end
end
