class AddDayScoreIdToScores < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :day_score_id, :integer
  end
end
