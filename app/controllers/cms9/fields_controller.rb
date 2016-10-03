module Cms9
  class FieldsController < Cms9::ApplicationController
    def update
      @post = Field.find(params[:id])
      @post.update(image_data: nil)
    end
  end
end
