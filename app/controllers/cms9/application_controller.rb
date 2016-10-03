module Cms9
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    before_filter :authorize

    def current_user
      current_user_ident = Cms9.configuration.current_user || :current_user
      if ::ApplicationController.respond_to?(current_user_ident)
        ::ApplicationController.send(current_user_ident)
      else
        return Cms9::User.new
      end
    end

    def authorize
      unless current_user.cms9_admin?
        raise 'Missing cms9_admin? implementation in current_user'
      end
    end
  end

  class User
    def cms9_admin?
      return true
    end
  end

end
