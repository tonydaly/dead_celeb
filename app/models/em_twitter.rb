require 'rubygems'
require 'em-http'
require 'em-http-oauth-request'
require 'oauth'
require 'json'
require 'oauth/client/em_http'
require 'awesome_print'
require 'yajl'

class TwitterStream
  def listen term
    http = EventMachine::HttpRequest.new('https://stream.twitter.com/1/statuses/filter.json').
      post(:body=>{"track"=>term},
           :head => {"Content-Type" => "application/x-www-form-urlencoded"},
           :timeout => -1) do |client|
             twitter_oauth_consumer.sign!(client, twitter_oauth_access_token)
           end

     http.errback    { puts "oops" }
     http.disconnect { puts "oops, dropped connection?" }

     parser = Yajl::Parser.new.tap do |p|
       p.on_parse_complete = lambda {|x| yield x["text"] }
     end

     http.stream do |chunk|
       parser << chunk
     end
  end

  def twitter_oauth_consumer
    @twitter_oauth_consumer ||= OAuth::Consumer.new(consumer_key, consumer_secret, :site => "http://twitter.com")
  end

  def twitter_oauth_access_token
    @twitter_oauth_access_token ||= OAuth::AccessToken.new(twitter_oauth_consumer, access_key, access_secret)
  end

  def filter_url
    'http://stream.twitter.com/1/statuses/filter.json'
  end

  #consumer
  def consumer_key
    '6uM57iOvtBvbeGqpFeuTQ'
  end

  def consumer_secret
    'EJ1ACfTVe0BozKh1mT0HmSSSLbyaApNMQHROwW4'
  end

  #access
  def access_key
    '28869726-GBGpzaPFoMPXlIeBJZk4ubuc7rmUmXRcAtgtPVE8T'
  end

  def access_secret
    'FRpwYXjsvpu1OicjckuEY7Sao7BdjqpeRqpKhLG48'
  end
end
