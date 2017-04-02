module Cms9
  # welcome controller
  class WelcomeController < Cms9::ApplicationController
    def index
      limit = params[:limit] ? params[:limit] : 10
      @events = Cms9Events.new.timeline_events(limit)
    end
  end
end
