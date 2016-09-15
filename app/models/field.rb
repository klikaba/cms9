class Field < ApplicationRecord
  belongs_to :post
  belongs_to :post_field
end
