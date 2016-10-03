require_relative '../test_helper.rb'
require_relative '../../app/helpers/twitter_helper'

class TwitterHelperTest < Minitest::Test
  include TwitterHelper
 
  def test_current_user_loggin
    assert_equal current_user, false
  end

  def test_current_user_loggin_session
  s = App.new
  assert_equal current_user, true
  end
end
