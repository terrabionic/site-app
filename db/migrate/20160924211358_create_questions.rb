class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :survey, index: true
      t.string :title
      t.integer :value

      t.timestamps null: false
    end
  end
end
