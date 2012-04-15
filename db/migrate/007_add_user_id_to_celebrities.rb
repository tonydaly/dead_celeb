class AddUserIdToCelebrities < ActiveRecord::Migration
  def self.up
    change_table :celebrities do |t|
      t.integer :user_id
    end
  end
end
