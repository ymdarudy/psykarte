class AddColumnToPsychologyTest < ActiveRecord::Migration[6.1]
  def change
    add_column :psychology_tests, :how_to_answer, :text, null: false, default: ""
  end
end
