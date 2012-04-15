class User < ActiveRecord::Base
  has_many :celebrities

  def twinterests
    celebrities.map &:name
  end

  def notify(celebrity)
    Twilio::SMS::create to: user.number,
      from: "+442071838724",
      body: "Your twinterest #{celebrity.name} has reached 10 tweets per minute.
      Go check it out"
  end
end
