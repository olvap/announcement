ENV['RACK_ENV'] = 'test'

require 'sinatra'

# pull in the helpers and controllers
Dir.glob('./app/helpers/*.rb').each {|file|  require file}
require './app/controllers/application_controller.rb'
Dir.glob('./app/controllers/*.rb').each {|file|  require file}
Dir.glob('./app/models/*.rb').each {|file|  require file}

require 'minitest/autorun'
require 'minitest/pride'  
require 'minitest/benchmark'

require 'rack/test'

