class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def self.current_user
    return MyUser.new
  end
end

class MyUser
  def cms9_admin?
    return true
  end
end
