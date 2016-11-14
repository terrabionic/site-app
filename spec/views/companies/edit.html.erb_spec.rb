require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :company_name => "MyString",
      :role => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :name_agent => "MyString",
      :state => "MyString",
      :sector => nil,
      :name => "MyString",
      :email_user => "MyString",
      :active => false,
      :agent => nil,
      :company_type => "MyString",
      :vat => "MyString",
      :street => "MyString",
      :street2 => "MyString",
      :city => "MyString",
      :cel => "MyString",
      :line_business => "MyString",
      :num_workers => 1,
      :annual_sales => "MyString",
      :company_history => "MyText",
      :company_products => "MyString",
      :company_market => "MyString",
      :company_problems => "MyString",
      :name_director => "MyString",
      :staff_interviewed => "MyString",
      :survey_period => "MyString",
      :name_created => "MyString",
      :completed => false
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input#company_company_name[name=?]", "company[company_name]"

      assert_select "input#company_role[name=?]", "company[role]"

      assert_select "input#company_address[name=?]", "company[address]"

      assert_select "input#company_phone[name=?]", "company[phone]"

      assert_select "input#company_email[name=?]", "company[email]"

      assert_select "input#company_name_agent[name=?]", "company[name_agent]"

      assert_select "input#company_state[name=?]", "company[state]"

      assert_select "input#company_sector_id[name=?]", "company[sector_id]"

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_email_user[name=?]", "company[email_user]"

      assert_select "input#company_active[name=?]", "company[active]"

      assert_select "input#company_agent_id[name=?]", "company[agent_id]"

      assert_select "input#company_company_type[name=?]", "company[company_type]"

      assert_select "input#company_vat[name=?]", "company[vat]"

      assert_select "input#company_street[name=?]", "company[street]"

      assert_select "input#company_street2[name=?]", "company[street2]"

      assert_select "input#company_city[name=?]", "company[city]"

      assert_select "input#company_cel[name=?]", "company[cel]"

      assert_select "input#company_line_business[name=?]", "company[line_business]"

      assert_select "input#company_num_workers[name=?]", "company[num_workers]"

      assert_select "input#company_annual_sales[name=?]", "company[annual_sales]"

      assert_select "textarea#company_company_history[name=?]", "company[company_history]"

      assert_select "input#company_company_products[name=?]", "company[company_products]"

      assert_select "input#company_company_market[name=?]", "company[company_market]"

      assert_select "input#company_company_problems[name=?]", "company[company_problems]"

      assert_select "input#company_name_director[name=?]", "company[name_director]"

      assert_select "input#company_staff_interviewed[name=?]", "company[staff_interviewed]"

      assert_select "input#company_survey_period[name=?]", "company[survey_period]"

      assert_select "input#company_name_created[name=?]", "company[name_created]"

      assert_select "input#company_completed[name=?]", "company[completed]"
    end
  end
end
