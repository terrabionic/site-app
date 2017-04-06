class AddCodeToSubsectors < ActiveRecord::Migration
  def change
    add_column :subsectors, :code, :integer
  end
end
