class AddChangepasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :change_password, :boolean, :default => true
  end
end
