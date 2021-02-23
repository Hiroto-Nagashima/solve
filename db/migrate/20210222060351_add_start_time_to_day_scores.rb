class AddStartTimeToDayScores < ActiveRecord::Migration[5.2]
  def change
    add_column :day_scores, :start_time, :datetime
  end
end
