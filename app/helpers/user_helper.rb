# twitter_helper.rb

module UserHelper
  def get_user_location uid
    u = User.find_by(uid: uid)
    u.location
  end

  def get_user_url uid
    u = User.find_by(uid: uid)
    u.url
  end

  def get_username uid
    u = User.find_by(uid: uid)
    u.nickname
  end
end
