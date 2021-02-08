class AddChoicesToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :first_wrong_choice, :string
    add_column :questions, :second_wrong_choice, :string
  end
end
