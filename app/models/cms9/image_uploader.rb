require "image_processing/mini_magick"

module Cms9
  class ImageUploader < Shrine
    include ImageProcessing::MiniMagick

    plugin :determine_mime_type
    plugin :remove_attachment
    plugin :store_dimensions
    plugin :validation_helpers
    plugin :versions, names: [:original, :thumb]
    plugin :pretty_location

    def process(io, context)
      case context[:phase]
      when :store
        thumb = resize_to_limit!(io.download, 200, 200)
        { original: io, thumb: thumb }
      end
    end
  end
end
