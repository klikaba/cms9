module Cms9
  class Field < ApplicationRecord
    belongs_to :post_field
    belongs_to :post, optional: true
    dragonfly_accessor :image
  end
end
