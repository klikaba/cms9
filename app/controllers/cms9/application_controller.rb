module Cms9
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    before_action :authorize

    def current_user
      current_user_ident = Cms9.configuration.current_user || :current_user
      parent = ::ApplicationController.new
      parent.request = request

      if parent.respond_to?(current_user_ident)
        parent.send(current_user_ident)
      end
    end

    def authorize
      unless current_user.try(:cms9_admin?)
        Rails.logger.error "\n  *************************************************************************"
        Rails.logger.error "  *                                                                       *"
        Rails.logger.error "  *  \033[31mYOUR CMS IS OPENED FOR EDITING!!!\033[0m                                    *"
        Rails.logger.error "  *  \033[31mPLEASE IMPLEMENT cms9_admin? METHOD FOR current_user!\033[0m                *"
        Rails.logger.error "  *                                                                       *"
        Rails.logger.error "  *************************************************************************\n"

        redirect_to '/'
      end
    end
  end
end
