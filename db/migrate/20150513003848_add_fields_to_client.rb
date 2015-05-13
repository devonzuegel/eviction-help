class AddFieldsToClient < ActiveRecord::Migration
  def change
    add_column :clients,  :telephone,       :string
    add_column :clients,  :street_address,  :string
    add_column :clients,  :mailing_address, :string
    add_column :clients,  :landlord,        :string
    add_column :clients,  :other_people,    :string
  end
end
