module Cms9
  class PostDefinition < ApplicationRecord
    validates :name, presence: true,
              length: { minimum: 3 }

    has_many :post_fields, dependent: :destroy
    has_many :posts, dependent: :destroy

    def self.find_type(name)
      return PostDefinition.where(name: name).first
    end
  end
end
