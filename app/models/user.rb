class User < ActiveRecord::Base
  def notify(celebrity)
    Twilio::SMS::create to: user.number,
      from: "+442071838724",
      body: "Congratulations #{celebrity.name} is dead. Time to throw a party."
  end
end
