class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :street_address
      t.string :mailing_address
      t.string :city
      t.string :zip_code
      t.string :branch_name
      t.string :county

      t.timestamps null: false
    end
  end
end
