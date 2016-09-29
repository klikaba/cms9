class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def self.current_user
    {username: "hamo"}
  end
end
