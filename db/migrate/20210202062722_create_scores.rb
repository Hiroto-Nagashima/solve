class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :score

      t.timestamps
    end
  end
end
