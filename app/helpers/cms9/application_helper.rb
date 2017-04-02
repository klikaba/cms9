module Cms9
  # main application fields displaying helper
  module ApplicationHelper
    def cms9_field(field, options = {})
      check_type(field, options) if field.present?
    end

    def cms9_text_tag(model)
      model.to_s
    end

    def cms9_text_area_tag(model)
      raw(model.to_s)
    end

    def cms9_multiple_choice(model)
      model.value.to_s.split("\' ")[0].to_s
    end

    def cms9_image_tag(model, options = {})
      image_tag(model.image.url, options)
    end

    def cms9_number_tag(model)
      model.to_s
    end

    def cms9_select_single_tag(model)
      model.to_s
    end

    def cms9_date_tag(model)
      model.to_s
    end

    def cms9_time_tag(model)
      model.to_s
    end

    def cms9_date_time_tag(model)
      model.to_s
    end

    def check_type(field, options) # rubocop:disable CyclomaticComplexity
      case field.post_field.field_type
      when 'text', 'number', 'select_single', 'date', 'time', 'date_time'
        field_value(field) ? '' : cms9_text_tag(field)
      when 'text_area' then field_value(field) ? '' : cms9_text_area_tag(field)
      when 'select_multiple'
        field_value(field) ? '' : cms9_multiple_choice(field)
      when 'image' then field_blank(field) ? '' : cms9_image_tag(field, options)
      else
        '<unsupported type>'
      end
    end

    def field_blank(field)
      field.blank?
    end

    def field_value(field)
      field.value.blank?
    end
  end
end
