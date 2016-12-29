class AddDateToSurveyAnalysis < ActiveRecord::Migration
  def change
    add_column :survey_analyses, :date_print, :date
  end
end
