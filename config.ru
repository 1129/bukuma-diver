if ENV['RACK_ENV'] != 'development'
  raise 'Invalid RACK_ENV'
end

require 'dotenv'
Dotenv.load(".env.#{ENV['RACK_ENV']}")

require File.expand_path('../development-proxy.rb', __FILE__)
require File.expand_path('../api/app.rb', __FILE__)

map '/api' do
  run Sinatra::Application
end

map '/' do
  run DevelopmentProxy
end
