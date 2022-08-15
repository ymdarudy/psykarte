class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :title, null: false
      t.integer :choice_min_point, null: false
      t.integer :choice_max_point, null: false
      t.string :choice_min_word, null: false, limit: 30
      t.string :choice_max_word, null: false, limit: 30
      t.boolean :point_reversal, null: false, default: false
      t.references :personality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
