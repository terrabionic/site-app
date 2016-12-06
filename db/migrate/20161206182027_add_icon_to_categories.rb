class AddIconToCategories < ActiveRecord::Migration
  def change
  end
  add_attachment :categories, :icon
end
