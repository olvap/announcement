require_relative '../test_helper.rb'

class AnnouncementControllerTest < Minitest::Test
  include Rack::Test::Methods

  def app
    AnnouncementController
  end

  def test_index_announcement
    # testing the varibles included into the 
    # body in the main page
    get '/'
    assert_includes last_response.body, 'announcement'
  end

  def test_announcement_one
    get '/announcement_one'
    assert_equal 'ok announcement_one', last_response.body
  end
end 
