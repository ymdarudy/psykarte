class AddIndexToFavorite < ActiveRecord::Migration[6.1]
  def change
    add_index :favorites, [:user_id, :psychology_test_id], unique: true
  end
end
