require 'rails_helper'

RSpec.describe "survey_analyses/edit", type: :view do
  before(:each) do
    @survey_analysis = assign(:survey_analysis, SurveyAnalysis.create!(
      :agente => "",
      :user_company => "",
      :reply => "",
      :organizational => "MyText",
      :innovation_management => "MyText",
      :innovation => "MyText",
      :guilds => "MyText",
      :copetential => "MyText"
    ))
  end

  it "renders the edit survey_analysis form" do
    render

    assert_select "form[action=?][method=?]", survey_analysis_path(@survey_analysis), "post" do

      assert_select "input#survey_analysis_agente[name=?]", "survey_analysis[agente]"

      assert_select "input#survey_analysis_user_company[name=?]", "survey_analysis[user_company]"

      assert_select "input#survey_analysis_reply[name=?]", "survey_analysis[reply]"

      assert_select "textarea#survey_analysis_organizational[name=?]", "survey_analysis[organizational]"

      assert_select "textarea#survey_analysis_innovation_management[name=?]", "survey_analysis[innovation_management]"

      assert_select "textarea#survey_analysis_innovation[name=?]", "survey_analysis[innovation]"

      assert_select "textarea#survey_analysis_guilds[name=?]", "survey_analysis[guilds]"

      assert_select "textarea#survey_analysis_copetential[name=?]", "survey_analysis[copetential]"
    end
  end
end
