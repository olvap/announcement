ENV['RACK_ENV'] = 'test'

require 'sinatra'
require 'twitter'

require 'sinatra/activerecord'
require_relative '../config/settings'

# pull in the helpers and controllers
Dir.glob('./app/helpers/*.rb').each {|file|  require file}

require_relative '../config/initialize-database'
Dir.glob('./app/models/*.rb').each {|file|  require file}

require './app/controllers/application_controller.rb'
Dir.glob('./app/controllers/*.rb').each {|file|  require file}

require 'minitest/autorun'
require 'minitest/pride'  
require 'minitest/benchmark'

require 'rack/test'

