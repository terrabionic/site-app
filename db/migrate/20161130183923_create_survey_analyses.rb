class CreateSurveyAnalyses < ActiveRecord::Migration
  def change
    create_table :survey_analyses do |t|
      t.references :agente
      t.references :user_company
      t.references :reply
      t.text :organizational
      t.text :innovation_management
      t.text :innovation
      t.text :guilds
      t.text :copetential
      t.integer :num_company
      t.integer :num_jobs
      t.integer :create_jobs
      t.integer :num_emprered
      t.integer :num_electronic_kiosk

      t.timestamps null: false
    end
  end
end
