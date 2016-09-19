class Field < ApplicationRecord
  has_many :post
  has_many :post_field
end
