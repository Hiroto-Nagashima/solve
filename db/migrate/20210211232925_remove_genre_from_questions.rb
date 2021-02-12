class RemoveGenreFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :genre, :integer
  end
end
