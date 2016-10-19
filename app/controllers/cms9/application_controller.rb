module Cms9
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :user_logout

    before_action :authorize

    def current_user
      current_user_ident = Cms9.configuration.current_user || :current_user
      parent = ::ApplicationController.new
      parent.request = request

      if parent.respond_to?(current_user_ident)
        parent.send(current_user_ident)
      end
    end

    def user_logout
      logout_ident = Cms9.configuration.destroy_user_session || :destroy_user_session
      parent = ::ApplicationController.new
      parent.request = request

      if parent.respond_to?(logout_ident)
        parent.send(logout_ident)
      end
    end

    def authorize
      unless current_user.try(:cms9_admin?)
        raise 'Implement cms9_admin? method in current_user context. See https://github.com/klikaba/cms9'
      end
    end
  end
end
