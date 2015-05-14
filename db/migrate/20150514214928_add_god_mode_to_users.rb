class AddGodModeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :god_mode, :boolean
  end
end
