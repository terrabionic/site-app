class CreateEventMonitors < ActiveRecord::Migration
  def change
    create_table :event_monitors do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.string :allDay
      t.string :address
      t.string :website

      t.timestamps null: false
    end
  end
end
