# twitter_controller.rb

require_relative '../../config/twitter'
require_relative '../models/tweet.rb'

class TwitterController < ApplicationController
  configure do
    enable :sessions
    enable :session
  end

  helpers do
    def current_user 
      !session[:iud].nil?
    end
  end

  before do
    pass if request.path_info =~ /^\/auth\//
    redirect to('/auth/twitter') unless current_user
  end

  get '/auth/twitter/callback' do
    session[:uid] = env['omniauth.auth']['uid']
    env['omniauth.auth']
  end

  get '/auth/failure' do
  end

  get '/login' do
    redirect to "/auth/twitter"
  end

end
