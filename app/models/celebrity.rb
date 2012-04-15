class Celebrity < ActiveRecord::Base
  has_many :parties

  def self.dead
    where(dead: true)
  end

  def alive?
    !dead
  end
end
