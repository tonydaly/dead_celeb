# Defines our constants
PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)
  require 'yajl'

  require 'rubygems'
  require 'em-http'
  require 'em-http-oauth-request'
  require 'oauth'
  require 'json'
  require 'oauth/client/em_http'
  require 'awesome_print'
  require 'yajl'
  require 'eventmachine'



# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

Bundler.require(:default, PADRINO_ENV)

Pusher.app_id = '18557'
Pusher.key    = '3e82ccea5da2b7f29a25'
Pusher.secret = '2b51ae2d10dcfe2b9b3f'
##
# Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#

##
# Add your before load hooks here
#
Padrino.before_load do
  require 'yajl'

  require 'rubygems'
  require 'em-http'
  require 'em-http-oauth-request'
  require 'oauth'
  require 'json'
  require 'oauth/client/em_http'
  require 'awesome_print'
  require 'yajl'
  require 'eventmachine'



end

##
# Add your after load hooks here
#
Padrino.after_load do
  require 'yajl'

  require 'rubygems'
  require 'em-http'
  require 'em-http-oauth-request'
  require 'oauth'
  require 'json'
  require 'oauth/client/em_http'
  require 'awesome_print'
  require 'yajl'
  require 'eventmachine'



end

Padrino.load!


EM.run do
  puts "In event loop"
  stream = TwitterStream.new

  puts "Stream instantiated"

  stream.listen("asd") do |tweet|
    EventMachine.defer do
      puts "tweet received #{tweet}"

      Pusher['dead_celebs'].trigger_async('death', {message: tweet})
    end
  end

   Rack::Handler::Thin.run Padrino.application
end


