module Cms9
  class PostDefinition < ApplicationRecord
    validates :name, presence: true,
              length: { minimum: 3 }

    has_many :post_fields, dependent: :destroy
  end
end
