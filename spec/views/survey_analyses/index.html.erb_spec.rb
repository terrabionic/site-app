require 'rails_helper'

RSpec.describe "survey_analyses/index", type: :view do
  before(:each) do
    assign(:survey_analyses, [
      SurveyAnalysis.create!(
        :agente => "",
        :user_company => "",
        :reply => "",
        :organizational => "MyText",
        :innovation_management => "MyText",
        :innovation => "MyText",
        :guilds => "MyText",
        :copetential => "MyText"
      ),
      SurveyAnalysis.create!(
        :agente => "",
        :user_company => "",
        :reply => "",
        :organizational => "MyText",
        :innovation_management => "MyText",
        :innovation => "MyText",
        :guilds => "MyText",
        :copetential => "MyText"
      )
    ])
  end

  it "renders a list of survey_analyses" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
