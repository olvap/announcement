# admin_controllers.rb

class AdminController < ApplicationController
  get '/' do
    'Administrator'
  end

  get '/update' do
    @tweets = Tweet.new

    @ads = Ad.new
    
    @tweets.collect.each do |t|
      @ads.tid = t[:id]
      @ads.uid = t[:author_id]
      @ads.title = t[:title]
      @ads.price = t[:price]
      @ads.phone = t[:phone] 
      @ads.message = t[:content]

      if !t[:media].empty?
        media = t[:media].first
        if media.class == Twitter::Media::Video
          @ads.video = get_video_url media
        elsif media.class == Twitter::Media::Photo
          @ads.image = get_image_url media
        end
      end
      @ads.enabled = false
      @ads.save

      uid = t[:author_id]
      @us = User.find_by(uid: uid)

      if @us.id
        User.update(@us.id, verified: t[:author_verified])
        User.update(@us.id, twitter_created_at: t[:author_created_at])
        User.update(@us.id, banner_url: t[:author_banner_url])
        User.update(@us.id, pic: t[:author_pic])
      else
        @u = User.new
        @u.uid = uid
        @u.nickname = t[:username]
        @u.name = t[:author_name]
        @u.location = t[:author_location]
        @u.image_url = t[:author_pic]
        @u.url = t[:author_url]
        @u.description = t[:author_description]
        @u.twitter_created_at = t[:author_created_at]
        
        @u.save
      end
    end
    'UPDATED'
  end

  get '/disabled' do
    @ads = Ad.all
    
    erb :"admin/disabled"
  end
end
