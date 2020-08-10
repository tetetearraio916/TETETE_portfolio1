class RenameContentColumnToAnswers < ActiveRecord::Migration[6.0]
  def change
    rename_column :answers, :content, :comment
  end
end
