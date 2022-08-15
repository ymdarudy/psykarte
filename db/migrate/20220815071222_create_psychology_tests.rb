class CreatePsychologyTests < ActiveRecord::Migration[6.1]
  def change
    create_table :psychology_tests do |t|
      t.string :title, null: false, limit: 255
      t.text :description, null: false
      t.text :referrer, null: false
      t.text :referrer_url
      t.text :thumbnail

      t.timestamps
    end
  end
end
