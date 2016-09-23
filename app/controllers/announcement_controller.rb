# announcement_controller.rb

require_relative '../../config/twitter'
require_relative '../models/tweet.rb'

class AnnouncementController < ApplicationController

  post '/update' do
    @t = Tweet.new
    # filename = @params[:media][:filename]
    # media = @params[:media][:tempfile].path
    media = @params[:media][:tempfile].path
    @t.save_announcement(@params[:title], @params[:price], @params[:phone], @params[:message], File.new(media))
  end

  get '/' do
    # my index at announcement application
    @title = "announcement"
    ads = Tweet.new
    @tweet = ads.collect
    erb :"announcement/index"
  end

  get '/t/?:announcement?' do
    # this is information about the announcement
    # id = @params[:announcement]

    ads = Tweet.new
    @tweet = ads.get_tweet @params[:announcement].to_i

    erb :"announcement/announcement"
  end

end
