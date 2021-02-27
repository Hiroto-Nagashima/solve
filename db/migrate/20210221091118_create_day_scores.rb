class CreateDayScores < ActiveRecord::Migration[5.2]
  def change
    create_table :day_scores do |t|
      t.integer :user_id
      t.integer :day_score

      t.timestamps
    end
  end
end
