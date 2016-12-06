require 'rails_helper'

RSpec.describe "survey_analyses/show", type: :view do
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
