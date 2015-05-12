class CreateAttorneys < ActiveRecord::Migration
  def change
    create_table :attorneys do |t|
      t.references :user, index: true, foreign_key: true
      t.string :office_address
      t.string :fax_number
      t.string :bar_number

      t.timestamps null: false
    end
  end
end
