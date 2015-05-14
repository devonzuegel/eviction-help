class CreateDefenses < ActiveRecord::Migration
  def change
    create_table :defenses do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
