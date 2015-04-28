class AddResponsesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :response1, :text
    add_column :questions, :response2, :text
  end
end
