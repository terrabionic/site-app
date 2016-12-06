class AddSurveyAnalysisToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :survey_analysis, index: true
  end
end
