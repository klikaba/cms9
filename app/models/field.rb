class Field < ApplicationRecord
  belongs_to :post_field
  belongs_to :post, optional: true
end
