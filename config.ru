# config.ru
require 'sinatra/base'


# pull in the helpers and controllers
Dir.glob('./app/helpers/*.rb').each {|file|  require file}
require './app/controllers/application_controller.rb'
Dir.glob('./app/controllers/*.rb').each {|file|  require file}

# map the controller to routes
# map('/') { run ApplicationController }
map('/') { run AnnouncementController }

