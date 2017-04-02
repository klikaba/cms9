module Cms9
  # Main applicaiton contoller
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :user_logout

    before_action :authorize

    def current_user
      current_user_ident = Cms9.configuration.current_user || :current_user
      parent = ::ApplicationController.new
      parent.request = request

      parent.send(current_user_ident) if parent.respond_to?(current_user_ident)
    end

    def user_logout
      config = Cms9.configuration.destroy_user_session
      logout_ident = config || :destroy_user_session
      parent = ::ApplicationController.new
      parent.request = request

      parent.send(logout_ident) if parent.respond_to?(logout_ident)
    end

    def authorize
      message = 'Implement cms9_admin? method in current_user context.
                 See https://github.com/klikaba/cms9'
      raise message unless current_user.try(:cms9_admin?)
    end
  end
end
