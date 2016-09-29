module Cms9
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    before_filter :authorize

    def current_user
      ::ApplicationController.send(Cms9.configuration.current_user || :current_user)
    end

    def authorize
      unless current_user.cms9_admin?
        raise 'Missing cms9_admin? implementation in current_user'
      end
    end
  end
end
