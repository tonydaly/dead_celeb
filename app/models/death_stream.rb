class DeathStream
  def initialize celeb, user=nil
    stream = TwitterStream.new

    stream.listen("#{celeb.name}") do |tweet|
      EventMachine.defer do
        begin
          count = $celebrities[celeb.name][:count] += 1
          puts "death count #{count}"

          $celebrities[celeb.name][:count] = 0

          twinterest = user ? "twinterest_#{user.id}" : "popular_twinterests"

          puts twinterest
          Pusher[twinterest].trigger_async('death',
              { name: celeb.name,
                url: "/celebrities/#{celeb.id}",

                tweet: tweet["text"],

                user: {
                  name:    tweet["user"]["name"],
                  profile: tweet["user"]["profile_image_url"]
                }
              })

        rescue StandardError => e
          puts "Some kind of error in EventMachine.defer #{e.message}"
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
