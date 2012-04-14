class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.integer :celebrity_id
      t.integer :owner_id
      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
