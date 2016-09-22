module Cms9
  class PostsController < ApplicationController
    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
      @post.post_definition_id = params[:post_definition_id]

      @post.post_definition.post_fields.each do |post_field|
        @post.fields.build(post_field: post_field)
      end
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to posts_path
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to posts_path
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to posts_path
    end

    private
      def post_params
        params.require(:post).permit(:post_definition_id, fields_attributes: [:id, :post_id, :post_field_id, :value])
      end

  end
end
