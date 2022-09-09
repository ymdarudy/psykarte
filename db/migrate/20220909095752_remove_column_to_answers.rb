class RemoveColumnToAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :updated_at
  end
end
