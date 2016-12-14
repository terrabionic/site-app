class AddNewBooleandoneToReply < ActiveRecord::Migration
  def change
    add_column :replies, :done, :boolean, default: false
  end
end
