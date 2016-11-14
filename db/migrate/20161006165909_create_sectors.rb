class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name
      t.text :description
      t.binary :image_sector
      t.boolean :active, default: false

      t.timestamps null: false
    end
    add_attachment :sectors, :image
  end
end
