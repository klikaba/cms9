class PostFieldsController < ApplicationController
  def show
    @post = PostField.new
    @post.post_definition_id = params[:id]
    @post_name = params[:post]

    @all_types = ['Text', 'Text Area']

    if @all_types.index(params[:type]) != nil
      @post.field_type = params[:type]
    end

    if params[:field_name] != nil
      @post.name = params[:field_name]
    end
  end

  def create
    @post = PostField.new(post_field_params)

    if @post.save
      redirect_to edit_post_definition_path(:id => @post.post_definition_id)
    end
  end

  def edit
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

    redirect_to request.referrer
  end

  private
    def post_field_params
      params.require(:post_field).permit(:name, :field_type, :post_definition_id)
    end
end