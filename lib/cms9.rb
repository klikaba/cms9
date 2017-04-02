require 'cms9/engine'
require 'dragonfly'

# main cms9 module
module Cms9
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
  # configuration
  class Configuration
    attr_accessor :current_user, :destroy_user_session

    def initialize
      @current_user = false
      @destroy_user_session = false
    end
  end
end

require 'sdk/cms9'
