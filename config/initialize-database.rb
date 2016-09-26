require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localshot",
  :username => "ggerman",
  :password => "gag262144",
  :database => "ads"
)


class User < ActiveRecord::Base
end

class App < Sinatra::Base
  set :database, {adapter: "sqlite3", database: "db/ads.sqlite3"}
end

