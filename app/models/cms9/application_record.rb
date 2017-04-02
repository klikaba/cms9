module Cms9
  # main application model
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
