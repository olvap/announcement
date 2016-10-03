class Tweet

=begin
data for testing client

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key         = "GDV5cCctzhsysUNIehVKN7xa9"
      config.consumer_secret      = "t6qN8lIQeUQvicdeYhYdXtdNS8JcgDce9Ae50rzovIQPxJh3wu"
      config.access_token         = "135599641-HvRiyaM5n0IBZK3JOAUoxQLgDv8VaXmzHNDw2OIz"
      config.access_token_secret  = "ceuvp7N5KOLuappJ6ujzErlPmM0sFCAYpBLH5vvvQXMLC"
    end

    @client.search("#DvwbW5 -rt").collect
=end

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key         = TwitterConfig::CONSUMER_KEY
      config.consumer_secret      = TwitterConfig::CONSUMER_SECRET 
      config.access_token         = TwitterConfig::ACCESS_TOKEN
      config.access_token_secret  = TwitterConfig::ACCESS_TOKEN_SECRET
    end
    get_tweets
  end

  def save_announcement(title, price, phone, message, media)
    tweet = "#{title}\n#{phone}\n#{message}\n#{TwitterConfig::HASH_TAG}\n"
    @client.update_with_media(tweet, media)
  end

  def first
    @tweets.first
  end

  def get_tweet n
    @tweets.find { |t| t[:id] == n }
  end

  def collect
    @tweets
  end

  def size
    @tweets.count
  end

  private

  def get_tweets
    @client.search("#{TwitterConfig::HASH_TAG}").collect do |t|
      title = t.text.split("\n")[0]
      content  = t.text.split("\n")
      price =  t.text.split("\n")[1]
      phone =  t.text.split("\n")[2]

      # image = t.text.split(TwitterConfig::HASH_TAG)[1]
      (@tweets ||= []).push(
          :id => t.id,
          :author_id => t.user.id,
          :author_verified => t.user.verified,
          :username => t.user.screen_name,
          :author_pic => t.user.profile_image_url,
          :author_name => t.user.name, 
          :author_url => t.user.url, 
          :author_description => t.user.description, 
          :author_location => t.user.location, 
          :author_created_at => t.user.created_at,
          :author_banner_url => t.user.profile_banner_url,
          :title => title,
          :price => price,
          :phone => phone,
          :content => content, 
          :media => t.media,
          :value => t.user.class
      )
    end
  end

end
