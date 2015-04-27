class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.text :description
      t.boolean :required

      t.timestamps null: false
    end
  end
end
