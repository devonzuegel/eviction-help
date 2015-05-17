class AddFieldsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :other_problems, :text
    add_column :clients, :asked_for_repairs, :boolean
    add_column :clients, :repairs_made, :boolean
    add_column :clients, :further_information, :text
    add_column :clients, :offered_rent_before_deadline, :boolean
    add_column :clients, :offered_rent_date, :date
    add_column :clients, :offered_rent_amount, :integer
    add_column :clients, :offered_rent_method, :string
  end
end
