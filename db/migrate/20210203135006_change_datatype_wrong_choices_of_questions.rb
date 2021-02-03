class ChangeDatatypeWrongChoicesOfQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :wrong_choices, :text
  end
end
