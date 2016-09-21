class PostField < ApplicationRecord
  belongs_to :post_definition

  def self.all_types
    return ['text', 'text_area', 'number', 'date']
  end
end
