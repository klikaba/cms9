module Cms9
  # post definition controller
  class PostDefinitionsController < Cms9::ApplicationController
    def index
      @posts = PostDefinition.order('created_at desc')
                             .page(params[:page])
                             .per(20)
    end

    def new
      @post = PostDefinition.new
    end

    def edit
      @post = PostDefinition.find(params[:id])
    end

    # rubocop:disable all
    def create
      @post = PostDefinition.new(post_definition_params)
      @post.user_id = current_user.id

      if PostDefinition.where(name: @post[:name]).blank?
        if @post.save
          @field = PostField.new(name: 'Title', field_type: 'text',
                                 required: true, post_definition_id: @post.id,
                                 user_id: current_user.id)
          if @field.save
            create_post_event
            redirect_to edit_post_definition_path(@post.id)
          end
        else
          render :new
        end
      else
        @post.errors.add(:name, ' Post Type already exist')
        render :new
      end
    end

    def update
      @post = PostDefinition.find(params[:id])
      @post.user_id = current_user.id
      post_definition_name = params[:post_definition][:name]

      field = PostDefinition.where(name: post_definition_name.downcase)

      if field.blank? || @post.name == post_definition_name
        if @post.update(post_definition_params)
          create_post_event
          redirect_to edit_post_definition_path(@post.id)
        else
          render :edit
        end
      else
        @post.errors.add(:name, ' Post Type already exist')
        render :edit
      end
    end

    def destroy
      @post_def = PostDefinition.find(params[:id])
      @posts = Post.where(post_definition_id: params[:id])
      @posts.each do |post|
        Cms9Events.new.create_event('post', post[:id], params[:action],
                                    current_user, post_name(post))
      end
      @posts.destroy_all
      @post_def.destroy
      create_post_def_event(@post_def.name)
      redirect_to post_definitions_path
    end

    private

    def post_name(post)
      Field.where(post_field_id: post.post_definition
                                      .post_fields[0].id,
                  post_id: post.id)[0]['value']
    end

    def create_post_def_event(name)
      Cms9Events.new.create_event('post_definition', @post_def.id,
                                  params[:action], current_user, name)
    end

    def create_post_event
      Cms9Events.new.create_event('post_definition', @post.id,
                                  params[:action], current_user, nil)
    end

    def post_definition_params
      params.require(:post_definition).permit(:name)
    end
  end
end
