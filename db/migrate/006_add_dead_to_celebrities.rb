class AddDeadToCelebrities < ActiveRecord::Migration
  def self.up
    change_table :celebrities do |t|
      t.boolean :dead
    end
  end

  def self.down
    change_table :celebrities do |t|
      t.remove :dead
    end
  end
end
