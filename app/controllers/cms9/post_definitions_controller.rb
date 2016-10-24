module Cms9
  class PostDefinitionsController < Cms9::ApplicationController
    def index
      @posts = PostDefinition.order('created_at desc').page(params[:page]).per(20)
    end

    def new
      @post = PostDefinition.new
    end

    def edit
      @post = PostDefinition.find(params[:id])
    end

    def create
      @post = PostDefinition.new(post_definition_params)

      @post.user_id = current_user.id

      if PostDefinition.where(name: @post[:name]).blank?

        if @post.save
          @field = PostField.new({
            'name': 'Title',
            'field_type': 'text',
            'required': true,
            'post_definition_id': @post.id,
            'user_id': current_user.id
          })
          if @field.save
            Cms9Events.new.create_event('post_definition', @post.id, params[:action], current_user, nil)

            redirect_to edit_post_definition_path(@post.id)
          end
        else
          render :new
        end

      else
        @post.errors.add(:name, " Post Type already exist")
        render :new
      end

    end

    def update
      @post = PostDefinition.find(params[:id])
      @post.user_id = current_user.id

      field = PostDefinition.where(name: params[:post_definition][:name].downcase)

      if field.blank? || @post.name == params[:post_definition][:name]

        if @post.update(post_definition_params)
          Cms9Events.new.create_event('post_definition', @post.id, params[:action], current_user, nil)

          redirect_to edit_post_definition_path(@post.id)
        else
          render :edit
        end

      else
        @post.errors.add(:name, " Post Type already exist")
        render :edit
      end
    end

    def destroy
      @post_def = PostDefinition.find(params[:id])
      @post_def.destroy

      Cms9Events.new.create_event('post_definition', @post_def.id, params[:action], current_user, @post_def.name)

      @posts = Post.where(post_definition_id: params[:id])
      @posts.destroy_all

      redirect_to post_definitions_path
    end

    private
      def post_definition_params
        params.require(:post_definition).permit(:name)
      end
  end
end
