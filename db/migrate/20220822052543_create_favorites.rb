class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :psychology_test, null: false, foreign_key: true

      t.datetime :created_at, precision: 6, null: false
    end
  end
end
