class CreatePagefeeds < ActiveRecord::Migration
  def change
    create_table :pagefeeds do |t|
      t.string :title
      t.string :link
      t.references :sector, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
