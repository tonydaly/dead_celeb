class DeathStream
  def initialize celeb
    stream = TwitterStream.new

    stream.listen("is dead") do |tweet|
      EventMachine.defer do
        begin
          count = $celebrities[celeb.name][:count] += 1
          puts "death count #{count} #{tweet}"


          if count > 10
            ap "#{celeb.name} is dead - time to throw a party"
            $celebrities[celeb.name][:count] = 0
            celeb.update_attribute dead: true

            Pusher['dead_celebs'].trigger_async('death', {message: "#{celeb.name}: #{tweet}"})
          end

        rescue StandardError => e
          puts "Some kind of error in EventMachine.defer #{e.message} #{e.inspect}"
        end
      end

      EM.add_periodic_timer(60){ $celebrities[celeb.name][:count] = 0 }
    end

    $celebrities[celeb.name]= {}

    $celebrities[celeb.name][:stream] = stream
    $celebrities[celeb.name][:count]  = 0
  end
end
