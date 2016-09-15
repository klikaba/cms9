class PostDefinitionsController < ApplicationController
  def new
  end

  def index
    @posts = PostDefinition.all
  end

  def create
    @post = PostDefinition.new(post_definition_params)

    @post.save
    redirect_to post_definitions_path
  end

  def edit
    @post = PostDefinition.find(params[:id])
  end

  def show
    @post = PostDefinition.find(params[:id])
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
