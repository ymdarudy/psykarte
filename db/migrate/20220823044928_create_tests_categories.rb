class CreateTestsCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_categories do |t|
      t.references :psychology_test, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.datetime :created_at, precision: 6, null: false
    end
  end
end
