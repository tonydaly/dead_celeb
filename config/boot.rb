# Defines our constants
PADRINO_ENV  = ENV['PADRINO_ENV'] ||= ENV['RACK_ENV'] ||= 'development'  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

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
end

##
# Add your after load hooks here
#
Padrino.after_load do
end

Padrino.load!

$celebrities = {}

twilio_config = YAML.load_file("#{PADRINO_ROOT}/config/twilio.yml")[PADRINO_ENV]

Twilio::Config.setup \
  :account_sid  => twilio_config["account_sid"],
  :auth_token   => twilio_config["auth_token"]

EM.run do
  puts 'loading celebs'


  Celebrity.popular.each do |c|
    puts "adding celeb: #{c.name}"
    DeathStream.new c
  end if false

  Rack::Handler::Thin.run Padrino.application
end
