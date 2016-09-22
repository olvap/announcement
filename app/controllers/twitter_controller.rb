# twitter_controller.rb

require_relative '../../config/twitter'
require_relative '../models/tweet.rb'

class TwitterController < ApplicationController
  helpers TwitterHelper

  def current_user 
   !session[:iud].nil?
 end

 before do
   pass if request.path_info =~ /^\/auth\//
   redirect to('/auth/twitter') unless current_user
 end


  get '/auth/twitter/callback' do
  end

  get '/auth/failure' do
  end

end
