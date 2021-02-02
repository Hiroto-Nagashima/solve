class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :post_id
      t.integer :genre
      t.string :correct_choice
      t.string :wrong_choices
      t.text :explanation
      t.string :direction
      t.text :question
      t.timestamps
    end
  end
end
