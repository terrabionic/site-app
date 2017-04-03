class CreateTourManagers < ActiveRecord::Migration
  def change
    create_table :tour_managers do |t|
      t.text :welcom
      t.text :map
      t.text :filter_search
      t.text :first_step
      t.text :second_step
      t.text :third_step
      t.text :search_field

      t.timestamps null: false
    end
  end
end
