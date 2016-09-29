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

    uid = request.env['omniauth.auth'].to_hash['uid']
    session[:uid] = uid

    info = request.env['omniauth.auth']['info']
    urls = info.urls.to_hash

=begin
- information come from Twitter
    info.nickname
    info.name
    info.location
    info.image
    info.description
    urls['Website']
    urls['Twitter']
=end    

    u = User.new 

    u.uid = uid
    u.name = info.name
    u.nickname = info.nickname
    u.location = info.location
    u.image_url = info.image
    u.website = urls['Website']
    u.url = urls['Twitter']
    u.description = info.description
    (u.save)? "ok" : "fail"
  


    # redirect to 'http://127.0.0.1:9393'
  end

  get '/auth/failure' do
  end

  get '/login' do
    redirect to '/auth/twitter'
  end

end
