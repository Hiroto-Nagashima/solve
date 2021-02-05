class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :relationships,  [:follower_id, :user_id], unique: true
  end
end
