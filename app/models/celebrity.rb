class Celebrity < ActiveRecord::Base
  belongs_to :user

  def self.popular
    where(user_id: nil)
  end

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
