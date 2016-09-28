module Cms9
  class PostFieldsController < ApplicationController
    def new
      @post = PostField.new
      @post.post_definition_id = params[:post_definition_id]
    end

    def edit
      @post = PostField.find(params[:id])
      @post_name = params[:post]

      if PostField.all_types.index(params[:type]) != nil
        @post.field_type = params[:type]
      end

      if params[:field_name] != nil
        @post.name = params[:field_name]
      end
    end

    def create
      @field = PostField.new(post_field_params)
      @field.multiple_choices = ''
      values = params[:multi_values]

      values.each_with_index do |value, index|
        if value != ''
          if index == 0
            @field.multiple_choices = value
          elsif
            @field.multiple_choices = @field.multiple_choices + ',' + value
          end
        end
      end

      if @field.save
        redirect_to edit_post_definition_path(:id => @field.post_definition_id)
      end
    end

    def update
      @field = PostField.find(params[:id])

      if @field.update(post_field_params)
        redirect_to edit_post_definition_path(:id => @field.post_definition_id)
      end
    end

    def destroy
      @field = PostField.find(params[:id])
      @field.destroy

      #@field_values = Field.where(post_field_id: params[:id])
      #@field_values.destroy_all

      redirect_to request.referrer
    end

    private
      def post_field_params
        params.require(:post_field).permit(:name, :field_type, :post_definition_id, :required, :multiple_choices)
      end
  end
end
