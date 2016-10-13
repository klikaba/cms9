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
      unless current_user.cms9_admin?
        redirect_to '/'
      end
      @missing_implementation = current_user.instance_of?(Cms9::User)
      Rails.logger.error "\n  *************************************************************************"
      Rails.logger.error "  *                                                                       *"
      Rails.logger.error "  *  \033[31mYOUR CMS IS OPENED FOR EDITING!!!\033[0m                                    *"
      Rails.logger.error "  *  \033[31mPLEASE IMPLEMENT cms9_admin? METHOD FOR current_user!\033[0m                *"
      Rails.logger.error "  *                                                                       *"
      Rails.logger.error "  *************************************************************************\n"
    end

    private
      def parent_controller
        controller = ::ApplicationController.new
        controller.request = request
      end
  end

  class User
    def cms9_admin?
      return true
    end
  end

end
