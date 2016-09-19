class PostField < ApplicationRecord
  belongs_to :post_definition

  def self.all_types
    return ['Text', 'Text Area']
  end
end
