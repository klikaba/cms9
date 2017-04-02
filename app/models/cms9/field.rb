module Cms9
  # field model
  class Field < ApplicationRecord
    belongs_to :post_field
    belongs_to :post, optional: true
    dragonfly_accessor :image

    def to_s
      case post_field.field_type
      when 'text', 'text_area', 'number',
           'select_single', 'date', 'time', 'date_time' then value
      when 'select_multiple' then value.split(',')
      when 'image' then !image_uid.blank? ? image.url : ''
      else
        ''
      end
    end
  end
end
