# announcement_controller.rb

class AnnouncementController < ApplicationController

  post '/update' do
    @t = Tweet.new
    media = @params[:media][:tempfile].path
    @t.save_announcement(@params[:title], @params[:price], @params[:phone], @params[:message], File.new(media))
  end

  get '/' do
    # my index at announcement application
    @title = "announcement"
    @ads = Ad.all

    @tweets_qty = @ads.size
    erb :"announcement/index"
  end

  get '/t/?:announcement?' do
    # this is information about the announcement
    # id = @params[:announcement]
    @tweet = Ad.find_by(tid: @params[:announcement])
    @user = User.find_by(uid: @tweet.uid )

    erb :"announcement/announcement"
  end

end
