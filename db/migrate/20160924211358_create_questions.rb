class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :survey, index: true
      t.references :category, index: true
      t.string :title
      t.integer :grade

      t.timestamps null: false
    end
  end
end
