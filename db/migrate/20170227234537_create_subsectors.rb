class CreateSubsectors < ActiveRecord::Migration
  def change
    create_table :subsectors do |t|
      t.string :name
      t.references :sector, index: true, foreign_key: true
      t.integer :code

      t.timestamps null: false
    end
  end
end
