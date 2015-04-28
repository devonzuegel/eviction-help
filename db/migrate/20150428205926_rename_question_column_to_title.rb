class RenameQuestionColumnToTitle < ActiveRecord::Migration
  def change
    rename_column :questions, :question, :title
  end
end