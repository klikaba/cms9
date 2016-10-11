module Cms9
  class Post < ApplicationRecord
    belongs_to :post_definition
    has_many   :fields, dependent: :destroy

    accepts_nested_attributes_for :fields

    def field(name)
      post_field = Cms9::PostField.where(name: name, post_definition: self.post_definition).first
      return Cms9::Field.where(post: self, post_field: post_field).first
    end

  end
end
