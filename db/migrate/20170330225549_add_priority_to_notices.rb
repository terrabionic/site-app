class AddPriorityToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :priority, :boolean, :default => false
  end
end
