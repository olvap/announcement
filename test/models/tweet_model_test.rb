require_relative '../test_helper.rb'

class TweetTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    @t = Tweet.new
  end

  def test_first_tweet
    assert_equal @t.first[:content], ["RT @gsgerman: 1º line", "2º line", "3º line", "#DvwbW5 https://t.co/1LirwvHb4W"]
  end

  def test_size_tweet
    assert_equal @t.size, @t.collect.count
  end

end 

