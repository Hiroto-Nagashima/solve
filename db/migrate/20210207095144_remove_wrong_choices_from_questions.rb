class RemoveWrongChoicesFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :wrong_choices, :text
  end
end
