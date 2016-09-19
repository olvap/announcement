class Tweet

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key         = TwitterConfig::CONSUMER_KEY
      config.consumer_secret      = TwitterConfig::CONSUMER_SECRET 
      config.access_token         = TwitterConfig::ACCESS_TOKEN
      config.access_token_secret  = TwitterConfig::ACCESS_TOKEN_SECRET
    end
    get_tweets
  end

  def first
    @tweets.first
  end

  def get_tweet n
    @tweets[n]
  end

  def collect
    @tweets
  end

  private
  @tweets

  def get_media_resource media
    if media.class == Twitter::Media::Video 
      [:content_type => media.video_info[:variants].first.attrs[:content_type], :url => media.video_info[:variants].first.attrs[:url]]
    elsif media.class == Twitter::Media::Photo
      [:content_type => "", :url => media.media_url]
    elsif media.class == Twitter::Media::AnimatedGif
      [:content_type => "", :url => ""]
    else
      [:content_type => "", :url => ""]
    end
  end

  def get_media tweet
    @media = []
    tweet.media.each do |m|
      @media = get_media_resource(m).first
    end
    @media
  end

  def get_tweets
    @client.search("#{TwitterConfig::HASH_TAG} -rt").collect do |t|
      title = t.text.split("\n")[0]
      price = t.text.split("\n")[1]
      image = t.text.split(TwitterConfig::HASH_TAG)[1]

      (@tweets ||= []).push(
          :id => t.id,
          :author_id => t.user.id,
          :author => t.user.screen_name, 
          :author_url => t.user.url, 
          :author_location => t.user.location, 
          :title => title, 
          :price => price, 
          :media => get_media(t)
      )
    end
  end

end
