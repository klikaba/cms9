class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :navigation

  private
    def navigation
      @nav_list = PostDefinition.all
    end
end
