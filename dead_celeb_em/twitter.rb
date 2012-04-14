#encoding: utf-8
require 'rubygems'
require 'twitter/json_stream'

EventMachine::run {
  stream = Twitter::JSONStream.connect(
    :path => '/1/statuses/home_timeline.json',

    :oauth   => {
      :consumer_key    => '6uM57iOvtBvbeGqpFeuTQ',
      :consumer_secret => 'EJ1ACfTVe0BozKh1mT0HmSSSLbyaApNMQHROwW4',
      :access_key      => '28869726-GBGpzaPFoMPXlIeBJZk4ubuc7rmUmXRcAtgtPVE8T',
      :access_secret   => 'FRpwYXjsvpu1OicjckuEY7Sao7BdjqpeRqpKhLG48'
      }
    )

  stream.each_item do |item|
    # Do someting with unparsed JSON item.
    puts "message received"
    puts item
  end

  stream.on_error do |message|
    # No need to worry here. It might be an issue with Twitter.
    # Log message for future reference. JSONStream will try to reconnect after a timeout.
    puts "on_error: #{message}"
  end

  stream.on_max_reconnects do |timeout, retries|
    puts "Max reconnects reached"
    puts timeout
    puts retries
    EM.stop
    exit -1
    # Something is wrong on your side. Send yourself an email.
  end
}

