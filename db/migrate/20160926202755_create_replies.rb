class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :survey, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
