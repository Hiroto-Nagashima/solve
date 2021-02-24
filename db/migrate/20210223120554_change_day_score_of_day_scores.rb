class ChangeDayScoreOfDayScores < ActiveRecord::Migration[5.2]
  def change
    change_column_default :day_scores, :day_score, default: 0
  end
end
# def up
#     change_column :day_scores, :day_score,:integer, default: 0
#   end

#   def down
#     change_column :day_scores, :day_score,:integer
#   end