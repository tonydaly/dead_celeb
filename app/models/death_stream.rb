class DeathStream
  def initialize celeb
    stream = TwitterStream.new

    stream.listen("is dead") do |tweet|
      EventMachine.defer do
        begin
          count = $celebrities[celeb.name][:count] += 1
          puts "death count #{count} #{tweet}"


            ap "#{celeb.name} is dead - time to throw a party"
            $celebrities[celeb.name][:count] = 0

            Thread.new do
              celeb.update_attribute :dead, true
            end

            Pusher['dead_celebs'].trigger_async('death', {message: "#{celeb.name}: #{tweet}"})

        rescue StandardError => e
          puts "Some kind of error in EventMachine.defer #{e.message} "
          puts e.backtrace
        end
      end

      EM.add_periodic_timer(60){ $celebrities[celeb.name][:count] = 0 }
    end

    $celebrities[celeb.name]= {}

    $celebrities[celeb.name][:stream] = stream
    $celebrities[celeb.name][:count]  = 0
  end
end
