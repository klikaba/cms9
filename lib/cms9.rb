require "cms9/engine"
require "dragonfly"

module Cms9
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :current_user

    def initialize
      @current_user = false
    end
  end
end
