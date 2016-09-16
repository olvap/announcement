# tweet_controller.rb

require_relative '../../config/twitter'
require_relative '../models/tweet.rb'

class TweetController
  def get_tweets 
    @tweets = Tweet.new
    @tweets.collect
  end

  def tweet number = nil
    tweet = Tweet.new
    if number 
      tweet.get_tweet number
    else
      tweet.first
    end
  end

end

