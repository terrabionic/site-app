class CreateJoinTableTypeCompany < ActiveRecord::Migration
  def change
    create_join_table :Types, :Companies do |t|
      # t.index [:type_id, :company_id]
      # t.index [:company_id, :type_id]
    end
  end
end
