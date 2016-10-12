module Cms9
  module ApplicationHelper

    def cms9_field(field)
      case field.post_field.field_type
        when 'text', 'text_area', 'number', 'select_single', 'date', 'time', 'date_time'
          return field.value.blank? ? '' : field.to_s
        when 'select_multiple'
          return field.value.blank? ? '' : "[#{field.value.split(',')}]"
        when 'image'
          return field.value.blank? ? '' : image_tag(field.to_s)
        else
          return '<nil>'
      end
    end    

  end
end
