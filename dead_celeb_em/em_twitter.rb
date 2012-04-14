require 'rubygems'
require 'em-http'
require 'em-http-oauth-request'
require 'oauth'
require 'json'

class TwitterStream

  def initialize(term)
    @term = term
    @buffer = ""
    listen
  end

  def on_tweet
    lambda{ |o| puts o; puts o['text'] }
  end


  private
  def listen
    http = EventMachine::HttpRequest.new(filter_url)

    oauth_helper = OAuth::Client::Helper.new(http, oauth_params)

    http.options[:head] = (http.options[:head] || {}).merge!({"Authorization" => oauth_helper.header})
    http.options.merge!({ :query => { "track" => @term }})

    parser = Yajl::Parser.new.tap { |p| p.on_parse_complete = on_tweet }

    http.stream { |chunk| parser << chunk }
  end

  def oauth_params
    {:consumer => consumer, :token => oauth[:access_token]}
  end

  def filter_url
   'http://stream.twitter.com/1/statuses/filter.json'
  end

  def home_timeline_url
    'http://api.twitter.com/1/statuses/home_timeline.json'
  end

  def oauth
    {
      :consumer_token    => '6uM57iOvtBvbeGqpFeuTQ',
      :consumer_secret => 'EJ1ACfTVe0BozKh1mT0HmSSSLbyaApNMQHROwW4',

      :access_token      => '28869726-GBGpzaPFoMPXlIeBJZk4ubuc7rmUmXRcAtgtPVE8T',
      :access_secret   => 'FRpwYXjsvpu1OicjckuEY7Sao7BdjqpeRqpKhLG48'
    }
  end

  def consumer
    OAuth::Consumer.new(oauth[:consumer_token], oauth[:consumer_secret],
                        :site => 'http://twitter.com')
  end

  def access_token
    OAuth::AccessToken.new(consumer, oauth[:access_token], oauth[:access_secret])
  end


end


EM.run {
  stream = TwitterStream.new(ARGV[0] || 'dead')
  stream.on_tweet { |tweet|
    puts "New tweet: #{tweet}"
  }
}
