module Cms9
  class Field < ApplicationRecord
    belongs_to :post_field
    belongs_to :post, optional: true
    mount_uploader :image, ImageUploader
  end
end
