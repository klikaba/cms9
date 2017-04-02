module Cms9
  # post field model
  class PostField < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 15 }
    validates :field_type, presence: true

    belongs_to :post_definition
    attr_accessor :multi_values

    def self.all_types
      [{ key: 'text', display_name: 'Text' },
       { key: 'text_area', display_name: 'Text Area' },
       { key: 'number', display_name: 'Number' },
       { key: 'select_single', display_name: 'Select Single' },
       { key: 'select_multiple', display_name: 'Select Multiple' },
       { key: 'date', display_name: 'Date' },
       { key: 'time', display_name: 'Time' },
       { key: 'date_time', display_name: 'Date & Time' },
       { key: 'image', display_name: 'Image' }]
    end
  end
end
