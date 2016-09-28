# twitter_controller.rb

require_relative '../models/tweet.rb'

class TwitterController < ApplicationController
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
  session[:authed] = true
  session[:username] = request.env['omniauth.auth']['info']['nickname']
=begin
    session[:uid] = env['omniauth.auth']['uid']
    env['omniauth.auth']
=end
  request.env['omniauth.auth'].to_s << "\n\n"
  end

  get '/auth/failure' do
  end

  get '/login' do
    redirect to "/auth/twitter"
  end

end
