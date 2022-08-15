class CreateSupplementaryInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :supplementary_informations do |t|
      t.references :psychology_test, null: false, foreign_key: true
      t.string :site_name
      t.string :site_url

      t.timestamps
    end
  end
end
