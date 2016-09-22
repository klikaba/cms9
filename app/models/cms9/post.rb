module Cms9
  class Post < ApplicationRecord
    belongs_to :post_definition
    has_many   :fields, dependent: :destroy

    accepts_nested_attributes_for :fields
  end
end
