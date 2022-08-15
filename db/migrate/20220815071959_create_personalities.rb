class CreatePersonalities < ActiveRecord::Migration[6.1]
  def change
    create_table :personalities do |t|
      t.references :psychology_test, null: false, foreign_key: true
      t.string :name, null: false, limit: 30
      t.text :description, null: false
      t.integer :scoring_system, null: false, default: 1

      t.timestamps
    end
  end
end
