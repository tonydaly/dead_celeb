class Celebrity < ActiveRecord::Base
  has_many :parties

  def self.dead
    where(dead: true)
  end

  def alive?
    !dead
  end

  def died!
    update_attribute :dead, true

    # Get all party owners and notify
    parties.collect(&:owner).each {|o| o.notify(self) }
  end
end
