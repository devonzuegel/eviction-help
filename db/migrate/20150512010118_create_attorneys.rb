class CreateAttorneys < ActiveRecord::Migration
  def change
    create_table :attorneys do |t|
      t.string :office_address
      t.string :fax_number
      t.string :bar_number

      t.timestamps null: false
    end
  end
end
