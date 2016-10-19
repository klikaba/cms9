module Cms9
  class WelcomeController < Cms9::ApplicationController
    def index
      @events = Cms9Events.new.timeline_events
    end
  end
end
