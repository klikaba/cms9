class Post < ApplicationRecord
  belongs_to :post_definition
  has_many   :fields

  accepts_nested_attributes_for :fields, allow_destroy: true
end
