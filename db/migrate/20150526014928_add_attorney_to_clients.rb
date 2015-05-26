class AddAttorneyToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :attorney, index: true, foreign_key: true
  end
end
