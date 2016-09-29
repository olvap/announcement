# settings.rb

module Database
  ADAPTER = "mysql2"
  HOST = "localhost"
  NAME = "" # database name
  USER = "" # user name
  PASSWORD = ""
end

module TwitterConfig
  HASH_TAG             = "" # hash tag for search tweets

=begin
  Twitter Config information
=end

  CONSUMER_KEY         = ""
  CONSUMER_SECRET      = ""
  ACCESS_TOKEN         = ""
  ACCESS_TOKEN_SECRET  = ""
end

module General
  SESSION_SECRET = ""
end
