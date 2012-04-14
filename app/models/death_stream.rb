class DeathStream
  def initialize celeb
    stream = TwitterStream.new

    stream.listen("is dead") do |tweet|
      EventMachine.defer do
        puts "tweet received #{tweet}"
        count = $celebrities[celeb.name][:count] += 1
        puts "death count #{count}"

        Pusher['dead_celebs'].trigger('death', {message: "#{celeb.name}: #{tweet}"})

        if count > 10
          ap "#{celeb.name} is dead - time to throw a party"
          $celebrities[celeb.name][:count] = 0

        end
      end

      EM.add_periodic_timer(60){ $celebrities[celeb.name][:count] = 0 }
    end

    $celebrities[celeb.name]= {}

    $celebrities[celeb.name][:stream] = stream
    $celebrities[celeb.name][:count]  = 0
  end
end
