class AddPrevAndNextToQuestion < ActiveRecord::Migration
  def up
    change_table :questions do |t|
      t.references :prev
      t.references :next1
      t.references :next2
    end
  end
end
