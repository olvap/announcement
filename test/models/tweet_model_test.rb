require_relative '../test_helper.rb'

class TweetTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    @t = Tweet.new
  end

  def test_first_tweet
    assert_equal @t.first[:content], ["Probando Postea", "4562389", "Funciona", "#DvwbW5"]
  end

  def test_size_tweet
    assert_equal @t.size, @t.collect.count
  end

end 

