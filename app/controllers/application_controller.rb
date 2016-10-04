# application_controller.rb

class ApplicationController < Sinatra::Base
  helpers ApplicationHelper, TwitterHelper, UserHelper

  set :public_folder, 'public'

  # Set folder templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running test
  configure :production, :development do
    enable :logging
    set :sessions, true
    enable :sessions
    set :session_secret, General::SESSION_SECRET

    use OmniAuth::Builder do
      provider :twitter, TwitterConfig::CONSUMER_KEY, TwitterConfig::CONSUMER_SECRET
    end
  end

end

