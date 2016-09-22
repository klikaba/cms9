module Cms9
  class PostDefinitionsController < ApplicationController
    def index
      @posts = PostDefinition.all
    end

    def new
      @post = PostDefinition.new
    end

    def edit
      @post = PostDefinition.find(params[:id])
    end

    def create
      @post = PostDefinition.new(post_definition_params)

      if @post.save
        redirect_to post_definitions_path
      else
        render 'new'
      end
    end

    def update
      @post = PostDefinition.find(params[:id])

      if @post.update(post_definition_params)
        redirect_to post_definitions_path
      else
        render 'edit'
      end
    end

    def destroy
      @post = PostDefinition.find(params[:id])
      @post.destroy

      redirect_to post_definitions_path
    end

    private
      def post_definition_params
        params.require(:post_definition).permit(:name)
      end
  end
end
