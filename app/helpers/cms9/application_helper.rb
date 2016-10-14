module Cms9
  module ApplicationHelper

    def cms9_field(field, options={})
      if field.present?
        case field.post_field.field_type
          when 'text', 'number', 'select_single', 'date', 'time', 'date_time'
            return field.value.blank? ? '' : cms9_text_tag(field)
          when 'text_area'
            return field.value.blank? ? '' : cms9_text_area_tag(field)
          when 'select_multiple'
            return field.value.blank? ? '' : cms9_multiple_choice(field)
          when 'image'
            return field.blank? ? '' : cms9_image_tag(field, options)
          else
            return '<unsupported type>'
        end
      else
        return '<unsupported type>'
      end
    end   
   
    def cms9_text_tag(model)
      return model.to_s 
    end 

    def cms9_text_area_tag(model)      
        return raw(model.to_s)
    end 

    def cms9_multiple_choice(model)     
      @m = model.value.to_s.split("\' ")[0]
      return  "#{@m}" 
    end 

    def cms9_image_tag(model, options={})
      return image_tag(model.image.url, options)
    end 

    def cms9_number_tag(model)
      return model.to_s 
    end 

    def cms9_select_single_tag(model)
      return model.to_s 
    end 

    def cms9_date_tag(model)
      return model.to_s 
    end

    def cms9_time_tag(model)
      return model.to_s 
    end

    def cms9_date_time_tag(model)
      return model.to_s 
    end
  end
end
