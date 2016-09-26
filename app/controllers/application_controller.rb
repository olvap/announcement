# application_controller.rb
class ApplicationController < Sinatra::Base

  register Sinatra::ConfigFile
  config_file '../../config/config.yml'
  set :environment, :development

  helpers ApplicationHelper

  register Sinatra::ActiveRecordExtension
  set :database, {adapter: "sqlite3", database: "ads.sqlite3"}


  set :public_folder, 'public'

  # Set folder templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running test
  configure :production, :development do
    enable :logging

    set :sessions, true
    enable :sessions

    use Rack::Session::Cookie, secret: settings.session_secret
    use OmniAuth::Builder do
      provider :twitter, TwitterConfig::CONSUMER_KEY, TwitterConfig::CONSUMER_SECRET
    end
  end
end

