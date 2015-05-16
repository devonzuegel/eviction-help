class CreateJoinTableDefenseUser < ActiveRecord::Migration
  def change
    create_join_table :defenses, :users do |t|
      t.index [:defense_id, :user_id]
      t.index [:user_id, :defense_id]
    end
  end
end
