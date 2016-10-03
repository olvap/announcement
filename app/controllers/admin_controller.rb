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

      @u = User.new
      @u.uid = t[:author_id]
      @u.name = t[:username]
      @u.nickname = t[:author_name]
      @u.location = t[:author_location]
      @u.image_url = t[:author_pic]
      @u.url = t[:author_url]
      @u.description = t[:author_description]
      @u.twitter_created_at = t[:author_created_at]
      
      @u.save
    end
    'UPDATED'
  end

end
