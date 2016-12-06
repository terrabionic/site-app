class AddSolutionToPossibleAnswer < ActiveRecord::Migration
  def change
    add_column :possible_answers, :solution, :text
  end
end
