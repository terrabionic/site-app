class CreateNotificationManagers < ActiveRecord::Migration
  def change
    create_table :notification_managers do |t|
      t.string :title
      t.references :event, index: true, foreign_key: true
      t.references :notice, index: true, foreign_key: true
      t.date :date_pub
      t.references :sector, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
