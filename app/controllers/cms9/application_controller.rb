module Cms9
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  end
end
