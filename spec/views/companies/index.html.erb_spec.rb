require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
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
      ),
      Company.create!(
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
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name Agent".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email User".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Company Type".to_s, :count => 2
    assert_select "tr>td", :text => "Vat".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Street2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Cel".to_s, :count => 2
    assert_select "tr>td", :text => "Line Business".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Annual Sales".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Company Products".to_s, :count => 2
    assert_select "tr>td", :text => "Company Market".to_s, :count => 2
    assert_select "tr>td", :text => "Company Problems".to_s, :count => 2
    assert_select "tr>td", :text => "Name Director".to_s, :count => 2
    assert_select "tr>td", :text => "Staff Interviewed".to_s, :count => 2
    assert_select "tr>td", :text => "Survey Period".to_s, :count => 2
    assert_select "tr>td", :text => "Name Created".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
