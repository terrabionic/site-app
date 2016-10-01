class CreatePossibleAnswers < ActiveRecord::Migration
  def change
    create_table :possible_answers do |t|
      t.references :question, index: true, foreign_key: true
      t.string :title
      t.string :description
      t.integer :grade

      t.timestamps null: false
    end
  end
end