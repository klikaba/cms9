module Cms9
  class Field < ApplicationRecord
    belongs_to :post_field
    belongs_to :post, optional: true
    dragonfly_accessor :image

    def to_s
      case self.post_field.field_type
        when 'text', 'text_area', 'number', 'select_single', 'date', 'time', 'date_time'
          return self.value
        when 'select_multiple'
          return self.value.split(',')
        when 'image'
          return self.image.url
        else
          return '<nil>'
      end
    end
  end
end
