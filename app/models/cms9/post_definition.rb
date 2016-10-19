module Cms9
  class PostDefinition < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false },
              length: { minimum: 3 }

    has_many :post_fields, dependent: :destroy
    has_many :posts, dependent: :destroy


    def fields
      if @cache_fields.nil?
        @cache_fields = self.post_fields.map { |field| [field.name, field] }.to_h
      end

      @cache_fields.values
    end

    # Get field by name
    def field(name)
      fields()
      @cache_fields[name]
    end

  end
end
