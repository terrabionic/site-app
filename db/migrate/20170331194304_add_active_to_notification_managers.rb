class AddActiveToNotificationManagers < ActiveRecord::Migration
  def change
    add_column :notification_managers, :active, :boolean, :default => false
  end
end
