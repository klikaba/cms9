class PostField < ApplicationRecord
  belongs_to :post_definition
  attr_accessor :multi_values

  def self.all_types
    return ['text', 'text_area', 'number', 'select_single', 'select_multiple', 'date', 'time', 'date_time']
  end
end
