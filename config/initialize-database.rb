require 'sinatra/activerecord'

class User < ActiveRecord::Base
end

class App < Sinatra::Base
  set :database, {adapter: "sqlite3", database: "ads.sqlite3"}
end

