module Cms9
  class PostsController < Cms9::ApplicationController
    def index
      @post_definition = Cms9::PostDefinition.find(params[:post_definition_id])
      @posts = Post.where(post_definition: @post_definition)
                  .order('created_at desc')
                  .page(params[:page])
                  .per(20)
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
        redirect_to posts_path(post_definition_id: @post.post_definition.id)
      else
        render :new
      end
    end

    def edit
      @post = Post.find(params[:id])

      @post.post_definition.post_fields.each do |post_field|
        if @post.fields.where(post_field_id: post_field[:id]).blank?
          @post.fields.build(post_field: post_field)
        end
      end
    end

    def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to posts_path(post_definition_id: @post.post_definition.id)
      else
        render :edit
      end
    end

    def destroy
      @post = Post.find(params[:id])
      post_definition_id = @post.post_definition.id
      @post.destroy

      redirect_to posts_path(post_definition_id: post_definition_id)
    end

    private
      def post_params
        params.require(:post).permit(:post_definition_id, fields_attributes:
                                    [:id, :post_id, :post_field_id, :value, { :value => [] },
                                     :image, :image_uid, :image_name, :remove_image, :image_custom_size])
      end

  end
end
