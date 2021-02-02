class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :score_id
      t.integer :question_id
      t.string :personal_answer

      t.timestamps
    end
  end
end
