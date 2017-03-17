class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.references :event, index: true, foreign_key: true
      t.references :notice, index: true, foreign_key: true
      t.datetime :date_pub
      t.references :user, index: true, foreign_key: true
      t.boolean :user_read

      t.timestamps null: false
    end
  end
end
