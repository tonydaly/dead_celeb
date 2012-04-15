class Celebrity < ActiveRecord::Base
  has_many :parties

  def self.dead
    where(dead: true)
  end
end
