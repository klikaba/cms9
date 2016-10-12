module Cms9
  class Post < ApplicationRecord
    belongs_to :post_definition
    has_many   :fields, dependent: :destroy

    accepts_nested_attributes_for :fields

    def field(name)
      @cache_fields ||= self.fields.joins(:post_field).includes(:post_field)
                            .map { |field| [field.post_field.name, field] }
                            .to_h
      @cache_fields[name]
    end

  end
end
