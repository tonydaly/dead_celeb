class AddUidAndNicknameToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :uid
    t.string :nickname
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :uid
    t.remove :nickname
    end
  end
end
