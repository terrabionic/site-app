class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.string :link
      t.references :sector, index: true, foreign_key: true
      t.text :description
      t.boolean :active
      t.datetime :date_pub

      t.timestamps null: false
    end
  end
end
