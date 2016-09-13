require_relative '../test_helper.rb'

class AnnouncementControllerTest < Minitest::Test
  include Rack::Test::Methods

  def app
    AnnouncementController
  end

  def test_index_announcement
    get '/'
    assert_equal 'announcement_controller.rb', last_response.body
  end

  def test_announcement_one
    get '/announcement_one'
    assert_equal 'ok announcement_one', last_response.body
  end
end 
