require 'zlib'
require_relative 'settings'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
  :adapter  => Database::ADAPTER,
  :host     => Database::HOST,
  :username => Database::USER,
  :password => Database::PASSWORD,
  :database => Database::NAME
)

class App < Sinatra::Base
end

