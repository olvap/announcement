# twitter_helper.rb

module TwitterHelper
  def current_user 
    (defined? session)? !session[:uid].nil? : false
  end

  def get_user(uid)
    User.find_by(uid: uid)
  end

end
