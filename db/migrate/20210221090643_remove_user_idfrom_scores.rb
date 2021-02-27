class RemoveUserIdfromScores < ActiveRecord::Migration[5.2]
  def change
    remove_column :scores, :user_id, :integer
  end
end
