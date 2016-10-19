module Cms9
  class Event < ApplicationRecord
    belongs_to :post
    belongs_to :post_definition
    belongs_to :post_field
  end
end
