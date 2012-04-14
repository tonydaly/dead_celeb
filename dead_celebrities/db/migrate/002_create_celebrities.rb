class CreateCelebrities < ActiveRecord::Migration
  def self.up
    create_table :celebrities do |t|
      t.string :name
      t.string :twitter
      t.timestamps
    end
  end

  def self.down
    drop_table :celebrities
  end
end
