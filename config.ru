# config.ru
require 'sinatra'
require 'omniauth-twitter'
require 'twitter'

=begin
Database configuration section
mysql2 engine
ads name
=end
require 'sinatra/activerecord'
require_relative 'config/settings'

# pull in the helpers and controllers
Dir.glob('./app/helpers/*.rb').each {|file|  require file}

require_relative 'config/initialize-database'
Dir.glob('./app/models/*.rb').each {|file|  require file}

require './app/controllers/application_controller.rb'
Dir.glob('./app/controllers/*.rb').each {|file|  require file}

# map the controller to routes
# map('/') { run ApplicationController }

map('/t/:announcement') { run AnnouncementController }
map('/') { run AnnouncementController }

map('/login') { run TwitterController }
map('/auth/failure') { run TwitterController }
map('/callback') { run TwitterController }

