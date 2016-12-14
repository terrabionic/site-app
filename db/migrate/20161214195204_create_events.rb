class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.string :allDay
      t.string :name_exhibitor
      t.references :level, index: true, foreign_key: true
      t.string :hours
      t.string :price

      t.timestamps null: false
    end
  end
end
