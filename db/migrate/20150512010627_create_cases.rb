class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :case_number
      t.integer :rent_due

      t.timestamps null: false
    end
  end
end
