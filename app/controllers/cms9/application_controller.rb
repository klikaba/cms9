module Cms9
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    before_action :authorize

    def current_user
      current_user_ident = Cms9.configuration.current_user || :current_user

      parent = parent_controller
      if parent.respond_to?(current_user_ident)
        parent.send(current_user_ident)
      else
        return Cms9::User.new
      end
    end

    def authorize
      @missing_implementation = current_user.instance_of?(Cms9::User)
      # TODO - Log missing implementation ...
    end

    private
      def parent_controller
        controller = ::ApplicationController.new
        controller.request = request
      end
  end

  class User
    def cms9_admin?
      return false
    end
  end

end
