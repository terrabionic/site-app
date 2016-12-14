class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :title

      t.timestamps null: false
    end
    add_attachment :levels, :image
  end
end
