class AddKindToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :kind, :string
  end
end
